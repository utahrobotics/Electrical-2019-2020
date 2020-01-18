EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Master_Schematic_19-20:Roboclaw RC1
U 1 1 5E2411B6
P 4550 3400
F 0 "RC1" H 6644 3053 60  0000 L CNN
F 1 "Roboclaw" H 6644 2947 60  0000 L CNN
F 2 "" H 4700 3450 60  0001 R CNN
F 3 "" H 4700 3250 60  0001 R CNN
F 4 "Roboclaw" H 4950 3150 60  0001 R CNN "Field5"
	1    4550 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2900 5400 2800
Wire Wire Line
	5400 2800 5500 2800
Wire Wire Line
	6000 2900 6000 2800
Connection ~ 6000 2800
Wire Wire Line
	6000 2800 7250 2800
Wire Wire Line
	5900 2900 5900 2800
Connection ~ 5900 2800
Wire Wire Line
	5900 2800 6000 2800
Wire Wire Line
	5800 2900 5800 2800
Connection ~ 5800 2800
Wire Wire Line
	5800 2800 5900 2800
Wire Wire Line
	5700 2900 5700 2800
Connection ~ 5700 2800
Wire Wire Line
	5700 2800 5800 2800
Wire Wire Line
	5600 2900 5600 2800
Connection ~ 5600 2800
Wire Wire Line
	5600 2800 5700 2800
Wire Wire Line
	5500 2900 5500 2800
Connection ~ 5500 2800
Wire Wire Line
	5500 2800 5600 2800
Wire Wire Line
	5400 4850 5400 4700
Wire Wire Line
	5500 4700 5500 4850
Connection ~ 5500 4850
Wire Wire Line
	5500 4850 5400 4850
Wire Wire Line
	5600 4850 5600 4700
Connection ~ 5600 4850
Wire Wire Line
	5600 4850 5500 4850
Wire Wire Line
	5700 4700 5700 4850
Connection ~ 5700 4850
Wire Wire Line
	5700 4850 5600 4850
Wire Wire Line
	5800 4700 5800 4850
Connection ~ 5800 4850
Wire Wire Line
	5800 4850 5700 4850
Wire Wire Line
	5900 4700 5900 4850
Connection ~ 5900 4850
Wire Wire Line
	5900 4850 5800 4850
Wire Wire Line
	6000 4700 6000 4850
Wire Wire Line
	6000 4850 5900 4850
Wire Wire Line
	5700 5000 5700 4850
Wire Wire Line
	5700 2650 5700 2800
Text HLabel 5700 2650 1    50   Input ~ 0
+5V
Text HLabel 5700 5000 3    50   Input ~ 0
GND
Wire Wire Line
	6850 3700 6600 3700
Text HLabel 6850 3700 2    50   Input ~ 0
FAN
Wire Wire Line
	6600 3600 7250 3600
Wire Wire Line
	7250 3600 7250 2800
Wire Wire Line
	6850 3500 6600 3500
Wire Wire Line
	6850 3400 6600 3400
Text HLabel 6850 3400 2    50   Input ~ 0
LBIN+
Text HLabel 6850 3500 2    50   Input ~ 0
LBIN-
Wire Wire Line
	4650 4000 4800 4000
Wire Wire Line
	4650 3900 4800 3900
Wire Wire Line
	4650 4200 4800 4200
Wire Wire Line
	4650 4100 4800 4100
Wire Wire Line
	4650 3800 4800 3800
Wire Wire Line
	4650 3700 4800 3700
Wire Wire Line
	4650 3600 4800 3600
Wire Wire Line
	4650 3500 4800 3500
Wire Wire Line
	4650 3400 4800 3400
Text HLabel 4650 3400 0    50   Input ~ 0
S1
Text HLabel 4650 3500 0    50   Input ~ 0
S2
Text HLabel 4650 3600 0    50   Input ~ 0
S3
Text HLabel 4650 3700 0    50   Input ~ 0
S4
Text HLabel 4650 3800 0    50   Input ~ 0
S5
Text HLabel 4650 3900 0    50   Input ~ 0
EN1A
Text HLabel 4650 4000 0    50   Input ~ 0
EN1B
Text HLabel 4650 4100 0    50   Input ~ 0
EN2A
Text HLabel 4650 4200 0    50   Input ~ 0
EN2B
$EndSCHEMATC
