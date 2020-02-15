EESchema Schematic File Version 4
LIBS:wsn-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
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
L Device:D_Zener D?
U 1 1 5E5CD891
P 5150 3000
AR Path="/5E5CD891" Ref="D?"  Part="1" 
AR Path="/5E4C83A3/5E5CD891" Ref="D?"  Part="1" 
F 0 "D?" V 5104 3079 50  0000 L CNN
F 1 "D_Zener" V 5195 3079 50  0000 L CNN
F 2 "" H 5150 3000 50  0001 C CNN
F 3 "~" H 5150 3000 50  0001 C CNN
	1    5150 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 2800 5000 2800
$Comp
L Device:R R?
U 1 1 5E5CD898
P 4800 3400
AR Path="/5E5CD898" Ref="R?"  Part="1" 
AR Path="/5E4C83A3/5E5CD898" Ref="R?"  Part="1" 
F 0 "R?" H 4730 3354 50  0000 R CNN
F 1 "R" H 4730 3445 50  0000 R CNN
F 2 "" V 4730 3400 50  0001 C CNN
F 3 "~" H 4800 3400 50  0001 C CNN
	1    4800 3400
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5E5CD89E
P 5800 3000
AR Path="/5E5CD89E" Ref="R?"  Part="1" 
AR Path="/5E4C83A3/5E5CD89E" Ref="R?"  Part="1" 
F 0 "R?" H 5730 2954 50  0000 R CNN
F 1 "R" H 5730 3045 50  0000 R CNN
F 2 "" V 5730 3000 50  0001 C CNN
F 3 "~" H 5800 3000 50  0001 C CNN
	1    5800 3000
	-1   0    0    1   
$EndComp
Wire Wire Line
	5150 2800 5150 2850
Wire Wire Line
	5800 2850 5800 2800
$Comp
L Device:D_Zener D?
U 1 1 5E5CD8A8
P 5800 3400
AR Path="/5E5CD8A8" Ref="D?"  Part="1" 
AR Path="/5E4C83A3/5E5CD8A8" Ref="D?"  Part="1" 
F 0 "D?" V 5754 3479 50  0000 L CNN
F 1 "D_Zener" V 5845 3479 50  0000 L CNN
F 2 "" H 5800 3400 50  0001 C CNN
F 3 "~" H 5800 3400 50  0001 C CNN
	1    5800 3400
	0    1    1    0   
$EndComp
$Comp
L Device:Q_PMOS_DGS Q?
U 1 1 5E5CD8AE
P 6600 3200
AR Path="/5E5CD8AE" Ref="Q?"  Part="1" 
AR Path="/5E4C83A3/5E5CD8AE" Ref="Q?"  Part="1" 
F 0 "Q?" H 6806 3154 50  0000 L CNN
F 1 "Q_PMOS_DGS" H 6806 3245 50  0000 L CNN
F 2 "" H 6800 3300 50  0001 C CNN
F 3 "~" H 6600 3200 50  0001 C CNN
	1    6600 3200
	1    0    0    1   
$EndComp
$Comp
L Device:Q_PMOS_DGS Q?
U 1 1 5E5CD8B5
P 4800 2900
AR Path="/5E5CD8B5" Ref="Q?"  Part="1" 
AR Path="/5E4C83A3/5E5CD8B5" Ref="Q?"  Part="1" 
F 0 "Q?" V 5143 2900 50  0000 C CNN
F 1 "Q_PMOS_DGS" V 5052 2900 50  0000 C CNN
F 2 "" H 5000 3000 50  0001 C CNN
F 3 "~" H 4800 2900 50  0001 C CNN
	1    4800 2900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4800 3100 4800 3200
Wire Wire Line
	5150 3150 5150 3200
Wire Wire Line
	5150 3200 4800 3200
Connection ~ 4800 3200
Wire Wire Line
	4800 3200 4800 3250
Wire Wire Line
	6700 3000 6700 2800
Wire Wire Line
	6700 2800 6250 2800
Connection ~ 5800 2800
$Comp
L Device:Q_PMOS_DGS Q?
U 1 1 5E5CD8CC
P 7500 2900
AR Path="/5E5CD8CC" Ref="Q?"  Part="1" 
AR Path="/5E4C83A3/5E5CD8CC" Ref="Q?"  Part="1" 
F 0 "Q?" V 7843 2900 50  0000 C CNN
F 1 "Q_PMOS_DGS" V 7752 2900 50  0000 C CNN
F 2 "" H 7700 3000 50  0001 C CNN
F 3 "~" H 7500 2900 50  0001 C CNN
	1    7500 2900
	0    1    -1   0   
$EndComp
Connection ~ 6700 2800
$Comp
L power:GND #PWR?
U 1 1 5E5CD8DE
P 5800 3600
AR Path="/5E5CD8DE" Ref="#PWR?"  Part="1" 
AR Path="/5E4C83A3/5E5CD8DE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5800 3350 50  0001 C CNN
F 1 "GND" H 5805 3427 50  0000 C CNN
F 2 "" H 5800 3600 50  0001 C CNN
F 3 "" H 5800 3600 50  0001 C CNN
	1    5800 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2800 4600 2800
Wire Wire Line
	8600 2800 7700 2800
