EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 13
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
NoConn ~ -100 -450
Wire Wire Line
	3400 3500 3300 3500
Wire Wire Line
	3300 3500 3300 2600
Wire Wire Line
	3300 2600 4000 2600
Wire Wire Line
	4000 2600 4000 2700
Wire Wire Line
	6300 2700 6300 2600
Connection ~ 4000 2600
Wire Wire Line
	6900 2700 6900 2600
Wire Wire Line
	6900 2600 6300 2600
Connection ~ 6300 2600
Wire Wire Line
	6900 2600 8150 2600
Wire Wire Line
	8150 2600 8150 3700
Wire Wire Line
	8150 3700 8000 3700
Connection ~ 6900 2600
Wire Wire Line
	8000 4100 8350 4100
Wire Wire Line
	8350 4100 8350 2550
Wire Wire Line
	8350 2550 5500 2550
Wire Wire Line
	5600 2700 5600 2500
Wire Wire Line
	5600 2500 7300 2500
Wire Wire Line
	7300 2500 7300 2700
Wire Wire Line
	6700 2700 6700 2450
Wire Wire Line
	6700 2450 5700 2450
Wire Wire Line
	5700 2450 5700 2700
Wire Wire Line
	5400 2700 5400 2450
Wire Wire Line
	5500 2550 5500 2700
Wire Wire Line
	6300 2600 4000 2600
Entry Wire Line
	5100 2350 5000 2450
Entry Wire Line
	5200 2350 5100 2450
Entry Wire Line
	5300 2350 5200 2450
Entry Wire Line
	5400 2350 5300 2450
Entry Wire Line
	5500 2350 5400 2450
Wire Wire Line
	5000 2450 5000 2700
Wire Wire Line
	5100 2450 5100 2700
Wire Wire Line
	5200 2450 5200 2700
Wire Wire Line
	5300 2450 5300 2700
Entry Bus Bus
	5600 2200 5500 2300
Text HLabel 5600 2200 1    50   BiDi ~ 0
GPIO[1..5]
Wire Bus Line
	5500 2350 5500 2300
Wire Wire Line
	3250 3600 3400 3600
Wire Wire Line
	3250 3800 3400 3800
Wire Wire Line
	3250 3700 3400 3700
Wire Wire Line
	3300 4200 3400 4200
Wire Wire Line
	3300 4300 3400 4300
Wire Wire Line
	4900 2700 4900 2500
Wire Wire Line
	4200 2700 4200 2500
Wire Wire Line
	4300 2700 4300 2500
Wire Wire Line
	4500 2700 4500 2500
Wire Wire Line
	4600 2500 4600 2700
Wire Wire Line
	4700 2700 4700 2500
Wire Wire Line
	4800 2500 4800 2700
Wire Wire Line
	4400 2700 4400 2550
Wire Wire Line
	4400 2550 4100 2550
Wire Wire Line
	4100 2550 4100 2700
Wire Wire Line
	3400 3900 3350 3900
Wire Wire Line
	3350 3900 3350 2550
Wire Wire Line
	3350 2550 4100 2550
Connection ~ 4100 2550
Wire Wire Line
	6800 2700 6800 2450
Wire Wire Line
	6800 2450 7400 2450
Wire Wire Line
	7400 2450 7400 2700
Wire Wire Line
	8000 3900 8250 3900
Wire Wire Line
	8250 3900 8250 2450
Wire Wire Line
	8250 2450 7400 2450
Connection ~ 7400 2450
Wire Wire Line
	6300 5100 6300 5250
Wire Wire Line
	6200 5100 6200 5250
Wire Wire Line
	6100 5250 6100 5100
Wire Wire Line
	5700 5250 5700 5100
Wire Wire Line
	5600 5250 5600 5100
Wire Wire Line
	5200 5250 5200 5100
Wire Wire Line
	5100 5250 5100 5100
Wire Wire Line
	5000 5250 5000 5100
