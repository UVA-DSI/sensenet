EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "sensenet: Big Dot"
Date ""
Rev "v1"
Comp "Librelab / SDS / UVA"
Comment1 "License: CERN OHL-S v2, see AUTHORS and LICENSE files for details"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 5EB16A74
P 4200 1350
F 0 "J3" H 4280 1342 50  0000 L CNN
F 1 "Conn_01x02" H 4280 1251 50  0000 L CNN
F 2 "Connector_JST:JST_XH_S2B-XH-A-1_1x02_P2.50mm_Horizontal" H 4200 1350 50  0001 C CNN
F 3 "~" H 4200 1350 50  0001 C CNN
	1    4200 1350
	-1   0    0    -1  
$EndComp
$Comp
L sensenet_board_part_subs:LTC4070 U2
U 1 1 5EB1780D
P 6100 1150
F 0 "U2" H 6400 0   50  0000 C CNN
F 1 "LTC4070" H 6400 -100 50  0000 C CNN
F 2 "Package_SO:MSOP-8-1EP_3x3mm_P0.65mm_EP1.68x1.88mm" H 6100 1150 50  0001 C CNN
F 3 "" H 6100 1150 50  0001 C CNN
	1    6100 1150
	1    0    0    -1  
$EndComp
$Comp
L sensenet_board_part_subs:MCP1812 U1
U 1 1 5EB19415
P 1850 1650
F 0 "U1" H 1850 1992 50  0000 C CNN
F 1 "MCP1812A" H 1850 1901 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 1800 1700 50  0001 C CNN
F 3 "" H 1800 1700 50  0001 C CNN
	1    1850 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 5EB19FD2
P 1100 1300
F 0 "D1" V 1146 1221 50  0000 R CNN
F 1 "MBR120" V 1055 1221 50  0000 R CNN
F 2 "Diode_SMD:D_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1100 1300 50  0001 C CNN
F 3 "~" H 1100 1300 50  0001 C CNN
	1    1100 1300
	0    -1   -1   0   
$EndComp
$Comp
L power:VBUS #PWR01
U 1 1 5EB1B55B
P 850 1050
F 0 "#PWR01" H 850 900 50  0001 C CNN
F 1 "VBUS" H 865 1223 50  0000 C CNN
F 2 "" H 850 1050 50  0001 C CNN
F 3 "" H 850 1050 50  0001 C CNN
	1    850  1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1050 1100 1150
Wire Wire Line
	850  1050 850  1550
Wire Wire Line
	850  1550 1100 1550
Wire Wire Line
	1100 1550 1100 1450
Wire Wire Line
	1450 1550 1400 1550
Connection ~ 1100 1550
Wire Wire Line
	1450 1650 1400 1650
Wire Wire Line
	1400 1650 1400 1550
Connection ~ 1400 1550
Wire Wire Line
	1400 1550 1100 1550
$Comp
L power:GND #PWR02
U 1 1 5EB23642
P 1100 2050
F 0 "#PWR02" H 1100 1800 50  0001 C CNN
F 1 "GND" H 1105 1877 50  0000 C CNN
F 2 "" H 1100 2050 50  0001 C CNN
F 3 "" H 1100 2050 50  0001 C CNN
	1    1100 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 2050 1100 1950
Wire Wire Line
	1100 1650 1100 1550
$Comp
L power:GND #PWR03
U 1 1 5EB249D9
P 1850 2050
F 0 "#PWR03" H 1850 1800 50  0001 C CNN
F 1 "GND" H 1855 1877 50  0000 C CNN
F 2 "" H 1850 2050 50  0001 C CNN
F 3 "" H 1850 2050 50  0001 C CNN
	1    1850 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2050 1850 1950
$Comp
L Device:C C2
U 1 1 5EB2561F
P 2400 1800
F 0 "C2" H 2515 1846 50  0000 L CNN
F 1 "2.2u" H 2515 1755 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2438 1650 50  0001 C CNN
F 3 "~" H 2400 1800 50  0001 C CNN
	1    2400 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2050 2400 1950
$Comp
L power:GND #PWR05
U 1 1 5EB25E68
P 2400 2050
F 0 "#PWR05" H 2400 1800 50  0001 C CNN
F 1 "GND" H 2405 1877 50  0000 C CNN
F 2 "" H 2400 2050 50  0001 C CNN
F 3 "" H 2400 2050 50  0001 C CNN
	1    2400 2050
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR04
U 1 1 5EB26537
P 2400 1050
F 0 "#PWR04" H 2400 900 50  0001 C CNN
F 1 "+3V3" H 2415 1223 50  0000 C CNN
F 2 "" H 2400 1050 50  0001 C CNN
F 3 "" H 2400 1050 50  0001 C CNN
	1    2400 1050
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR011
U 1 1 5EB36FFE
P 4500 1150
F 0 "#PWR011" H 4500 1000 50  0001 C CNN
F 1 "+BATT" H 4515 1323 50  0000 C CNN
F 2 "" H 4500 1150 50  0001 C CNN
F 3 "" H 4500 1150 50  0001 C CNN
	1    4500 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1150 4500 1200
