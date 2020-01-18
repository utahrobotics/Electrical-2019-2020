EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
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
	3000 1950 3000 2050
Wire Wire Line
	6550 2150 6550 2200
Wire Wire Line
	6550 1550 6550 1600
Wire Wire Line
	6600 2150 6550 2150
Wire Wire Line
	6600 1550 6550 1550
Wire Wire Line
	6600 850  6450 850 
Wire Wire Line
	4350 2050 5300 2050
Wire Wire Line
	5300 2050 5300 1800
Wire Wire Line
	5300 1800 5150 1800
Wire Wire Line
	4350 1000 4350 2050
Wire Wire Line
	5150 1900 5200 1900
Wire Wire Line
	5200 1900 5200 1950
Wire Wire Line
	5150 1100 6450 1100
Wire Wire Line
	6450 1100 6450 850 
Wire Wire Line
	3500 1950 3500 2050
Wire Wire Line
	4250 1000 4350 1000
Wire Wire Line
	3000 1550 3000 1400
Wire Wire Line
	3500 1400 3500 1550
Wire Wire Line
	3000 1100 3000 1000
Wire Wire Line
	3000 1000 3500 1000
Wire Wire Line
	3500 1100 3500 1000
Connection ~ 3500 1000
Wire Wire Line
	3500 1000 3650 1000
$Comp
L Device:Fuse F1
U 1 1 5E23AA57
P 3000 1250
F 0 "F1" H 3060 1296 50  0000 L CNN
F 1 "Fuse" H 3060 1205 50  0000 L CNN
F 2 "" V 2930 1250 50  0001 C CNN
F 3 "~" H 3000 1250 50  0001 C CNN
F 4 "R" H 3000 1250 50  0001 C CNN "Spice_Primitive"
F 5 "0.1" H 3000 1250 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3000 1250 50  0001 C CNN "Spice_Netlist_Enabled"
	1    3000 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F2
U 1 1 5E233628
P 3500 1250
F 0 "F2" H 3560 1296 50  0000 L CNN
F 1 "Fuse" H 3560 1205 50  0000 L CNN
F 2 "" V 3430 1250 50  0001 C CNN
F 3 "~" H 3500 1250 50  0001 C CNN
F 4 "R" H 3500 1250 50  0001 C CNN "Spice_Primitive"
F 5 "0.1" H 3500 1250 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3500 1250 50  0001 C CNN "Spice_Netlist_Enabled"
	1    3500 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery BT1
U 1 1 5E24B0F3
P 3000 1750
F 0 "BT1" H 3108 1796 50  0000 L CNN
F 1 "Battery" H 3108 1705 50  0000 L CNN
F 2 "" V 3000 1810 50  0001 C CNN
F 3 "~" V 3000 1810 50  0001 C CNN
F 4 "V" H 3000 1750 50  0001 C CNN "Spice_Primitive"
F 5 "dc 22" H 3000 1750 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3000 1750 50  0001 C CNN "Spice_Netlist_Enabled"
	1    3000 1750
	1    0    0    -1  
$EndComp
$Comp
L pspice:0 #GND?
U 1 1 5E235B8F
P 3500 2050
F 0 "#GND?" H 3500 1950 50  0001 C CNN
F 1 "0" H 3500 1950 50  0000 C CNN
F 2 "" H 3500 2050 50  0001 C CNN
F 3 "~" H 3500 2050 50  0001 C CNN
	1    3500 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery BT2
U 1 1 5E23456A
P 3500 1750
F 0 "BT2" H 3608 1796 50  0000 L CNN
F 1 "Battery" H 3608 1705 50  0000 L CNN
F 2 "" V 3500 1810 50  0001 C CNN
F 3 "~" V 3500 1810 50  0001 C CNN
F 4 "V" H 3500 1750 50  0001 C CNN "Spice_Primitive"
F 5 "dc 22" H 3500 1750 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3500 1750 50  0001 C CNN "Spice_Netlist_Enabled"
	1    3500 1750
	1    0    0    -1  