Text HLabel 5000 5250 3    50   Output ~ 0
M1_C
Text HLabel 5100 5250 3    50   Output ~ 0
M1_B
Text HLabel 5200 5250 3    50   Output ~ 0
M1_A
Text HLabel 6100 5250 3    50   Output ~ 0
M0_C
Text HLabel 6200 5250 3    50   Output ~ 0
M0_B
Text HLabel 6300 5250 3    50   Output ~ 0
M0_A
Text HLabel 5600 5250 3    50   Output ~ 0
AUX-
Text HLabel 5700 5250 3    50   Output ~ 0
AUX+
Text HLabel 3300 4200 0    50   Input ~ 0
DC-
Text HLabel 3300 4300 0    50   Input ~ 0
DC+
Wire Wire Line
	3300 3500 3250 3500
Connection ~ 3300 3500
Text HLabel 3250 3500 0    50   Input ~ 0
3V3
Wire Wire Line
	3350 3900 3250 3900
Connection ~ 3350 3900
Text HLabel 3250 3900 0    50   Input ~ 0
GND
Text HLabel 3250 3800 0    50   Input ~ 0
ID
Text HLabel 3250 3700 0    50   Input ~ 0
D+
Text HLabel 3250 3600 0    50   Input ~ 0
D-
$Comp
L Master_Schematic_19-20:ODrive U1
U 1 1 5E268AD1
P 3400 3500
F 0 "U1" H 5700 3150 60  0000 L CNN
F 1 "ODrive" H 5600 3000 60  0000 L CNN
F 2 "" H 3550 3550 60  0001 R CNN
F 3 "" H 3550 3350 60  0001 R CNN
F 4 "ODrive" H 3550 3250 60  0001 R CNN "Field5"
	1    3400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2700 6400 2400
Wire Wire Line
	6400 2400 7000 2400
Wire Wire Line
	7000 2400 7000 2700
Wire Wire Line
	6400 2400 6400 2350
Connection ~ 6400 2400
Text HLabel 6400 2350 1    50   Input ~ 0
5V
Wire Wire Line
	6500 2700 6500 2350
Wire Wire Line
	6600 2700 6600 2350
Wire Wire Line
	6700 2350 6700 2450
Connection ~ 6700 2450
Text HLabel 6500 2350 1    50   BiDi ~ 0
M1_ENC_A
Text HLabel 6600 2350 1    50   BiDi ~ 0
M1_ENC_B
Text HLabel 6700 2350 1    50   BiDi ~ 0
M1_ENC_Z
Wire Wire Line
	7300 2500 7300 2350
Connection ~ 7300 2500
Wire Wire Line
	7200 2350 7200 2700
Wire Wire Line
	7100 2700 7100 2350
Text HLabel 7100 2350 1    50   BiDi ~ 0
M0_ENC_A
Text HLabel 7200 2350 1    50   BiDi ~ 0
M0_ENC_B
Text HLabel 7300 2350 1    50   BiDi ~ 0
M0_ENC_Z
Text HLabel 4200 2500 1    50   BiDi ~ 0
CAN_H
Text HLabel 4300 2500 1    50   BiDi ~ 0
CAN_L
Text HLabel 4500 2500 1    50   Input ~ 0
AVCC
Text HLabel 4600 2500 1    50   Input ~ 0
AGND
Text HLabel 4700 2500 1    50   BiDi ~ 0
SCK
Text HLabel 4800 2500 1    50   BiDi ~ 0
MISO
Text HLabel 4900 2500 1    50   BiDi ~ 0
MOSI
Wire Wire Line
	8000 3800 8400 3800
Wire Wire Line
	8000 4000 8400 4000
Text HLabel 8400 4000 2    50   BiDi ~ 0
SWD
Text HLabel 8400 3800 2    50   BiDi ~ 0
SWC
Wire Bus Line
	5100 2350 5500 2350
$EndSCHEMATC