Wire Wire Line
	4500 1350 4400 1350
$Comp
L power:GND #PWR012
U 1 1 5EB38662
P 4500 1550
F 0 "#PWR012" H 4500 1300 50  0001 C CNN
F 1 "GND" H 4505 1377 50  0000 C CNN
F 2 "" H 4500 1550 50  0001 C CNN
F 3 "" H 4500 1550 50  0001 C CNN
	1    4500 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1550 4500 1450
Wire Wire Line
	4500 1450 4400 1450
Wire Wire Line
	3450 1200 3350 1200
$Comp
L Connector:USB_B_Micro J2
U 1 1 5EB15C29
P 3050 1400
F 0 "J2" H 3107 1867 50  0000 C CNN
F 1 "USB_B_Micro" H 3107 1776 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Molex-105017-0001" H 3200 1350 50  0001 C CNN
F 3 "~" H 3200 1350 50  0001 C CNN
	1    3050 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1900 3050 1850
$Comp
L power:GND #PWR08
U 1 1 5EB40DBB
P 3050 1900
F 0 "#PWR08" H 3050 1650 50  0001 C CNN
F 1 "GND" H 3055 1727 50  0000 C CNN
F 2 "" H 3050 1900 50  0001 C CNN
F 3 "" H 3050 1900 50  0001 C CNN
	1    3050 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1850 3050 1850
Connection ~ 3050 1850
Wire Wire Line
	3050 1850 3050 1800
Wire Wire Line
	2950 1850 2950 1800
$Comp
L power:VBUS #PWR015
U 1 1 5EB4951F
P 5400 900
F 0 "#PWR015" H 5400 750 50  0001 C CNN
F 1 "VBUS" H 5415 1073 50  0000 C CNN
F 2 "" H 5400 900 50  0001 C CNN
F 3 "" H 5400 900 50  0001 C CNN
	1    5400 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 900  5400 1100
$Comp
L Device:R R4
U 1 1 5EB4F0D0
P 5750 1100
F 0 "R4" V 5543 1100 50  0000 C CNN
F 1 "4.7" V 5634 1100 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 5680 1100 50  0001 C CNN
F 3 "~" H 5750 1100 50  0001 C CNN
	1    5750 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 1100 6100 1100
Wire Wire Line
	5600 1100 5400 1100
$Comp
L power:GND #PWR016
U 1 1 5EB51E28
P 6100 2350
F 0 "#PWR016" H 6100 2100 50  0001 C CNN
F 1 "GND" H 6105 2177 50  0000 C CNN
F 2 "" H 6100 2350 50  0001 C CNN
F 3 "" H 6100 2350 50  0001 C CNN
	1    6100 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1400 3450 1400
Wire Wire Line
	3350 1500 3450 1500
Text Label 3450 1400 0    50   ~ 0
D+
Text Label 3450 1500 0    50   ~ 0
D-
Text Notes 6050 1000 0    50   ~ 0
400 = 5 mA\n40 = 50 mA\n4 = 500 mA
$Comp
L power:GND #PWR019
U 1 1 5EB73A75
P 7000 1650
F 0 "#PWR019" H 7000 1400 50  0001 C CNN
F 1 "GND" H 7005 1477 50  0000 C CNN
F 2 "" H 7000 1650 50  0001 C CNN
F 3 "" H 7000 1650 50  0001 C CNN
	1    7000 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1650 7000 1600
Connection ~ 6100 1100
Wire Wire Line
	7000 1200 7000 1100
Wire Wire Line
	6600 1700 6650 1700
Wire Wire Line
	6650 1700 6650 1400
Wire Wire Line
	6650 1400 6700 1400
$Comp
L Device:Q_PMOS_GDS Q1
U 1 1 5EB54A1B
P 6900 1400
F 0 "Q1" H 7106 1400 50  0000 L CNN
F 1 "Si3469DV" H 7100 1500 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23" H 7100 1500 50  0001 C CNN
F 3 "~" H 6900 1400 50  0001 C CNN
	1    6900 1400
	1    0    0    1   
$EndComp
$Comp
L Device:Q_PMOS_GDS Q2
U 1 1 5EB5B1CF
P 7550 1200
F 0 "Q2" H 7756 1154 50  0000 L CNN
F 1 "Si3469DV" H 7756 1245 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:TSOT-23" H 7750 1300 50  0001 C CNN
F 3 "~" H 7550 1200 50  0001 C CNN
	1    7550 1200
	0    1    -1   0   
