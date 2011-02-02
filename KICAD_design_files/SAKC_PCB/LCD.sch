EESchema Schematic File Version 2  date Fri 23 Apr 2010 12:32:33 PM COT
LIBS:power,device,conn,linear,regul,74xx,cmos4000,adc-dac,memory,xilinx,special,microcontrollers,dsp,microchip,analog_switches,motorola,texas,intel,audio,interface,digital-audio,philips,display,cypress,siliconi,contrib,valves,./SAKC.cache
EELAYER 24  0
EELAYER END
$Descr A4 11700 8267
Sheet 9 9
Title ""
Date "23 feb 2010"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	6720 2730 6720 2800
Wire Wire Line
	4350 3000 4400 3000
Wire Wire Line
	5750 3150 5900 3150
Wire Wire Line
	5750 3050 5900 3050
Wire Wire Line
	5750 2950 5900 2950
Wire Wire Line
	3700 2000 3550 2000
Connection ~ 5600 2100
Wire Wire Line
	5500 2050 5500 2000
Wire Wire Line
	5500 2000 5600 2000
Wire Wire Line
	5600 2000 5600 2450
Connection ~ 5600 2150
Wire Wire Line
	5600 2150 5900 2150
Connection ~ 5750 2300
Wire Wire Line
	5900 2300 5750 2300
Connection ~ 5750 2250
Wire Wire Line
	5750 2250 5750 2400
Wire Wire Line
	5750 2400 5900 2400
Wire Wire Line
	5200 2250 5200 2000
Connection ~ 4800 2000
Wire Wire Line
	4800 2050 4800 2000
Wire Wire Line
	3550 2400 3850 2400
Wire Wire Line
	3850 2400 3850 2500
Wire Wire Line
	2850 2900 3150 2900
Wire Wire Line
	2850 2700 3150 2700
Wire Wire Line
	2850 2500 3150 2500
Wire Wire Line
	5900 2850 4050 2850
Wire Wire Line
	4050 2850 4050 3100
Wire Wire Line
	4050 3100 3550 3100
Wire Wire Line
	5900 2750 3950 2750
Wire Wire Line
	3950 2750 3950 2900
Wire Wire Line
	3950 2900 3550 2900
Wire Wire Line
	5900 2650 3850 2650
Wire Wire Line
	3850 2650 3850 2700
Wire Wire Line
	3850 2700 3550 2700
Wire Wire Line
	5900 2550 3800 2550
Wire Wire Line
	3800 2550 3800 2500
Wire Wire Line
	3800 2500 3550 2500
Connection ~ 5850 3250
Wire Wire Line
	5800 3300 5800 3250
Wire Wire Line
	5800 3250 5900 3250
Wire Wire Line
	5900 3200 5850 3200
Wire Wire Line
	5850 3200 5850 3250
Wire Wire Line
	3850 2500 5900 2500
Wire Wire Line
	3550 2600 5900 2600
Wire Wire Line
	3550 2800 3900 2800
Wire Wire Line
	3900 2800 3900 2700
Wire Wire Line
	3900 2700 5900 2700
Wire Wire Line
	3550 3000 4000 3000
Wire Wire Line
	4000 3000 4000 2800
Wire Wire Line
	4000 2800 5900 2800
Wire Wire Line
	5200 2250 5900 2250
Wire Wire Line
	4450 2000 4450 2050
Wire Wire Line
	5900 2450 4450 2450
Connection ~ 4800 2450
Wire Wire Line
	5900 2350 5750 2350
Connection ~ 5750 2350
Connection ~ 5600 2450
Wire Wire Line
	5600 2100 5900 2100
Wire Wire Line
	5900 2200 5600 2200
Connection ~ 5600 2200
Wire Wire Line
	5200 2000 4300 2000
Connection ~ 4450 2000
Wire Wire Line
	5750 3000 5900 3000
Wire Wire Line
	5750 3100 5900 3100
Wire Wire Line
	5000 3000 5100 3000
Wire Wire Line
	5100 3000 5100 2900
Wire Wire Line
	5100 2900 5900 2900
Wire Bus Line
	2750 2300 2750 3100
Wire Bus Line
	2750 3100 2650 3100
Wire Wire Line
	2850 3100 3150 3100
