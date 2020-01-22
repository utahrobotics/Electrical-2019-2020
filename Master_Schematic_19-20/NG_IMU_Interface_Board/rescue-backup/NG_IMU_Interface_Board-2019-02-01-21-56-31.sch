EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:NG_IMU_Components
LIBS:NG_IMU_Interface_Board-cache
EELAYER 25 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "NG LN200C Interface Board"
Date "2018-04-08"
Rev ""
Comp "Utah Student Robotics"
Comment1 "Designed by Cole Mortensen"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 2960 2370 2    60   ~ 0
+12V
$Comp
L Conn_01x02 J2
U 1 1 5AC98297
P 3240 2370
F 0 "J2" H 3240 2470 50  0000 C CNN
F 1 "Conn_01x02" H 3240 2170 50  0000 C CNN
F 2 "Connectors_Molex:Molex_MegaFit_2x01x5.70mm_Angled" H 3240 2370 50  0001 C CNN
F 3 "" H 3240 2370 50  0001 C CNN
	1    3240 2370
	1    0    0    -1  
$EndComp
$Comp
L Varistor RV1
U 1 1 5AC9833D
P 4400 2440
F 0 "RV1" V 4525 2440 50  0000 C CNN
F 1 "10D560K" V 4275 2440 50  0000 C CNN
F 2 "Varistors:RV_Disc_D12_W4.3_P7.5" V 4330 2440 50  0001 C CNN
F 3 "" H 4400 2440 50  0001 C CNN
	1    4400 2440
	-1   0    0    1   
$EndComp
$Comp
L L L1
U 1 1 5AC983F3
P 4810 2290
F 0 "L1" V 4760 2290 50  0000 C CNN
F 1 "56 uH" V 4885 2290 50  0000 C CNN
F 2 "Inductors_SMD:L_1210_HandSoldering" H 4810 2290 50  0001 C CNN
F 3 "" H 4810 2290 50  0001 C CNN
	1    4810 2290
	0    -1   -1   0   
$EndComp
$Comp
L D_Schottky D2
U 1 1 5AC98473
P 5110 2440
F 0 "D2" H 5110 2540 50  0000 C CNN
F 1 "SMCJ48A" H 5110 2340 50  0000 C CNN
F 2 "Diodes_SMD:D_SMC_Handsoldering" H 5110 2440 50  0001 C CNN
F 3 "" H 5110 2440 50  0001 C CNN
	1    5110 2440
	0    1    1    0   
$EndComp
$Comp
L CP1 C2
U 1 1 5AC984C4
P 5390 2440
F 0 "C2" H 5415 2540 50  0000 L CNN
F 1 "120μF/50V" H 5190 2240 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P5.00mm" H 5390 2440 50  0001 C CNN
F 3 "" H 5390 2440 50  0001 C CNN
	1    5390 2440
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 5AC984E3
P 5660 2440
F 0 "C3" H 5685 2540 50  0000 L CNN
F 1 "4.7μF/50V" H 5490 2660 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 5698 2290 50  0001 C CNN
F 3 "" H 5660 2440 50  0001 C CNN
	1    5660 2440
	1    0    0    -1  
$EndComp
$Comp
L EMI_Filter_LL FL1
U 1 1 5AC985C4
P 6140 2440
F 0 "FL1" H 6140 2615 50  0000 C CNN
F 1 "2.2mH" H 6140 2265 50  0000 C CNN
F 2 "Inductors_THT:Choke_Schaffner_RN214-04-15.5x23.0mm" V 6140 2480 50  0001 C CNN
F 3 "" V 6140 2480 50  0000 C CNN
	1    6140 2440
	1    0    0    -1  
$EndComp
$Comp
L C_Small C1
U 1 1 5AC986B6
P 6660 2190
F 0 "C1" H 6480 2190 50  0000 L CNN
F 1 "1nF/2kV" H 6750 2190 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210_HandSoldering" H 6660 2190 50  0001 C CNN
F 3 "" H 6660 2190 50  0001 C CNN
	1    6660 2190
	1    0    0    -1  
