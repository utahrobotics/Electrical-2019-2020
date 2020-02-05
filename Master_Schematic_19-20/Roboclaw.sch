EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 14
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	6050 2100 6050 2000
Wire Wire Line
	6050 2000 6150 2000
Wire Wire Line
	6650 2100 6650 2000
Wire Wire Line
	6550 2100 6550 2000
Connection ~ 6550 2000
Wire Wire Line
	6550 2000 6650 2000
Wire Wire Line
	6450 2100 6450 2000
Connection ~ 6450 2000
Wire Wire Line
	6450 2000 6550 2000
Wire Wire Line
	6350 2100 6350 2000
Connection ~ 6350 2000
Wire Wire Line
	6350 2000 6450 2000
Wire Wire Line
	6250 2100 6250 2000
Connection ~ 6250 2000
Wire Wire Line
	6250 2000 6350 2000
Wire Wire Line
	6150 2100 6150 2000
Connection ~ 6150 2000
Wire Wire Line
	6150 2000 6250 2000
Wire Wire Line
	5850 5150 5850 5000
Wire Wire Line
	5950 5000 5950 5150
Connection ~ 5950 5150
Wire Wire Line
	5950 5150 5850 5150
Wire Wire Line
	6050 5150 6050 5000
Connection ~ 6050 5150
Wire Wire Line
	6050 5150 5950 5150
Wire Wire Line
	6150 5000 6150 5150
Connection ~ 6150 5150
Wire Wire Line
	6150 5150 6050 5150
Wire Wire Line
	6250 5000 6250 5150
Connection ~ 6250 5150
Wire Wire Line
	6250 5150 6150 5150
Wire Wire Line
	6350 5000 6350 5150
Connection ~ 6350 5150
Wire Wire Line
	6350 5150 6250 5150
Wire Wire Line
	6450 5000 6450 5150
Wire Wire Line
	6450 5150 6350 5150
Text HLabel 4800 2900 0    50   Input ~ 0
+5V
Text HLabel 4800 3000 0    50   Input ~ 0
GND
Text HLabel 5750 1850 1    50   Input ~ 0
FAN
Text HLabel 4800 3200 0    50   Input ~ 0
LBIN+
Text HLabel 4800 3300 0    50   Input ~ 0
LBIN-
Text HLabel 4800 4000 0    50   Input ~ 0
S1
Text HLabel 4800 4100 0    50   Input ~ 0
S2
Text HLabel 4800 4200 0    50   Input ~ 0
S3
Text HLabel 4800 4300 0    50   Input ~ 0
S4
Text HLabel 4800 4400 0    50   Input ~ 0
S5
Text HLabel 4800 3500 0    50   Input ~ 0
EN1A
Text HLabel 4800 3600 0    50   Input ~ 0
EN1B
Text HLabel 4800 3700 0    50   Input ~ 0
EN2A
Text HLabel 4800 3800 0    50   Input ~ 0
EN2B
Wire Wire Line
	6050 2000 5850 2000
Wire Wire Line
	5850 2000 5850 2100
Connection ~ 6050 2000
Wire Wire Line
	5050 2900 4900 2900
Wire Wire Line
	4900 2900 4900 2000
Wire Wire Line
	4900 2000 5850 2000
Connection ~ 5850 2000
Wire Wire Line
	5750 1850 5750 2100
Wire Wire Line
	5050 3000 4900 3000
Wire Wire Line
	4900 3000 4900 5150
Wire Wire Line
	4900 5150 5850 5150
Connection ~ 5850 5150
Wire Wire Line
	4800 3200 5050 3200
Wire Wire Line
	4800 3300 5050 3300
Wire Wire Line
	4800 3500 5050 3500
Wire Wire Line
	5050 3600 4800 3600
Wire Wire Line
	4800 3700 5050 3700
Wire Wire Line
	5050 3800 4800 3800
Wire Wire Line
	4800 4000 5050 4000
Wire Wire Line
	5050 4100 4800 4100
Wire Wire Line
	4800 4200 5050 4200
Wire Wire Line
	4800 4300 5050 4300
Wire Wire Line
	5050 4400 4800 4400
Text HLabel 7550 3200 2    50   Output ~ 0
M1A
Text HLabel 7550 3300 2    50   Output ~ 0
M1B
Text HLabel 7550 3800 2    50   Output ~ 0
M2B
Text HLabel 7550 3900 2    50   Output ~ 0
M2A
Text HLabel 7550 3500 2    50   Input ~ 0
B+
Text HLabel 7550 3600 2    50   Input ~ 0
B-
Wire Wire Line
	7350 3200 7550 3200
Wire Wire Line
	7550 3300 7350 3300
Wire Wire Line
	7350 3500 7550 3500
Wire Wire Line
	7550 3600 7350 3600
Wire Wire Line
	7350 3800 7550 3800
Wire Wire Line
	7550 3900 7350 3900
Text HLabel 4800 2700 0    50   BiDi ~ 0
RX0
Text HLabel 4800 2800 0    50   BiDi ~ 0
TX0
Wire Wire Line
	4800 2700 5050 2700
Wire Wire Line
	5050 2800 4800 2800
Wire Wire Line
	4800 2900 4900 2900
Connection ~ 4900 2900
Wire Wire Line
	4900 3000 4800 3000
Connection ~ 4900 3000
$Comp
L Master_Schematic_19-20:Roboclaw U1
U 1 1 5E2D947F
P 5050 2700
AR Path="/5E23EE32/5E2D947F" Ref="U1"  Part="1" 
AR Path="/5E2E2A99/5E2D947F" Ref="U?"  Part="1" 
AR Path="/5E2EF843/5E2D947F" Ref="U?"  Part="1" 
F 0 "U?" H 7394 1903 60  0000 L CNN
F 1 "Roboclaw" H 7394 1797 60  0000 L CNN
F 2 "" H 5200 2750 60  0001 R CNN
F 3 "" H 5200 2550 60  0001 R CNN
F 4 "Roboclaw" H 5200 2450 60  0001 R CNN "Field5"
	1    5050 2700
	1    0    0    -1  
$EndComp
$EndSCHEMATC