$EndComp
$Comp
L power:+BATT #PWR018
U 1 1 5EC0B360
P 6750 900
F 0 "#PWR018" H 6750 750 50  0001 C CNN
F 1 "+BATT" H 6765 1073 50  0000 C CNN
F 2 "" H 6750 900 50  0001 C CNN
F 3 "" H 6750 900 50  0001 C CNN
	1    6750 900 
	1    0    0    -1  
$EndComp
Connection ~ 7000 1100
Wire Wire Line
	7550 1400 7550 2000
Text Label 1100 1050 0    50   ~ 0
VBAT_CHRG
$Comp
L Connector:Conn_ARM_JTAG_SWD_10 J1
U 1 1 5EC911A4
P 2720 4055
F 0 "J1" H 2277 4101 50  0000 R CNN
F 1 "Conn_ARM_JTAG_SWD_10" H 2277 4010 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 2720 4055 50  0001 C CNN
F 3 "http://infocenter.arm.com/help/topic/com.arm.doc.ddi0314h/DDI0314H_coresight_components_trm.pdf" V 2370 2805 50  0001 C CNN
	1    2720 4055
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5EEBEB89
P 10000 1600
F 0 "C5" H 10115 1646 50  0000 L CNN
F 1 "100n" H 10115 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 10038 1450 50  0001 C CNN
F 3 "~" H 10000 1600 50  0001 C CNN
	1    10000 1600
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5EED247B
P 10200 1350
F 0 "R7" V 9993 1350 50  0000 C CNN
F 1 "330" V 10084 1350 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 10130 1350 50  0001 C CNN
F 3 "~" H 10200 1350 50  0001 C CNN
	1    10200 1350
	0    -1   1    0   
$EndComp
Wire Wire Line
	10000 1450 10000 1350
Wire Wire Line
	10000 1350 10050 1350
Connection ~ 10000 1350
$Comp
L power:GND #PWR025
U 1 1 5EF2F52F
P 10000 1900
F 0 "#PWR025" H 10000 1650 50  0001 C CNN
F 1 "GND" H 10005 1727 50  0000 C CNN
F 2 "" H 10000 1900 50  0001 C CNN
F 3 "" H 10000 1900 50  0001 C CNN
	1    10000 1900
	-1   0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR024
U 1 1 5EEADA30
P 10000 900
F 0 "#PWR024" H 10000 750 50  0001 C CNN
F 1 "+3V3" H 10015 1073 50  0000 C CNN
F 2 "" H 10000 900 50  0001 C CNN
F 3 "" H 10000 900 50  0001 C CNN
	1    10000 900 
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10000 1350 10000 1250
Wire Wire Line
	10000 950  10000 900 
$Comp
L Device:R R6
U 1 1 5EEB692B
P 10000 1100
F 0 "R6" V 9793 1100 50  0000 C CNN
F 1 "10k" V 9884 1100 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 9930 1100 50  0001 C CNN
F 3 "~" H 10000 1100 50  0001 C CNN
	1    10000 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5EF92992
P 1520 3505
F 0 "R1" V 1313 3505 50  0000 C CNN
F 1 "1k" V 1404 3505 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 1450 3505 50  0001 C CNN
F 3 "~" H 1520 3505 50  0001 C CNN
	1    1520 3505
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1520 3655 1520 3955
Wire Wire Line
	1520 3955 2220 3955
Wire Wire Line
	1520 3355 1520 3205
Wire Wire Line
	1520 3205 2720 3205
Wire Wire Line
	2720 3205 2720 3455
Connection ~ 1520 3955
Text Label 1470 3955 2    50   ~ 0
SWCLK
Text Label 1470 4055 2    50   ~ 0
SWDIO
$Comp
L power:GND #PWR07
U 1 1 5EFE2E06
P 2720 4750
F 0 "#PWR07" H 2720 4500 50  0001 C CNN
F 1 "GND" H 2725 4577 50  0000 C CNN
F 2 "" H 2720 4750 50  0001 C CNN
F 3 "" H 2720 4750 50  0001 C CNN
	1    2720 4750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2720 4755 2720 4750
Wire Wire Line
	2820 4655 2820 4705
Wire Wire Line
	2820 4705 2720 4705
Connection ~ 2720 4705
Wire Wire Line
	2720 4705 2720 4655
$Comp
L power:+3V3 #PWR06
U 1 1 5EB5107A
P 2720 3055
F 0 "#PWR06" H 2720 2905 50  0001 C CNN
F 1 "+3V3" H 2735 3228 50  0000 C CNN
F 2 "" H 2720 3055 50  0001 C CNN
F 3 "" H 2720 3055 50  0001 C CNN
	1    2720 3055
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2720 3055 2720 3205
Connection ~ 2720 3205
$Comp
L Device:C C3
U 1 1 5EB72FF7
P 2970 3205
F 0 "C3" H 3085 3251 50  0000 L CNN
F 1 "100n" H 3085 3160 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3008 3055 50  0001 C CNN
F 3 "~" H 2970 3205 50  0001 C CNN
	1    2970 3205
	0    -1   1    0   