$EndComp
$Comp
L C_Small C4
U 1 1 5AC986E5
P 6660 2450
F 0 "C4" H 6480 2450 50  0000 L CNN
F 1 "4.7μF/50V" H 6750 2450 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 6660 2450 50  0001 C CNN
F 3 "" H 6660 2450 50  0001 C CNN
	1    6660 2450
	1    0    0    -1  
$EndComp
$Comp
L C_Small C5
U 1 1 5AC98710
P 6660 2720
F 0 "C5" H 6480 2720 50  0000 L CNN
F 1 "1nF/2kV" H 6750 2720 50  0000 L CNN
F 2 "Capacitors_SMD:C_1210_HandSoldering" H 6660 2720 50  0001 C CNN
F 3 "" H 6660 2720 50  0001 C CNN
	1    6660 2720
	1    0    0    -1  
$EndComp
$Comp
L PYB30-Q24-T515 U1
U 1 1 5AC98BBC
P 7680 2450
F 0 "U1" H 7680 2050 60  0000 C CNN
F 1 "PYB30-Q24-T515" H 7680 2850 60  0000 C CNN
F 2 "NG_IMU_footprints:PYB30-Q24-T515" H 7680 2450 60  0001 C CNN
F 3 "" H 7680 2450 60  0001 C CNN
	1    7680 2450
	1    0    0    -1  
$EndComp
Text Label 4100 2290 2    60   ~ 0
+12V
Text Label 8180 2200 0    60   ~ 0
+5V
Text Label 8180 2350 0    60   ~ 0
+15V
Text Label 8180 2550 0    60   ~ 0
0V
Text Label 8180 2700 0    60   ~ 0
-15V
$Comp
L Conn_02x12_Top_Bottom J5
U 1 1 5AC9990D
P 3120 4560
F 0 "J5" H 3170 5160 50  0000 C CNN
F 1 "Conn_02x12_Top_Bottom" H 3170 3860 50  0000 C CNN
F 2 "NG_IMU_footprints:IPL1-112-01-F-D-K" H 3120 4560 50  0001 C CNN
F 3 "" H 3120 4560 50  0001 C CNN
	1    3120 4560
	-1   0    0    -1  
$EndComp
Text Label 3320 4060 0    60   ~ 0
-15V
Text Label 3320 5160 0    60   ~ 0
Data-
Text Label 3320 5060 0    60   ~ 0
Data+
Text Label 3320 4960 0    60   ~ 0
0V
Text Label 3320 4860 0    60   ~ 0
0V
Text Label 3320 4660 0    60   ~ 0
+5V
Text Label 2820 5160 2    60   ~ 0
CLK-
Text Label 2820 5060 2    60   ~ 0
CLK+
Text Label 2820 4960 2    60   ~ 0
0V
Text Label 2820 4860 2    60   ~ 0
0V
Text Label 2820 4760 2    60   ~ 0
+5V
Text Label 2820 4660 2    60   ~ 0
+5V
Text Label 2820 4160 2    60   ~ 0
+15V
NoConn ~ 2820 4060
$Comp
L MAX3280EAUK+T U2
U 1 1 5AC9A058
P 5730 4190
F 0 "U2" H 5730 3940 60  0000 C CNN
F 1 "MAX3280EAUK+T" H 5730 4440 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5_HandSoldering" H 5730 4190 60  0001 C CNN
F 3 "" H 5730 4190 60  0001 C CNN
	1    5730 4190
	-1   0    0    1   
$EndComp
$Comp
L R R2
U 1 1 5AC9A1E6
P 5050 4180
F 0 "R2" V 5130 4180 50  0000 C CNN
F 1 "120" V 5050 4180 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4980 4180 50  0001 C CNN
F 3 "" H 5050 4180 50  0001 C CNN
	1    5050 4180
	1    0    0    -1  