Text HLabel 4400 2800 0    50   Input ~ 0
VIN
Text HLabel 8600 2800 2    50   Output ~ 0
VOUT
Text Notes 5050 2750 0    50   ~ 0
reverse polarity protection
Wire Wire Line
	5150 2800 5800 2800
Connection ~ 5150 2800
$Comp
L power:GND #PWR?
U 1 1 5E794A53
P 4800 3650
AR Path="/5E794A53" Ref="#PWR?"  Part="1" 
AR Path="/5E4C83A3/5E794A53" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4800 3400 50  0001 C CNN
F 1 "GND" H 4805 3477 50  0000 C CNN
F 2 "" H 4800 3650 50  0001 C CNN
F 3 "" H 4800 3650 50  0001 C CNN
	1    4800 3650
	1    0    0    -1  
$EndComp
Text Notes 7700 2750 0    50   ~ 0
overvoltage protection
Wire Wire Line
	5800 3150 5800 3200
$Comp
L Device:R R?
U 1 1 5E79E68C
P 6050 3200
AR Path="/5E79E68C" Ref="R?"  Part="1" 
AR Path="/5E4C83A3/5E79E68C" Ref="R?"  Part="1" 
F 0 "R?" H 5980 3154 50  0000 R CNN
F 1 "R" H 5980 3245 50  0000 R CNN
F 2 "" V 5980 3200 50  0001 C CNN
F 3 "~" H 6050 3200 50  0001 C CNN
	1    6050 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 3200 5800 3200
Connection ~ 5800 3200
Wire Wire Line
	5800 3200 5800 3250
$Comp
L Device:D_Zener D?
U 1 1 5E79FD77
P 6250 3000
AR Path="/5E79FD77" Ref="D?"  Part="1" 
AR Path="/5E4C83A3/5E79FD77" Ref="D?"  Part="1" 
F 0 "D?" V 6204 3079 50  0000 L CNN
F 1 "D_Zener" V 6295 3079 50  0000 L CNN
F 2 "" H 6250 3000 50  0001 C CNN
F 3 "~" H 6250 3000 50  0001 C CNN
	1    6250 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 3150 6250 3200
Wire Wire Line
	6250 3200 6200 3200
Wire Wire Line
	6250 2850 6250 2800
Connection ~ 6250 2800
Wire Wire Line
	6250 2800 5800 2800
Wire Wire Line
	6250 3200 6400 3200
Connection ~ 6250 3200
Wire Wire Line
	5800 3550 5800 3600
$Comp
L Device:R R?
U 1 1 5E7A5D71
P 7500 3650
AR Path="/5E7A5D71" Ref="R?"  Part="1" 
AR Path="/5E4C83A3/5E7A5D71" Ref="R?"  Part="1" 
F 0 "R?" H 7430 3604 50  0000 R CNN
F 1 "R" H 7430 3695 50  0000 R CNN
F 2 "" V 7430 3650 50  0001 C CNN
F 3 "~" H 7500 3650 50  0001 C CNN
	1    7500 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D?
U 1 1 5E7A6D74
P 7150 3000
AR Path="/5E7A6D74" Ref="D?"  Part="1" 
AR Path="/5E4C83A3/5E7A6D74" Ref="D?"  Part="1" 
F 0 "D?" V 7104 3079 50  0000 L CNN
F 1 "D_Zener" V 7195 3079 50  0000 L CNN
F 2 "" H 7150 3000 50  0001 C CNN
F 3 "~" H 7150 3000 50  0001 C CNN
	1    7150 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	7150 2850 7150 2800
Wire Wire Line
	6700 2800 7150 2800
Wire Wire Line
	7150 2800 7300 2800
Connection ~ 7150 2800
Wire Wire Line
	7500 3100 7500 3200
Wire Wire Line
	7150 3150 7150 3200
Wire Wire Line
	7150 3200 7500 3200
Connection ~ 7500 3200
Wire Wire Line
	7500 3200 7500 3450
$Comp
L power:GND #PWR?
U 1 1 5E7B417B
P 7500 3850
AR Path="/5E7B417B" Ref="#PWR?"  Part="1" 
AR Path="/5E4C83A3/5E7B417B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7500 3600 50  0001 C CNN
F 1 "GND" H 7505 3677 50  0000 C CNN
F 2 "" H 7500 3850 50  0001 C CNN
F 3 "" H 7500 3850 50  0001 C CNN
	1    7500 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3850 7500 3800
Wire Wire Line
	6700 3400 6700 3450
Wire Wire Line
	6700 3450 7500 3450
Wire Wire Line
	7500 3450 7500 3500
Connection ~ 7500 3450
Wire Wire Line
	4800 3550 4800 3650
Text Notes 5900 3600 0    50   ~ 0
Threshold = 5V\n
Text Notes 7600 3650 0    50   ~ 0
Big pulldown
Text Notes 4250 3600 0    50   ~ 0
Gate protection zener + resistor
Text Notes 6300 2900 0    50   ~ 0
Gate protection Zener
Text Notes 7500 3150 0    50   ~ 0
Gate protection Zener
Text Notes 5400 2100 0    50   ~ 0
Gate protection zeners can be at 10V, resistor selected s.t. bias current for zener met at BVGSS?
$EndSCHEMATC