$EndComp
Wire Wire Line
	3170 3205 3120 3205
$Comp
L power:GND #PWR09
U 1 1 5EB72FFE
P 3170 3205
F 0 "#PWR09" H 3170 2955 50  0001 C CNN
F 1 "GND" H 3175 3032 50  0000 C CNN
F 2 "" H 3170 3205 50  0001 C CNN
F 3 "" H 3170 3205 50  0001 C CNN
	1    3170 3205
	0    -1   1    0   
$EndComp
Wire Wire Line
	2820 3205 2720 3205
Wire Wire Line
	10000 1350 9900 1350
Text Label 9900 1350 2    50   ~ 0
RESET
$Comp
L Device:R R2
U 1 1 5EB1A232
P 1970 3755
F 0 "R2" V 1763 3755 50  0000 C CNN
F 1 "330" V 1854 3755 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 1900 3755 50  0001 C CNN
F 3 "~" H 1970 3755 50  0001 C CNN
	1    1970 3755
	0    1    1    0   
$EndComp
Wire Wire Line
	1270 4055 2220 4055
Wire Wire Line
	2120 3755 2220 3755
Wire Wire Line
	1820 3755 1720 3755
Text Label 1820 3755 2    50   ~ 0
RESET
Wire Wire Line
	1520 3955 1270 3955
Text Notes 1950 750  0    50   ~ 0
Power Supply (and Related Connectors)
Text Notes 6750 2550 0    50   ~ 0
Battery Charging and Battery Disconnect
Text Notes 2035 2650 0    50   ~ 0
Breakouts & Connectors
Text Notes 6105 3115 0    50   ~ 0
Core
Text Notes 10400 650  2    50   ~ 0
Reset Switch
$Comp
L Device:C C1
U 1 1 5EB224B8
P 1100 1800
F 0 "C1" H 1215 1846 50  0000 L CNN
F 1 "10u" H 1215 1755 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1138 1650 50  0001 C CNN
F 3 "~" H 1100 1800 50  0001 C CNN
	1    1100 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1100 3450 1200
$Comp
L power:VBUS #PWR010
U 1 1 5EB39218
P 3450 1100
F 0 "#PWR010" H 3450 950 50  0001 C CNN
F 1 "VBUS" H 3465 1273 50  0000 C CNN
F 2 "" H 3450 1100 50  0001 C CNN
F 3 "" H 3450 1100 50  0001 C CNN
	1    3450 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 1100 7350 1100
Wire Wire Line
	6600 1900 6700 1900
Wire Wire Line
	6600 2000 7550 2000
Wire Wire Line
	7750 1100 7950 1100
Text Label 7950 1100 0    50   ~ 0
VBAT_CHRG
Wire Wire Line
	6100 1100 6750 1100
$Comp
L power:GND #PWR014
U 1 1 5EEE03C4
P 4950 1500
F 0 "#PWR014" H 4950 1250 50  0001 C CNN
F 1 "GND" H 4955 1327 50  0000 C CNN
F 2 "" H 4950 1500 50  0001 C CNN
F 3 "" H 4950 1500 50  0001 C CNN
	1    4950 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2350 6100 2300
Wire Wire Line
	6750 900  6750 1100
Connection ~ 6750 1100
Wire Wire Line
	6750 1100 7000 1100
Text Notes 6750 2400 0    50   ~ 0
ADJ:\n3+GND = 4.2V, 3+VCC = 4.0V, NC = 4.1V
Wire Wire Line
	2400 1550 2250 1550
Connection ~ 2400 1550
Wire Wire Line
	2400 1550 2400 1650
Text Notes 8915 655  0    50   ~ 0
User LED
$Sheet
S 5955 3315 600  1600
U 5F3BBDAE
F0 "core" 50
F1 "core.sch" 50
F2 "D12" B R 6555 4615 50 
F3 "D11" B R 6555 4515 50 
F4 "D10" B R 6555 4415 50 
F5 "D9" B R 6555 4315 50 
F6 "D8" B R 6555 4215 50 
F7 "D7" B R 6555 4115 50 
F8 "D6" B R 6555 4015 50 
F9 "D5" B R 6555 3915 50 
F10 "D4" B R 6555 3815 50 
F11 "D3" B R 6555 3715 50 
F12 "D2" B R 6555 3615 50 
F13 "D1" B R 6555 3515 50 
F14 "D0" B R 6555 3415 50 
F15 "A1" B L 5955 3715 50 
F16 "A5" B L 5955 4115 50 
F17 "A4" B L 5955 4015 50 
F18 "A3" B L 5955 3915 50 
F19 "A2" B L 5955 3815 50 
F20 "A0" B L 5955 3615 50 
F21 "VDDIN" I L 5955 3415 50 
F22 "DP" B L 5955 4665 50 
F23 "DM" B L 5955 4565 50 
F24 "RESET" I L 5955 4815 50 
F25 "SWCLK" I L 5955 4415 50 
F26 "SWDIO" B L 5955 4315 50 
$EndSheet
Wire Wire Line
	5955 4565 5805 4565