Wire Wire Line
	3150 3000 2850 3000
Wire Wire Line
	3150 2800 2850 2800
Wire Wire Line
	3150 2600 2850 2600
Wire Wire Line
	3150 2400 2850 2400
Text HLabel 6720 2730 3    20   BiDi ~ 0
GND
Text GLabel 6720 2800 1    20   BiDi ~ 0
GND
Text GLabel 5800 3300 1    20   BiDi ~ 0
GND
Text GLabel 5500 2050 1    20   BiDi ~ 0
GND
Text Label 2850 3000 0    20   ~ 0
LCD_D1
Text Label 2850 3100 0    20   ~ 0
LCD_D0
Text HLabel 2650 3100 0    20   BiDi ~ 0
LCD_D[0..7]
Entry Wire Line
	2750 3000 2850 3100
Entry Wire Line
	2750 2900 2850 3000
Entry Wire Line
	2750 2800 2850 2900
Entry Wire Line
	2750 2700 2850 2800
Entry Wire Line
	2750 2600 2850 2700
Entry Wire Line
	2750 2500 2850 2600
Entry Wire Line
	2750 2400 2850 2500
Entry Wire Line
	2750 2300 2850 2400
Text Label 2850 2900 0    20   ~ 0
LCD_D2
Text Label 2850 2800 0    20   ~ 0
LCD_D3
Text Label 2850 2700 0    20   ~ 0
LCD_D4
Text Label 2850 2600 0    20   ~ 0
LCD_D5
Text Label 2850 2500 0    20   ~ 0
LCD_D6
Text Label 2850 2400 0    20   ~ 0
LCD_D7
Text HLabel 3550 2000 0    20   BiDi ~ 0
3.3V
Text HLabel 5750 3150 0    20   BiDi ~ 0
LCD_SDA
Text HLabel 5750 3100 0    20   BiDi ~ 0
LCD_SCL
Text HLabel 5750 3050 0    20   BiDi ~ 0
LCD_DE
Text HLabel 5750 3000 0    20   BiDi ~ 0
LCD_HSYNC
Text HLabel 5750 2950 0    20   BiDi ~ 0
LCD_VSYNC
Text HLabel 4350 3000 0    20   BiDi ~ 0
LCD_CLK
$Comp
L FPCCON24 J4
U 1 1 4B782402
P 6250 3350
F 0 "J4" H 6100 4700 60  0000 C CNN
F 1 "FPCCON24" H 6250 3350 50  0000 C CNN
	1    6250 3350
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L11
U 1 1 4B782344
P 4700 3000
F 0 "L11" V 4650 3000 40  0000 C CNN
F 1 "PZ1608D221" V 4800 3000 40  0000 C CNN
	1    4700 3000
	0    -1   -1   0   
$EndComp
$Comp
L INDUCTOR L10
U 1 1 4B7822E4
P 4000 2000
F 0 "L10" V 3950 2000 40  0000 C CNN
F 1 "HZ0805C202R-00" V 4100 2000 40  0000 C CNN
	1    4000 2000
	0    -1   -1   0   
$EndComp
$Comp
L C C59
U 1 1 4B78225F
P 4450 2250
F 0 "C59" H 4500 2350 50  0000 L CNN
F 1 "100n" H 4500 2150 50  0000 L CNN
	1    4450 2250
	1    0    0    1   
$EndComp
$Comp
L C C58
U 1 1 4B782255
P 4800 2250
F 0 "C58" H 4850 2350 50  0000 L CNN
F 1 "10u" H 4850 2150 50  0000 L CNN
	1    4800 2250
	1    0    0    1   
$EndComp
$Comp
L R_PACK4 RN1
U 1 1 4B7820D3
P 3350 2350
F 0 "RN1" H 3350 2800 40  0000 C CNN
F 1 "33/5%" H 3350 2900 40  0000 C CNN
	1    3350 2350
	1    0    0    1   
$EndComp
$Comp
L R_PACK4 RN2
U 1 1 4B7820E7
P 3350 2750
F 0 "RN2" H 3350 2650 40  0000 C CNN
F 1 "33/5%" H 3350 2700 40  0000 C CNN
	1    3350 2750
	1    0    0    1   
$EndComp
$EndSCHEMATC