$EndComp
Text Label 4800 4330 2    60   ~ 0
Data+
Text Label 4780 4030 2    60   ~ 0
Data-
Text Label 6080 4340 0    60   ~ 0
+5V
Text Label 6080 4190 0    60   ~ 0
0V
$Comp
L MAX3280EAUK+T U3
U 1 1 5AC9A72D
P 5740 4910
F 0 "U3" H 5740 4660 60  0000 C CNN
F 1 "MAX3280EAUK+T" H 5740 5160 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-5_HandSoldering" H 5740 4910 60  0001 C CNN
F 3 "" H 5740 4910 60  0001 C CNN
	1    5740 4910
	-1   0    0    1   
$EndComp
$Comp
L R R3
U 1 1 5AC9A733
P 5060 4900
F 0 "R3" V 5140 4900 50  0000 C CNN
F 1 "120" V 5060 4900 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4990 4900 50  0001 C CNN
F 3 "" H 5060 4900 50  0001 C CNN
	1    5060 4900
	1    0    0    -1  
$EndComp
Text Label 4810 5050 2    60   ~ 0
CLK+
Text Label 4790 4750 2    60   ~ 0
CLK-
Text Label 6090 5060 0    60   ~ 0
+5V
Text Label 6090 4910 0    60   ~ 0
0V
$Comp
L Conn_01x03 J4
U 1 1 5AC9ADA5
P 7570 4520
F 0 "J4" H 7570 4720 50  0000 C CNN
F 1 "Conn_01x03" H 7570 4320 50  0000 C CNN
F 2 "Connectors_Molex:Molex_KK-6410-03_03x2.54mm_Straight" H 7570 4520 50  0001 C CNN
F 3 "" H 7570 4520 50  0001 C CNN
	1    7570 4520
	1    0    0    -1  
$EndComp
Text Label 7370 4520 2    60   ~ 0
0V
$Comp
L Conn_01x10 J3
U 1 1 5ACAADC2
P 9320 4400
F 0 "J3" H 9320 4900 50  0000 C CNN
F 1 "Conn_01x10" H 9320 3800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 9320 4400 50  0001 C CNN
F 3 "" H 9320 4400 50  0001 C CNN
	1    9320 4400
	1    0    0    -1  
$EndComp
Text Label 2820 4260 2    60   ~ 0
M1
Text Label 2820 4360 2    60   ~ 0
J2
Text Label 2820 4460 2    60   ~ 0
H1
Text Label 2820 4560 2    60   ~ 0
G1
Text Label 3320 4160 0    60   ~ 0
M2
Text Label 3320 4260 0    60   ~ 0
K2
Text Label 3320 4360 0    60   ~ 0
H2
Text Label 3320 4460 0    60   ~ 0
G3
Text Label 3320 4560 0    60   ~ 0
C2
Text Label 3320 4760 0    60   ~ 0
D3
Text Label 9120 4100 2    60   ~ 0
C2
Text Label 9120 4000 2    60   ~ 0
D3
Text Label 9120 4200 2    60   ~ 0
G1
Text Label 9120 4300 2    60   ~ 0
G3
Text Label 9120 4400 2    60   ~ 0
H1
Text Label 9120 4500 2    60   ~ 0
H2
Text Label 9120 4600 2    60   ~ 0
J2
Text Label 9120 4700 2    60   ~ 0
K2
Text Label 9120 4800 2    60   ~ 0
M1
Text Label 9120 4900 2    60   ~ 0
M2
$Comp
L Conn_01x04 J1
U 1 1 5ACABB9D
P 9530 2340
F 0 "J1" H 9530 2540 50  0000 C CNN
F 1 "Conn_01x04" H 9530 2040 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 9530 2340 50  0001 C CNN
F 3 "" H 9530 2340 50  0001 C CNN
	1    9530 2340
	1    0    0    -1  
