/*
 * $Id: parse.c 1812 2010-07-18 18:28:21Z vapier $
 *
 * Copyright (C) 2002, 2003 ETC s.r.o.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
 * 02111-1307, USA.
 *
 * Written by Marcel Telka <marcel@telka.sk>, 2002, 2003.
 * Modified by Ajith Kumar P.C <ajithpc@kila.com>, 20/09/2006.
 * Modified by Ville Voipio <vv@iki.fi>, 7-May-2008
 *
 */

#include <sysdep.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <errno.h>

#include <urjtag/log.h>
#include <urjtag/error.h>
#include <urjtag/chain.h>
#include <urjtag/parse.h>
#include <urjtag/cmd.h>
#include <urjtag/jtag.h>
#include <urjtag/bsdl.h>

#define MAXINPUTLINE 600        /* Maximum input line length */



int
urj_parse_line (urj_chain_t *chain, char *line)
{
    int l, i, r, tcnt;
    int escape = 0, quote_single = 0, quote_double = 0;
    char **a;
    char *c, *d;
    char *sline;

    if (line == NULL)
    {
        urj_error_set (URJ_ERROR_INVALID, "NULL line");
        return URJ_STATUS_FAIL;
    }
    l = strlen (line);
    if (l == 0)
        return URJ_STATUS_OK;

    /* allocate as many chars as in the input line; this will be enough in all cases */
    sline = malloc (l + 1);
    if (sline == NULL)
    {
        urj_error_set (URJ_ERROR_OUT_OF_MEMORY, "malloc(%zd) fails",
                       (size_t) (l + 1));
        return URJ_STATUS_FAIL;
    }

    /* count and copy the tokens */
    c = line;
    d = sline;
    tcnt = 0;
    while (1)
    {
        /* eat up leading spaces */
        while (isspace (*c))
            c++;

        /* if the command ends here (either by NUL or comment) */
        if (*c == '\0' || *c == '#')
            break;

        /* copy the meat (non-space, non-NUL), consider escape and quotes */
        while ((!isspace (*c)
                || escape
                || quote_single
                || quote_double) && *c != '\0')
        {
            if (*c == '\'' && !escape && !quote_double)
            {
                quote_single ^= 1;
                c++;
            }
            else if (*c == '"' && !escape && !quote_single)
            {
                quote_double ^= 1;
                c++;
            }
            else if (*c == '\\' && !escape)
            {
                escape = 1;
                c++;
            }
            else
            {
                escape = 0;
                *d++ = *c++;
            }
        }
        /* mark the end to the destination string */
        *d++ = '\0';
        tcnt++;
    }

    if (tcnt == 0)
    {
        free (sline);
        return URJ_STATUS_OK;
    }

    /* allocate the token pointer table */
    a = malloc ((tcnt + 1) * sizeof (char *));
    if (a == NULL)
    {
        urj_error_set (URJ_ERROR_OUT_OF_MEMORY, "malloc(%zd) fails",
                       (size_t) ((tcnt + 1) * sizeof (char *)));
        return URJ_STATUS_FAIL;
    }

    /* find the starting points for the tokens */
    d = sline;
    for (i = 0; i < tcnt; i++)
    {
        a[i] = d;
        while (*d++ != '\0')
            ;
    }
    a[tcnt] = NULL;

    r = urj_cmd_run (chain, a);
    urj_log (URJ_LOG_LEVEL_DEBUG, "Return in urj_parse_line r=%d\n", r);
    free (a);
    free (sline);

    return r;
}


int
urj_parse_stream (urj_log_level_t ll, urj_chain_t *chain, FILE *f)
{
    char inputline[MAXINPUTLINE + 1];
    int go = 1, i, c, lnr, clip, found_comment;

    /* read the stream line-by-line until EOF or "quit" */
    lnr = 0;
    do
    {
        i = 0;
        clip = 0;
        found_comment = 0;

        /* read stream until '\n' or EOF, copy at most MAXINPUTLINE-1 chars */
        while (1)
        {
            c = fgetc (f);
            if (c == EOF || c == '\n')
                break;
            if (c == '#')
                found_comment = 1;
            if (i < sizeof (inputline) - 1)
                inputline[i++] = c;
            else
                clip = 1;
        }
        inputline[i] = '\0';
        lnr++;
        if (clip && !found_comment)
            urj_warning ("line %d exceeds %zd characters, clipped\n", lnr,
                         sizeof (inputline) - 1);
        go = urj_parse_line (chain, inputline);
        if (go == URJ_STATUS_FAIL)
        {
            urj_log (ll, "Error: %s; command '%s'\n", urj_error_describe(), inputline);
            urj_error_reset ();
        }
        urj_tap_chain_flush (chain);
    }
    while (go != URJ_STATUS_MUST_QUIT && c != EOF);

    return go;
}

int
urj_parse_file (urj_log_level_t ll, urj_chain_t *chain, const char *filename)
{
    FILE *f;
    int go;

    f = fopen (filename, "rb");
    if (!f)
    {
        urj_error_IO_set ("Cannot open file '%s' to parse", filename);
        return URJ_STATUS_FAIL;
    }

    go = urj_parse_stream (ll, chain, f);

    fclose (f);
    urj_log (URJ_LOG_LEVEL_DEBUG, "File Closed go=%d\n", go);

    return go;
}

int
urj_parse_include (urj_chain_t *chain, const char *filename, int ignore_path)
{
    char *path = NULL;
    int r = URJ_STATUS_OK;

    if (! ignore_path)
    {
        /* If "filename" begins with a slash, or dots followed by a slash,
         * assume that user wants to ignore the search path after all */
        const char *slashdots = filename;

#ifdef __MINGW32__
        if (isalpha (*slashdots) && slashdots[1] == ':')
            slashdots += 2;
#endif
        while (*slashdots == '.')
            slashdots++;
        ignore_path = (*slashdots == '/' || *slashdots == '\\');
    }

    if (! ignore_path)
    {
        const char *jtag_data_dir = urj_get_data_dir ();
        size_t len;

        path = malloc (len = strlen (jtag_data_dir) + strlen (filename) + 2);
        if (path == NULL)
        {
            urj_error_set (URJ_ERROR_OUT_OF_MEMORY, "malloc(%zd) fails", len);
            return URJ_STATUS_FAIL;
        }
        snprintf (path, len, "%s/%s", jtag_data_dir, filename);

        filename = path;
    }

#ifdef ENABLE_BSDL
    /* perform a test read to check for BSDL syntax */
    if (urj_bsdl_read_file (chain, filename, URJ_BSDL_MODE_INCLUDE1, NULL) >= 0)
    {
        // @@@@ RFHH ToDo: let urj_bsdl_read_file also return URJ_STATUS_...
        /* it seems to be a proper BSDL file, so re-read and execute */
        if (urj_bsdl_read_file (chain, filename, URJ_BSDL_MODE_INCLUDE2,
                                NULL) < 0)
            // retain errno
            r = URJ_STATUS_FAIL;
    }
    else
#endif
    {
        r = urj_parse_file (URJ_LOG_LEVEL_NORMAL, chain, filename);
    }

    free (path);

    return r;
}