Text Label 5805 4565 0    50   ~ 0
D-
Wire Wire Line
	5955 4665 5805 4665
Text Label 5805 4665 0    50   ~ 0
D+
Wire Wire Line
	5955 3415 5805 3415
$Comp
L power:+3V3 #PWR017
U 1 1 5EE6220C
P 5805 3415
F 0 "#PWR017" H 5805 3265 50  0001 C CNN
F 1 "+3V3" V 5820 3543 50  0000 L CNN
F 2 "" H 5805 3415 50  0001 C CNN
F 3 "" H 5805 3415 50  0001 C CNN
	1    5805 3415
	0    -1   -1   0   
$EndComp
Text Label 6705 3415 2    50   ~ 0
D0
Text Label 6705 3515 2    50   ~ 0
D1
Text Label 6705 3615 2    50   ~ 0
D2
Text Label 6705 3715 2    50   ~ 0
D3
Text Label 6705 3815 2    50   ~ 0
D4
Text Label 6705 3915 2    50   ~ 0
D5
Text Label 5705 4415 0    50   ~ 0
SWCLK
Text Label 5705 4315 0    50   ~ 0
SWDIO
Wire Wire Line
	5955 4315 5705 4315
Wire Wire Line
	5705 4415 5955 4415
Text Label 5705 4815 0    50   ~ 0
RESET
Wire Wire Line
	5705 4815 5955 4815
Text Label 6705 4015 2    50   ~ 0
D6
Text Label 6705 4115 2    50   ~ 0
D7
Text Label 6705 4215 2    50   ~ 0
D8
Text Label 6705 4315 2    50   ~ 0
D9
Text Label 6705 4415 2    50   ~ 0
D10
Text Label 6705 4515 2    50   ~ 0
D11
Text Label 6705 4615 2    50   ~ 0
D12
Wire Wire Line
	5955 3615 5805 3615
Text Label 5805 3615 0    50   ~ 0
A0
Wire Wire Line
	5955 3715 5805 3715
Text Label 5805 3715 0    50   ~ 0
A1
Wire Wire Line
	5955 3815 5805 3815
Text Label 5805 3815 0    50   ~ 0
A2
Wire Wire Line
	5955 3915 5805 3915
Text Label 5805 3915 0    50   ~ 0
A3
Wire Wire Line
	5955 4015 5805 4015
Text Label 5805 4015 0    50   ~ 0
A4
Wire Wire Line
	5955 4115 5705 4115
Text Label 5805 4115 0    50   ~ 0
A5
$Comp
L Device:R R3
U 1 1 5EC574ED
P 5350 1900
F 0 "R3" V 5557 1900 50  0000 C CNN
F 1 "10k" V 5466 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 5280 1900 50  0001 C CNN
F 3 "~" H 5350 1900 50  0001 C CNN
	1    5350 1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5600 1700 5550 1700
$Comp
L Device:Thermistor_NTC TH1
U 1 1 5EC559C2
P 5150 2300
F 0 "TH1" H 4997 2383 50  0000 R CNN
F 1 "NTHS0402N02N1002F" H 4997 2300 39  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5150 2350 50  0001 C CNN
F 3 "~" H 5150 2350 50  0001 C CNN
F 4 "10k" H 4997 2217 50  0000 R CNN "Rnom"
	1    5150 2300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5600 1900 5500 1900
Wire Wire Line
	5600 2100 5150 2100
Wire Wire Line
	5150 2100 5150 1900
Wire Wire Line
	5150 1900 5200 1900
Wire Wire Line
	5150 2150 5150 2100
Connection ~ 5150 2100
$Comp
L power:GND #PWR013
U 1 1 5ED10962
P 5150 2500
F 0 "#PWR013" H 5150 2250 50  0001 C CNN
F 1 "GND" H 5155 2327 50  0000 C CNN
F 2 "" H 5150 2500 50  0001 C CNN
F 3 "" H 5150 2500 50  0001 C CNN
	1    5150 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 2500 5150 2450
Wire Notes Line
	4650 2450 450  2450
Text Notes 1565 4785 0    50   ~ 0
Cortex Debug Connector
$Comp
L Connector_Generic:Conn_01x08 J5
U 1 1 5ED682BE
P 9430 3780
F 0 "J5" H 9510 3772 50  0000 L CNN
F 1 "Conn_01x08" H 9510 3681 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 9430 3780 50  0001 C CNN
F 3 "~" H 9430 3780 50  0001 C CNN
	1    9430 3780
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x14 J6
U 1 1 5ED6A910
P 10630 4115
F 0 "J6" H 10710 4157 50  0000 L CNN
F 1 "Conn_01x14" H 10710 4066 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x14_P2.54mm_Vertical" H 10630 4115 50  0001 C CNN
F 3 "~" H 10630 4115 50  0001 C CNN
	1    10630 4115
	1    0    0    -1  