$EndComp
$Comp
L pspice:0 #GND?
U 1 1 5E229C43
P 5200 1950
F 0 "#GND?" H 5200 1850 50  0001 C CNN
F 1 "0" H 5200 2039 50  0000 C CNN
F 2 "" H 5200 1950 50  0001 C CNN
F 3 "~" H 5200 1950 50  0001 C CNN
	1    5200 1950
	1    0    0    -1  
$EndComp
$Comp
L Master_Schematic_19-20:PDB U2
U 1 1 5E2149E8
P 4250 1100
F 0 "U2" H 4806 1390 60  0000 C CNN
F 1 "PDB" H 4806 1284 60  0000 C CNN
F 2 "" H 4450 1150 60  0001 L CNN
F 3 "" H 4450 950 60  0001 L CNN
F 4 "Power Distribution Board" H 4450 850 60  0001 L CNN "Field5"
	1    4250 1100
	1    0    0    -1  
$EndComp
$Comp
L pspice:0 #GND?
U 1 1 5E228055
P 6550 1600
F 0 "#GND?" H 6550 1500 50  0001 C CNN
F 1 "0" H 6550 1689 50  0000 C CNN
F 2 "" H 6550 1600 50  0001 C CNN
F 3 "~" H 6550 1600 50  0001 C CNN
	1    6550 1600
	1    0    0    -1  
$EndComp
$Comp
L pspice:0 #GND?
U 1 1 5E227C01
P 6550 2200
F 0 "#GND?" H 6550 2100 50  0001 C CNN
F 1 "0" H 6550 2289 50  0000 C CNN
F 2 "" H 6550 2200 50  0001 C CNN
F 3 "~" H 6550 2200 50  0001 C CNN
	1    6550 2200
	1    0    0    -1  
$EndComp
$Comp
L pspice:0 #GND?
U 1 1 5E220791
P 3000 2050
F 0 "#GND?" H 3000 1950 50  0001 C CNN
F 1 "0" H 3000 1950 50  0000 C CNN
F 2 "" H 3000 2050 50  0001 C CNN
F 3 "~" H 3000 2050 50  0001 C CNN
	1    3000 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:CircuitBreaker_1P CBBT
U 1 1 5E1E8E58
P 3950 1000
F 0 "CBBT" V 3685 1000 50  0000 C CNN
F 1 "CircuitBreaker_1P" V 3776 1000 50  0000 C CNN
F 2 "" H 3950 1000 50  0001 C CNN
F 3 "~" H 3950 1000 50  0001 C CNN
F 4 "R" H 3950 1000 50  0001 C CNN "Spice_Primitive"
F 5 "0.1" H 3950 1000 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3950 1000 50  0001 C CNN "Spice_Netlist_Enabled"
	1    3950 1000
	0    1    1    0   
$EndComp
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5E1E7F79
P 1750 5800
F 0 "A1" H 1750 4711 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 1750 4620 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 1750 5800 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 1750 5800 50  0001 C CNN
	1    1750 5800
	1    0    0    -1  
$EndComp
$Comp
L Master_Schematic_19-20:BB U3
U 1 1 5E247EAB
P 6600 2050
F 0 "U3" H 7100 2340 60  0000 C CNN
F 1 "BB" H 7100 2234 60  0000 C CNN
F 2 "" H 6800 2100 60  0001 L CNN
F 3 "" H 6800 1900 60  0001 L CNN
F 4 "Buck Booster" H 6800 1800 60  0001 L CNN "Field5"
F 5 "X" H 6600 2050 50  0001 C CNN "Spice_Primitive"
F 6 "BB5V" H 6600 2050 50  0001 C CNN "Spice_Model"
F 7 "Y" H 6600 2050 50  0001 C CNN "Spice_Netlist_Enabled"
F 8 "Master_Schematic_19-20_Spice.lib" H 6600 2050 50  0001 C CNN "Spice_Lib_File"
	1    6600 2050
	1    0    0    -1  