$EndComp
Text Notes 9900 2030 2    98   ~ 0
Aux Power
Text Notes 7930 4950 2    79   ~ 0
Data & Clock
Text Notes 3500 2100 2    79   ~ 0
Power Input
Text Notes 3510 3850 2    79   ~ 0
IMU Connector
Text Notes 9700 3800 2    79   ~ 0
Misc. Breakout
$Comp
L LED D1
U 1 1 5ACAC203
P 9160 1320
F 0 "D1" H 9160 1420 50  0000 C CNN
F 1 "LED" H 9160 1220 50  0000 C CNN
F 2 "LEDs:LED_1206_HandSoldering" H 9160 1320 50  0001 C CNN
F 3 "" H 9160 1320 50  0001 C CNN
	1    9160 1320
	-1   0    0    1   
$EndComp
$Comp
L R R1
U 1 1 5ACAC33C
P 8810 1320
F 0 "R1" V 8890 1320 50  0000 C CNN
F 1 "220" V 8810 1320 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 8740 1320 50  0001 C CNN
F 3 "" H 8810 1320 50  0001 C CNN
	1    8810 1320
	0    1    1    0   
$EndComp
Text Label 8660 1320 2    79   ~ 0
+5V
Text Label 9440 1320 0    79   ~ 0
0V
Text Notes 9420 1110 2    59   ~ 0
Power Indicator
$Comp
L TEST TP1
U 1 1 5ACACD28
P 1960 6670
F 0 "TP1" H 1960 6970 50  0000 C BNN
F 1 "TEST" H 1960 6920 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-TH_Small" H 1960 6670 50  0001 C CNN
F 3 "" H 1960 6670 50  0001 C CNN
	1    1960 6670
	1    0    0    -1  
$EndComp
$Comp
L TEST TP2
U 1 1 5ACACE9F
P 2340 6670
F 0 "TP2" H 2340 6970 50  0000 C BNN
F 1 "TEST" H 2340 6920 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-TH_Small" H 2340 6670 50  0001 C CNN
F 3 "" H 2340 6670 50  0001 C CNN
	1    2340 6670
	1    0    0    -1  
$EndComp
Text Label 1960 6670 0    59   ~ 0
Data+
Text Label 2340 6670 0    59   ~ 0
Data-
$Comp
L TEST TP4
U 1 1 5ACAD038
P 1970 7070
F 0 "TP4" H 1970 7370 50  0000 C BNN
F 1 "TEST" H 1970 7320 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-TH_Small" H 1970 7070 50  0001 C CNN
F 3 "" H 1970 7070 50  0001 C CNN
	1    1970 7070
	1    0    0    -1  
$EndComp
Text Label 1970 7070 0    59   ~ 0
CLK+
$Comp
L TEST TP6
U 1 1 5ACAD0E2
P 2340 7080
F 0 "TP6" H 2340 7380 50  0000 C BNN
F 1 "TEST" H 2340 7330 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-TH_Small" H 2340 7080 50  0001 C CNN
F 3 "" H 2340 7080 50  0001 C CNN
	1    2340 7080
	1    0    0    -1  
$EndComp
Text Label 2340 7080 0    59   ~ 0
CLK-
$Comp
L TEST TP3
U 1 1 5ACAD3A6
P 2850 6670
F 0 "TP3" H 2850 6970 50  0000 C BNN
F 1 "TEST" H 2850 6920 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-TH_Small" H 2850 6670 50  0001 C CNN
F 3 "" H 2850 6670 50  0001 C CNN
	1    2850 6670
	1    0    0    -1  
$EndComp
$Comp
L TEST TP5
U 1 1 5ACAD4AD
P 2840 7070
F 0 "TP5" H 2840 7370 50  0000 C BNN
F 1 "TEST" H 2840 7320 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-TH_Small" H 2840 7070 50  0001 C CNN
F 3 "" H 2840 7070 50  0001 C CNN
	1    2840 7070
	1    0    0    -1  