$EndComp
Wire Wire Line
	9230 3580 9080 3580
Text Label 9080 3580 0    50   ~ 0
A0
Wire Wire Line
	9230 3680 9080 3680
Text Label 9080 3680 0    50   ~ 0
A1
Wire Wire Line
	9230 3780 9080 3780
Text Label 9080 3780 0    50   ~ 0
A2
Wire Wire Line
	9230 3880 9080 3880
Text Label 9080 3880 0    50   ~ 0
A3
Wire Wire Line
	9230 3980 9080 3980
Text Label 9080 3980 0    50   ~ 0
A4
Wire Wire Line
	9230 4080 9080 4080
Text Label 9080 4080 0    50   ~ 0
A5
Wire Wire Line
	10280 3515 10430 3515
Text Label 10280 3515 0    50   ~ 0
D0
Wire Wire Line
	10280 3615 10430 3615
Text Label 10280 3615 0    50   ~ 0
D1
Wire Wire Line
	10280 3715 10430 3715
Text Label 10280 3715 0    50   ~ 0
D2
Wire Wire Line
	10280 3815 10430 3815
Text Label 10280 3815 0    50   ~ 0
D3
Wire Wire Line
	10280 3915 10430 3915
Text Label 10280 3915 0    50   ~ 0
D4
Wire Wire Line
	10280 4015 10430 4015
Text Label 10280 4015 0    50   ~ 0
D5
Wire Wire Line
	10280 4115 10430 4115
Text Label 10280 4115 0    50   ~ 0
D6
Wire Wire Line
	10280 4215 10430 4215
Text Label 10280 4215 0    50   ~ 0
D7
Wire Wire Line
	10280 4315 10430 4315
Text Label 10280 4315 0    50   ~ 0
D8
Wire Wire Line
	10280 4415 10430 4415
Text Label 10280 4415 0    50   ~ 0
D9
Wire Wire Line
	10280 4515 10430 4515
Text Label 10280 4515 0    50   ~ 0
D10
Wire Wire Line
	10280 4615 10430 4615
Text Label 10280 4615 0    50   ~ 0
D11
Wire Wire Line
	10280 4715 10430 4715
Text Label 10280 4715 0    50   ~ 0
D12
Text Notes 8970 3315 0    50   ~ 0
Analog I/O Header
Text Notes 10115 3315 0    50   ~ 0
Digital I/O Header
Text Label 7555 3715 2    50   ~ 0
SPI0_DI
Text Label 7555 3615 2    50   ~ 0
SPI0_SS
Text Label 7555 3515 2    50   ~ 0
SPI0_SCK
Text Label 7555 3415 2    50   ~ 0
SPI0_DO
Wire Wire Line
	6555 3415 7555 3415
Wire Wire Line
	6555 3515 7555 3515
Wire Wire Line
	6555 3615 7555 3615
Wire Wire Line
	6555 3715 7555 3715
Text Label 7555 4315 2    50   ~ 0
SPI1_DI
Text Label 7555 4215 2    50   ~ 0
SPI1_SS
Text Label 7555 4115 2    50   ~ 0
SPI1_SCK
Text Label 7555 4015 2    50   ~ 0
SPI1_DO
Text Label 7555 4415 2    50   ~ 0
I2C_SDA
Text Label 7555 3815 2    50   ~ 0
UART_TX
Text Label 7555 3915 2    50   ~ 0
UART_RX
Text Label 7555 4515 2    50   ~ 0
I2C_SCL
Wire Wire Line
	6555 3815 7555 3815
Wire Wire Line
	6555 3915 7555 3915
Wire Wire Line
	6555 4015 7555 4015
Wire Wire Line
	6555 4115 7555 4115
Wire Wire Line
	6555 4215 7555 4215
Wire Wire Line
	6555 4315 7555 4315
Wire Wire Line
	6555 4415 7555 4415
Wire Wire Line
	6555 4515 7555 4515
Wire Wire Line
	6555 4615 7555 4615
Text Label 7555 4615 2    50   ~ 0
RFM_IRQ
Text Label 5705 4115 2    50   ~ 0
RFM_RESET
NoConn ~ 2220 4155
NoConn ~ 2220 4255
NoConn ~ 3350 1600
NoConn ~ 6700 1900
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5EC925E9
P 4350 1200
F 0 "#FLG0102" H 4350 1275 50  0001 C CNN
F 1 "PWR_FLAG" V 4350 1327 50  0000 L CNN
F 2 "" H 4350 1200 50  0001 C CNN
F 3 "~" H 4350 1200 50  0001 C CNN
	1    4350 1200
	0    -1   -1   0   