$EndComp
$Comp
L Master_Schematic_19-20:USBHub U1
U 1 1 5E24A86E
P 650 950
F 0 "U1" H 1156 1240 60  0000 C CNN
F 1 "USBHub" H 1156 1134 60  0000 C CNN
F 2 "" H 850 1000 60  0001 L CNN
F 3 "" H 850 800 60  0001 L CNN
F 4 "USB Hub" H 850 700 60  0001 L CNN "Field5"
	1    650  950 
	1    0    0    -1  
$EndComp
$Comp
L Master_Schematic_19-20:BB U3
U 2 1 5E24AD02
P 6600 1450
F 0 "U3" H 7100 1740 60  0000 C CNN
F 1 "BB" H 7100 1634 60  0000 C CNN
F 2 "" H 6800 1500 60  0001 L CNN
F 3 "" H 6800 1300 60  0001 L CNN
F 4 "Buck Booster" H 6800 1200 60  0001 L CNN "Field5"
F 5 "X" H 6600 1450 50  0001 C CNN "Spice_Primitive"
F 6 "BB12V" H 6600 1450 50  0001 C CNN "Spice_Model"
F 7 "Y" H 6600 1450 50  0001 C CNN "Spice_Netlist_Enabled"
F 8 "Master_Schematic_19-20_Spice.lib" H 6600 1450 50  0001 C CNN "Spice_Lib_File"
	2    6600 1450
	1    0    0    -1  
$EndComp
$Comp
L Master_Schematic_19-20:BB U3
U 3 1 5E24BE98
P 6600 850
F 0 "U3" H 7100 1140 60  0000 C CNN
F 1 "BB" H 7100 1034 60  0000 C CNN
F 2 "" H 6800 900 60  0001 L CNN
F 3 "" H 6800 700 60  0001 L CNN
F 4 "Buck Booster" H 6800 600 60  0001 L CNN "Field5"
F 5 "X" H 6600 850 50  0001 C CNN "Spice_Primitive"
F 6 "BB19V" H 6600 850 50  0001 C CNN "Spice_Model"
F 7 "Y" H 6600 850 50  0001 C CNN "Spice_Netlist_Enabled"
F 8 "Master_Schematic_19-20_Spice.lib" H 6600 850 50  0001 C CNN "Spice_Lib_File"
	3    6600 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 950  6550 1000
Wire Wire Line
	6600 950  6550 950 
$Comp
L pspice:0 #GND?
U 1 1 5E269902
P 6550 1000
F 0 "#GND?" H 6550 900 50  0001 C CNN
F 1 "0" H 6550 1089 50  0000 C CNN
F 2 "" H 6550 1000 50  0001 C CNN
F 3 "~" H 6550 1000 50  0001 C CNN
	1    6550 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 1200 6450 1200
Wire Wire Line
	6450 1200 6450 1450
Wire Wire Line
	6450 1450 6600 1450
Wire Wire Line
	5150 1300 6400 1300
Wire Wire Line
	6400 1300 6400 2050
Wire Wire Line
	6400 2050 6600 2050
$Comp
L Master_Schematic_19-20:Teensy4 T1
U 1 1 5E27CC52
P 7950 3150
F 0 "T1" H 9150 1103 60  0000 C CNN
F 1 "Teensy4" H 9150 997 60  0000 C CNN
F 2 "" H 8100 3200 60  0001 R CNN
F 3 "" H 8100 3000 60  0001 R CNN
F 4 "Teensy 4.0" H 8100 2900 60  0001 R CNN "Field5"
	1    7950 3150
	1    0    0    -1  
$EndComp
Text Notes 1650 2650 0    50   ~ 0
.param BatFuseVal=50A
$EndSCHEMATC