$EndComp
Text Label 2850 6670 0    59   ~ 0
Data_clean
Text Label 2840 7070 0    59   ~ 0
CLK_clean
Text Label 6200 4040 0    59   ~ 0
Data_clean
Text Label 6210 4760 0    59   ~ 0
CLK_clean
Text Notes 7120 1510 2    118  ~ 0
Power Circuit
Text Notes 4780 3710 0    118  ~ 0
Differential Pair to Single Ended
Text Notes 2890 6070 2    118  ~ 0
Test Points
Text Label 2870 2470 2    59   ~ 0
gnd
Text Label 3990 2590 2    59   ~ 0
gnd
$Comp
L GS2 J6
U 1 1 5ACFC618
P 6150 2100
F 0 "J6" H 6250 2250 50  0000 C CNN
F 1 "GS2" H 6250 1951 50  0000 C CNN
F 2 "Connectors:GS2" V 6224 2100 50  0001 C CNN
F 3 "" H 6150 2100 50  0001 C CNN
	1    6150 2100
	0    1    1    0   
$EndComp
$Comp
L GS2 J7
U 1 1 5ACFCB42
P 6160 2800
F 0 "J7" H 6260 2950 50  0000 C CNN
F 1 "GS2" H 6260 2651 50  0000 C CNN
F 2 "Connectors:GS2" V 6234 2800 50  0001 C CNN
F 3 "" H 6160 2800 50  0001 C CNN
	1    6160 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	2960 2370 3040 2370
Wire Wire Line
	2870 2470 3040 2470
Wire Wire Line
	4100 2290 4660 2290
Wire Wire Line
	4960 2290 5950 2290
Connection ~ 5110 2290
Connection ~ 5390 2290
Wire Wire Line
	5940 2290 5940 2340
Connection ~ 5660 2290
Wire Wire Line
	6340 2340 7180 2340
Wire Wire Line
	6660 2290 6660 2350
Connection ~ 6660 2340
Wire Wire Line
	6340 2540 6660 2540
Wire Wire Line
	6660 2540 6660 2620
Connection ~ 6660 2550
Wire Wire Line
	3990 2590 5940 2590
Wire Wire Line
	5940 2590 5940 2540
Connection ~ 5660 2590
Connection ~ 5390 2590
Connection ~ 5110 2590
Connection ~ 4400 2290
Connection ~ 4400 2590
Wire Wire Line
	7180 2340 7180 2200
Wire Wire Line
	7180 2700 7180 2550
Wire Wire Line
	7180 2550 6660 2550
Wire Wire Line
	6660 2090 6660 1690
Wire Wire Line
	6660 1690 8180 1690
Wire Wire Line
	8180 1690 8180 2200
Wire Wire Line
	6660 2820 6660 3110
Wire Wire Line
	6660 3110 8570 3110
Wire Wire Line
	8570 3110 8570 2550
Wire Wire Line
	8180 2550 8930 2550
Wire Wire Line
	4780 4030 5380 4030
Wire Wire Line
	5380 4030 5380 4090
Wire Wire Line
	4800 4330 5380 4330
Wire Wire Line
	5380 4330 5380 4290
Connection ~ 5050 4330
Connection ~ 5050 4030
Wire Wire Line
	4790 4750 5390 4750
Wire Wire Line
	5390 4750 5390 4810
Wire Wire Line
	4810 5050 5390 5050
Wire Wire Line
	5390 5050 5390 5010
Connection ~ 5060 5050
Connection ~ 5060 4750
Wire Wire Line
	6080 4040 7370 4040
Wire Wire Line
	7370 4040 7370 4420
Wire Wire Line
	6090 4760 7220 4760
Wire Wire Line
	7220 4760 7220 4620
Wire Wire Line
	7220 4620 7370 4620
Wire Wire Line
	8180 2200 9330 2200
Wire Wire Line
	9330 2200 9330 2240
Wire Wire Line
	8180 2350 9330 2350