$EndComp
Connection ~ 4500 1200
Wire Wire Line
	4500 1200 4500 1350
Wire Wire Line
	4350 1200 4500 1200
Connection ~ 2720 4750
Wire Wire Line
	2720 4750 2720 4705
Wire Notes Line
	470  5285 11255 5285
Wire Notes Line
	11255 5285 11255 5280
Wire Notes Line
	4700 500  4700 5285
Wire Notes Line
	4705 5280 4705 7790
Wire Notes Line
	4705 7790 4700 7790
Wire Wire Line
	6100 1100 6100 1500
Wire Wire Line
	5550 1450 5550 1700
Wire Notes Line
	4700 2850 11200 2850
Wire Notes Line
	9500 2850 9500 500 
Wire Notes Line
	8700 500  8700 5300
Wire Wire Line
	4950 1500 4950 1450
Wire Wire Line
	4950 1450 5550 1450
Wire Wire Line
	6250 2300 6100 2300
Connection ~ 6100 2300
$Comp
L Switch:SW_Push SW1
U 1 1 5EEC0115
P 10650 1650
F 0 "SW1" V 10604 1798 50  0000 L CNN
F 1 "SW_Push" V 10700 1800 50  0000 L CNN
F 2 "Button_Switch_SMD:SW_SPST_PTS645" H 10650 1850 50  0001 C CNN
F 3 "~" H 10650 1850 50  0001 C CNN
	1    10650 1650
	0    1    -1   0   
$EndComp
Wire Wire Line
	10000 1750 10000 1850
Wire Wire Line
	10350 1350 10650 1350
Wire Wire Line
	10650 1350 10650 1450
Wire Wire Line
	10650 1850 10000 1850
Connection ~ 10000 1850
Wire Wire Line
	10000 1850 10000 1900
Text Label 9230 3480 2    50   ~ 0
+3V3
Text Label 9230 4180 2    50   ~ 0
GND
Wire Wire Line
	2400 1050 2400 1550
Text Label 1125 7687 2    50   ~ 0
GND
Text Label 1125 7187 2    50   ~ 0
+3V3
Wire Wire Line
	2870 6465 3515 6465
$Comp
L power:GND #PWR0101
U 1 1 5EEDF79C
P 3715 6665
F 0 "#PWR0101" H 3715 6415 50  0001 C CNN
F 1 "GND" H 3720 6492 50  0000 C CNN
F 2 "" H 3715 6665 50  0001 C CNN
F 3 "" H 3715 6665 50  0001 C CNN
	1    3715 6665
	1    0    0    -1  
$EndComp
Wire Wire Line
	2370 6015 2370 6265
Wire Wire Line
	2870 6965 3120 6965
Wire Wire Line
	2870 6665 3120 6665
$Comp
L Connector:Conn_Coaxial J7
U 1 1 5EC7183E
P 3715 6465
F 0 "J7" H 3815 6349 50  0000 L CNN
F 1 "Conn_Coaxial" H 3815 6440 50  0000 L CNN
F 2 "fp:Connector_Coaxial_SMA_edge_combined" H 3715 6465 50  0001 C CNN
F 3 " ~" H 3715 6465 50  0001 C CNN
	1    3715 6465
	1    0    0    -1  
$EndComp
Wire Wire Line
	2470 7365 2470 7415
Wire Wire Line
	2270 7365 2270 7415
Wire Wire Line
	2370 7365 2370 7415
$Comp
L RF_Module:RFM95W-915S2 U3
U 1 1 5EC2A2D3
P 2370 6765
F 0 "U3" H 2370 7443 50  0000 C CNN
F 1 "RFM95W-915S2" H 2755 7225 50  0000 C CNN
F 2 "fp:RFM95W" H -930 8415 50  0001 C CNN
F 3 "http://www.hoperf.com/upload/rf/RFM95_96_97_98W.pdf" H -930 8415 50  0001 C CNN
	1    2370 6765
	1    0    0    -1  
$EndComp
NoConn ~ 3120 7065
NoConn ~ 3120 6765
Text Label 1320 6965 0    50   ~ 0
RFM_RESET
Text Label 3120 7165 0    50   ~ 0
RFM_IRQ
Wire Wire Line
	1320 6765 1870 6765
Wire Wire Line
	1320 6665 1870 6665
Wire Wire Line
	1320 6565 1870 6565
Wire Wire Line
	1320 6465 1870 6465
Text Label 1320 6765 0    50   ~ 0
SPI0_SS
Text Label 1320 6665 0    50   ~ 0
SPI0_DI
Text Label 1320 6565 0    50   ~ 0
SPI0_DO
Text Label 1320 6465 0    50   ~ 0
SPI0_SCK
Wire Wire Line
	2870 7165 3120 7165
