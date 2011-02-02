/****************************************************************************
**
** Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial Usage
** Licensees holding valid Qt Commercial licenses may use this file in
** accordance with the Qt Commercial License Agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Nokia.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights.  These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
** If you have questions regarding the use of this file, please contact
** Nokia at qt-info@nokia.com.
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QDir>
#include <QtXml>

#include "diagramscene.h"
#include "diagramtextitem.h"
#include "lineitem.h"
#include "arrow.h"
#include <QtGui>

class DiagramScene;

QT_BEGIN_NAMESPACE
class QAction;
class QToolBox;
class QSpinBox;
class QComboBox;
class QFontComboBox;
class QButtonGroup;
class QLineEdit;
class QGraphicsTextItem;
class QFont;
class QToolButton;
class QAbstractButton;
class QGraphicsView;
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
   MainWindow();
   QString filePath() const
       { return myFilePath;}
   QString currentDir() const
   { return QDir::currentPath();}

   void saveIfNeeded();
   void updateProt();

   QStatusBar *statusBar;

   QLabel  * headerLabel;
   QTextEdit * headerTextEdit;
   QLabel  * initLabel;
   QTextEdit * initTextEdit;
   QLabel  * prototypeLabel;
   QTextEdit * blockTextEdit;
   QLabel  * extraLabel;
   QTextEdit * extraTextEdit;

private slots:
    void deleteItem();
    void sceneScaleChanged(const QString &scale);
    void about();
    bool newDiagram(QString pathFile="");
    bool openDiagram();
    bool saveDiagram();
    bool saveAsDiagram();
    void buttonGroupClicked(int id);
    void textInserted(QGraphicsTextItem*);

private:
    void createToolBox();
    void createActions();
    void createMenus();
    void createToolbars();

    QWidget *createToolButton(int ID, QString type,QIcon icon);

    DiagramScene *scene;
    QGraphicsView *view;

    QAction *newAction;
    QAction *saveAction;
    QAction *saveAsAction;
    QAction *openAction;

    QAction *exitAction;
    QAction *addAction;
    QAction *deleteAction;

    QAction *aboutAction;

    QMenu *fileMenu;
    QMenu *itemMenu;
    QMenu *aboutMenu;

    QToolBar *fileToolBar;
    QToolBar *editToolBar;

    QToolBox *toolBox;

    QComboBox *sceneScaleCombo;

    QButtonGroup *buttonGroup;

    int selectedButton;

    QString myFilePath;

};


#endif