Wire Wire Line
	9330 2350 9330 2340
Wire Wire Line
	8930 2550 8930 2440
Wire Wire Line
	8930 2440 9330 2440
Connection ~ 8570 2550
Wire Wire Line
	8180 2700 9170 2700
Wire Wire Line
	9170 2700 9170 2540
Wire Wire Line
	9170 2540 9330 2540
Wire Wire Line
	8960 1320 9010 1320
Wire Wire Line
	9310 1320 9440 1320
Wire Notes Line
	4400 3760 8040 3760
Wire Notes Line
	8040 3760 8040 5280
Wire Notes Line
	8040 5280 4400 5280
Wire Notes Line
	4400 5280 4400 3760
Wire Notes Line
	3810 1590 3810 3210
Wire Notes Line
	3810 3210 9960 3210
Wire Notes Line
	9960 3210 9960 1590
Wire Notes Line
	9960 1590 3810 1590
Wire Notes Line
	1590 6190 4810 6190
Wire Notes Line
	4810 6190 4810 7870
Wire Notes Line
	4810 7870 1590 7870
Wire Notes Line
	1590 7870 1590 6190
Wire Wire Line
	6350 2100 6395 2100
Wire Wire Line
	6395 2100 6395 2340
Connection ~ 6395 2340
Wire Wire Line
	5950 2290 5950 2100
Connection ~ 5940 2290
Wire Wire Line
	5960 2800 5960 2590
Wire Wire Line
	5960 2590 5935 2590
Connection ~ 5935 2590
Wire Wire Line
	6360 2800 6360 2540
Connection ~ 6360 2540
$Comp
L Conn_01x01 J8
U 1 1 5ACFCFD9
P 7335 1835
F 0 "J8" H 7335 1935 50  0000 C CNN
F 1 "Conn_01x01" H 7335 1735 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 7335 1835 50  0001 C CNN
F 3 "" H 7335 1835 50  0001 C CNN
	1    7335 1835
	1    0    0    -1  
$EndComp
Wire Wire Line
	7180 2450 7135 2450
Wire Wire Line
	7135 2450 7135 1835
$Comp
L TEST TP7
U 1 1 5ACFD884
P 3730 6635
F 0 "TP7" H 3730 6935 50  0000 C BNN
F 1 "TEST" H 3730 6885 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-TH_Small" H 3730 6635 50  0001 C CNN
F 3 "" H 3730 6635 50  0001 C CNN
	1    3730 6635
	1    0    0    -1  
$EndComp
$Comp
L TEST TP10
U 1 1 5ACFD905
P 4130 6620
F 0 "TP10" H 4130 6920 50  0000 C BNN
F 1 "TEST" H 4130 6870 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-TH_Small" H 4130 6620 50  0001 C CNN
F 3 "" H 4130 6620 50  0001 C CNN
	1    4130 6620
	1    0    0    -1  
$EndComp
Text Label 3730 6635 0    60   ~ 0
+15V
Text Label 4130 6620 0    60   ~ 0
-15V
$Comp
L TEST TP8
U 1 1 5ACFEF22
P 3735 7035
F 0 "TP8" H 3735 7335 50  0000 C BNN
F 1 "TEST" H 3735 7285 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-TH_Small" H 3735 7035 50  0001 C CNN
F 3 "" H 3735 7035 50  0001 C CNN
	1    3735 7035
	1    0    0    -1  
$EndComp
Text Label 3735 7035 0    60   ~ 0
0V
$Comp
L TEST TP9
U 1 1 5ACFF180
P 4115 7020
F 0 "TP9" H 4115 7320 50  0000 C BNN
F 1 "TEST" H 4115 7270 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-TH_Small" H 4115 7020 50  0001 C CNN
F 3 "" H 4115 7020 50  0001 C CNN
	1    4115 7020
	1    0    0    -1  
$EndComp
Text Label 4115 7020 0    60   ~ 0
+5V
$EndSCHEMATC