Wire Wire Line
	1320 6965 1870 6965
Connection ~ 2370 6015
Wire Wire Line
	2370 5915 2370 6015
Text Label 975  7487 2    50   ~ 0
RFM_DIO5
Wire Wire Line
	975  7487 1125 7487
Text Label 975  7387 2    50   ~ 0
RFM_DIO3
Text Label 975  7287 2    50   ~ 0
RFM_DIO2
Wire Wire Line
	975  7387 1125 7387
Wire Wire Line
	975  7287 1125 7287
Text Label 3120 6665 0    50   ~ 0
RFM_DIO5
Text Label 3120 6865 0    50   ~ 0
RFM_DIO3
Text Label 3120 6965 0    50   ~ 0
RFM_DIO2
Text Label 3120 7065 0    50   ~ 0
RFM_DIO1
Text Notes 2500 5585 2    50   ~ 0
Radio
$Comp
L Connector_Generic:Conn_01x06 J4
U 1 1 5ECA4A33
P 1325 7387
F 0 "J4" H 1405 7429 50  0000 L CNN
F 1 "Conn_01x06" H 1405 7338 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 1325 7387 50  0001 C CNN
F 3 "~" H 1325 7387 50  0001 C CNN
	1    1325 7387
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5EC7A016
P 2120 6015
F 0 "C4" H 2235 6061 50  0000 L CNN
F 1 "10uF" H 2235 5970 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2158 5865 50  0001 C CNN
F 3 "~" H 2120 6015 50  0001 C CNN
	1    2120 6015
	0    1    1    0   
$EndComp
Wire Wire Line
	2270 6015 2370 6015
Wire Wire Line
	1920 6015 1970 6015
$Comp
L power:GND #PWR021
U 1 1 5EC7A01D
P 1920 6015
F 0 "#PWR021" H 1920 5765 50  0001 C CNN
F 1 "GND" H 1925 5842 50  0000 C CNN
F 2 "" H 1920 6015 50  0001 C CNN
F 3 "" H 1920 6015 50  0001 C CNN
	1    1920 6015
	0    1    1    0   
$EndComp
Wire Wire Line
	2370 7465 2370 7415
Wire Wire Line
	2470 7415 2370 7415
Connection ~ 2370 7415
Wire Wire Line
	2370 7415 2270 7415
$Comp
L power:GND #PWR023
U 1 1 5EC65F9D
P 2370 7465
F 0 "#PWR023" H 2370 7215 50  0001 C CNN
F 1 "GND" H 2375 7292 50  0000 C CNN
F 2 "" H 2370 7465 50  0001 C CNN
F 3 "" H 2370 7465 50  0001 C CNN
	1    2370 7465
	1    0    0    -1  
$EndComp
Wire Wire Line
	3120 6765 2870 6765
Wire Wire Line
	3120 6865 2870 6865
Wire Wire Line
	3120 7065 2870 7065
$Comp
L power:+3V3 #PWR022
U 1 1 5EC4060F
P 2370 5915
F 0 "#PWR022" H 2370 5765 50  0001 C CNN
F 1 "+3V3" H 2385 6088 50  0000 C CNN
F 2 "" H 2370 5915 50  0001 C CNN
F 3 "" H 2370 5915 50  0001 C CNN
	1    2370 5915
	1    0    0    -1  
$EndComp
Wire Wire Line
	9085 885  9085 835 
Text Label 9085 835  0    50   ~ 0
D4
$Comp
L power:GND #PWR020
U 1 1 5F0F0174
P 9085 1635
F 0 "#PWR020" H 9085 1385 50  0001 C CNN
F 1 "GND" H 9090 1462 50  0000 C CNN
F 2 "" H 9085 1635 50  0001 C CNN
F 3 "" H 9085 1635 50  0001 C CNN
	1    9085 1635
	1    0    0    -1  
$EndComp
Wire Wire Line
	9085 1235 9085 1185
$Comp
L Device:LED D2
U 1 1 5F0F016D
P 9085 1385
F 0 "D2" V 9124 1268 50  0000 R CNN
F 1 "LED" V 9033 1268 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9085 1385 50  0001 C CNN
F 3 "~" H 9085 1385 50  0001 C CNN
	1    9085 1385
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 5F0F0167
P 9085 1035
F 0 "R5" H 9155 1081 50  0000 L CNN
F 1 "2.2k" H 9155 990 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 9015 1035 50  0001 C CNN
F 3 "~" H 9085 1035 50  0001 C CNN
	1    9085 1035
	1    0    0    -1  
$EndComp
Wire Wire Line
	9085 1535 9085 1635
Wire Wire Line
	10430 4815 10280 4815
Text Label 10280 4815 0    50   ~ 0
GND
Text Label 1125 7587 2    50   ~ 0
GND
$EndSCHEMATC
