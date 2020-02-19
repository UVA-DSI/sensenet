EESchema Schematic File Version 4
LIBS:wsn-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 8
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
L Device:Solar_Cell SC?
U 1 1 5E4F1943
P -800 3750
F 0 "SC?" H -692 3846 50  0000 L CNN
F 1 "Solar_Cell" H -692 3755 50  0000 L CNN
F 2 "" V -800 3810 50  0001 C CNN
F 3 "~" V -800 3810 50  0001 C CNN
	1    -800 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT?
U 1 1 5E4383A7
P 3200 2300
F 0 "BT?" H 3082 2259 50  0000 R CNN
F 1 "Battery_Cell" H 3082 2350 50  0000 R CNN
F 2 "" V 3200 2360 50  0001 C CNN
F 3 "~" V 3200 2360 50  0001 C CNN
F 4 "18650" H 3082 2441 50  0000 R CNN "Type"
	1    3200 2300
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E5E0597
P -800 4350
F 0 "#PWR?" H -800 4100 50  0001 C CNN
F 1 "GND" H -795 4177 50  0000 C CNN
F 2 "" H -800 4350 50  0001 C CNN
F 3 "" H -800 4350 50  0001 C CNN
	1    -800 4350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	-800 4350 -800 3850
Wire Wire Line
	-800 3550 -800 3450
$Comp
L power:GND #PWR?
U 1 1 5E621AA6
P 3200 2500
F 0 "#PWR?" H 3200 2250 50  0001 C CNN
F 1 "GND" H 3205 2327 50  0000 C CNN
F 2 "" H 3200 2500 50  0001 C CNN
F 3 "" H 3200 2500 50  0001 C CNN
	1    3200 2500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3200 2500 3200 2400
Wire Wire Line
	3200 2100 3200 2000
$Sheet
S 10300 2050 550  300 
U 5E4C9109
F0 "load" 50
F1 "load.sch" 50
F2 "VIN" I L 10300 2150 50 
F3 "EN" I L 10300 2250 50 
$EndSheet
$Sheet
S 6750 1900 1400 850 
U 5E4C7A3A
F0 "Power Management (BT1)" 50
F1 "pwr_mgr.sch" 50
F2 "VIN_DC" I L 6750 2100 50 
F3 "VBAT" B L 6750 2000 50 
F4 "VBAT_CURRENT" O R 8150 2000 50 
F5 "UNDERVOLT_THRESH" I L 6750 2250 50 
F6 "OK_THRESH_H" I L 6750 2500 50 
F7 "OK_THRESH_L" I L 6750 2400 50 
F8 "PWR_GOOD" O R 8150 2250 50 
F9 "OVERVOLT_THRESH" I L 6750 2650 50 
F10 "VOUT" O R 8150 2150 50 
$EndSheet
Wire Wire Line
	6600 2650 6750 2650
Wire Wire Line
	8150 2150 8800 2150
$Comp
L wsn_sds_design_symbols:SiP32431DR3 U?
U 1 1 5E4F9EEE
P 9250 2250
F 0 "U?" H 9250 2617 50  0000 C CNN
F 1 "SiP32431DR3" H 9250 2526 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 9250 2700 50  0001 C CNN
F 3 "http://www.vishay.com.hk/docs/66597/sip32431.pdf" H 9250 2250 50  0001 C CNN
	1    9250 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E4FB2E9
P 8800 2450
F 0 "C?" H 8915 2496 50  0000 L CNN
F 1 "1u" H 8915 2405 50  0000 L CNN
F 2 "" H 8838 2300 50  0001 C CNN
F 3 "~" H 8800 2450 50  0001 C CNN
	1    8800 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 2300 8800 2150
Connection ~ 8800 2150
Wire Wire Line
	8800 2150 8950 2150
$Comp
L power:GND #PWR?
U 1 1 5E4FEBE8
P 9250 2700
AR Path="/5E4C9109/5E4FEBE8" Ref="#PWR?"  Part="1" 
AR Path="/5E4FEBE8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9250 2450 50  0001 C CNN
F 1 "GND" H 9255 2527 50  0000 C CNN
F 2 "" H 9250 2700 50  0001 C CNN
F 3 "" H 9250 2700 50  0001 C CNN
	1    9250 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 2550 9250 2650
Wire Wire Line
	8800 2600 8800 2650
Wire Wire Line
	8800 2650 9250 2650
Connection ~ 9250 2650
Wire Wire Line
	9250 2650 9250 2700
$Comp
L Device:C C?
U 1 1 5E502140
P 9700 2450
F 0 "C?" H 9815 2496 50  0000 L CNN
F 1 "100n" H 9815 2405 50  0000 L CNN
F 2 "" H 9738 2300 50  0001 C CNN
F 3 "~" H 9700 2450 50  0001 C CNN
	1    9700 2450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9700 2600 9700 2650
Wire Wire Line
	9700 2650 9250 2650
Wire Wire Line
	9700 2300 9700 2150
Wire Wire Line
	9700 2150 9550 2150
$Comp
L wsn_sds_design_symbols:SiP32431DR3 U?
U 1 1 5E516DBD
P 9250 4550
F 0 "U?" H 9250 4917 50  0000 C CNN
F 1 "SiP32431DR3" H 9250 4826 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 9250 5000 50  0001 C CNN
F 3 "http://www.vishay.com.hk/docs/66597/sip32431.pdf" H 9250 4550 50  0001 C CNN
	1    9250 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E516DC3
P 8800 4750
F 0 "C?" H 8915 4796 50  0000 L CNN
F 1 "1u" H 8915 4705 50  0000 L CNN
F 2 "" H 8838 4600 50  0001 C CNN
F 3 "~" H 8800 4750 50  0001 C CNN
	1    8800 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 4600 8800 4450
Wire Wire Line
	8800 4450 8950 4450
$Comp
L power:GND #PWR?
U 1 1 5E516DCE
P 9250 5000
AR Path="/5E4C9109/5E516DCE" Ref="#PWR?"  Part="1" 
AR Path="/5E516DCE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9250 4750 50  0001 C CNN
F 1 "GND" H 9255 4827 50  0000 C CNN
F 2 "" H 9250 5000 50  0001 C CNN
F 3 "" H 9250 5000 50  0001 C CNN
	1    9250 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4850 9250 4950
Wire Wire Line
	8800 4900 8800 4950
Wire Wire Line
	8800 4950 9250 4950
Connection ~ 9250 4950
Wire Wire Line
	9250 4950 9250 5000
$Comp
L Device:C C?
U 1 1 5E516DD9
P 9700 4750
F 0 "C?" H 9815 4796 50  0000 L CNN
F 1 "100n" H 9815 4705 50  0000 L CNN
F 2 "" H 9738 4600 50  0001 C CNN
F 3 "~" H 9700 4750 50  0001 C CNN
	1    9700 4750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9700 4900 9700 4950
Wire Wire Line
	9700 4950 9250 4950
Wire Wire Line
	9700 4600 9700 4450
Wire Wire Line
	9700 4450 9550 4450
Wire Wire Line
	9700 2150 9900 2150
Connection ~ 9700 2150
Connection ~ 9900 2150
Wire Wire Line
	9900 2150 10100 2150
Wire Wire Line
	10100 2150 10100 2250
Wire Wire Line
	10100 2250 10300 2250
Connection ~ 10100 2150
Wire Wire Line
	10100 2150 10300 2150
$Sheet
S 6750 3000 1500 600 
U 5E607FB1
F0 "Power Management Config (BT1)" 50
F1 "pmu_config.sch" 50
F2 "OVERVOLT_THRESH" O L 6750 3100 50 
F3 "UNDERVOLT_THRESH" O L 6750 3500 50 
F4 "OK_THRESH_H" O L 6750 3250 50 
F5 "OK_THRESH_L" O L 6750 3350 50 
F6 "VBAT_STATUS" I R 8250 3100 50 
$EndSheet
Wire Wire Line
	8350 2000 8350 3100
Wire Wire Line
	8350 3100 8250 3100
Wire Wire Line
	8150 2000 8350 2000
Wire Wire Line
	6750 3100 6600 3100
Wire Wire Line
	6600 3100 6600 2650
Wire Wire Line
	6450 3250 6450 2500
Wire Wire Line
	6450 2500 6750 2500
Wire Wire Line
	6450 3250 6750 3250
Wire Wire Line
	6750 3350 6300 3350
Wire Wire Line
	6300 3350 6300 2400
Wire Wire Line
	6300 2400 6750 2400
Wire Wire Line
	8150 2250 8950 2250
Wire Wire Line
	6750 3500 6150 3500
Wire Wire Line
	6150 3500 6150 2250
Wire Wire Line
	6150 2250 6750 2250
$Sheet
S 6750 4200 1400 850 
U 5E63F3F1
F0 "Power Management (BT2)" 50
F1 "pwr_mgr.sch" 50
F2 "VIN_DC" I L 6750 4400 50 
F3 "VBAT" B L 6750 4300 50 
F4 "VBAT_CURRENT" O R 8150 4300 50 
F5 "UNDERVOLT_THRESH" I L 6750 4550 50 
F6 "OK_THRESH_H" I L 6750 4800 50 
F7 "OK_THRESH_L" I L 6750 4700 50 
F8 "PWR_GOOD" O R 8150 4550 50 
F9 "OVERVOLT_THRESH" I L 6750 4950 50 
F10 "VOUT" O R 8150 4450 50 
$EndSheet
Wire Wire Line
	6600 4950 6750 4950
Wire Wire Line
	8150 4450 8800 4450
$Sheet
S 6750 5300 1500 600 
U 5E63F3FC
F0 "Power Management Config (BT2)" 50
F1 "pmu_config.sch" 50
F2 "OVERVOLT_THRESH" O L 6750 5400 50 
F3 "UNDERVOLT_THRESH" O L 6750 5800 50 
F4 "OK_THRESH_H" O L 6750 5550 50 
F5 "OK_THRESH_L" O L 6750 5650 50 
F6 "VBAT_STATUS" I R 8250 5400 50 
$EndSheet
Wire Wire Line
	8350 4300 8350 5400
Wire Wire Line
	8350 5400 8250 5400
Wire Wire Line
	8150 4300 8350 4300
Wire Wire Line
	6750 5400 6600 5400
Wire Wire Line
	6600 5400 6600 4950
Wire Wire Line
	6450 5550 6450 4800
Wire Wire Line
	6450 4800 6750 4800
Wire Wire Line
	6450 5550 6750 5550
Wire Wire Line
	6750 5650 6300 5650
Wire Wire Line
	6300 5650 6300 4700
Wire Wire Line
	6300 4700 6750 4700
Wire Wire Line
	6750 5800 6150 5800
Wire Wire Line
	6150 5800 6150 4550
Wire Wire Line
	6150 4550 6750 4550
Wire Wire Line
	8150 4550 8950 4550
Connection ~ 8800 4450
$Comp
L Device:Battery_Cell BT?
U 1 1 5E660A32
P 3200 4600
F 0 "BT?" H 3082 4559 50  0000 R CNN
F 1 "Battery_Cell" H 3082 4650 50  0000 R CNN
F 2 "" V 3200 4660 50  0001 C CNN
F 3 "~" V 3200 4660 50  0001 C CNN
F 4 "18650" H 3082 4741 50  0000 R CNN "Type"
	1    3200 4600
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E660A38
P 3200 4800
F 0 "#PWR?" H 3200 4550 50  0001 C CNN
F 1 "GND" H 3205 4627 50  0000 C CNN
F 2 "" H 3200 4800 50  0001 C CNN
F 3 "" H 3200 4800 50  0001 C CNN
	1    3200 4800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3200 4800 3200 4700
Wire Wire Line
	3200 4400 3200 4300
Wire Wire Line
	6750 4400 5600 4400
Wire Wire Line
	5600 2100 6750 2100
Wire Wire Line
	9700 4450 9900 4450
Wire Wire Line
	9900 2150 9900 4450
Connection ~ 9700 4450
Connection ~ 4100 4300
Wire Wire Line
	4450 5300 4450 5200
Wire Wire Line
	4450 4700 4450 4800
Connection ~ 4450 4700
Wire Wire Line
	4750 4700 4450 4700
Wire Wire Line
	4750 4650 4750 4700
Connection ~ 4750 4300
Wire Wire Line
	4750 4350 4750 4300
$Comp
L Device:R R?
U 1 1 5E4F2A6B
P 4750 4500
AR Path="/5E4C8A07/5E4F2A6B" Ref="R?"  Part="1" 
AR Path="/5E4F2A6B" Ref="R?"  Part="1" 
F 0 "R?" H 4820 4546 50  0000 L CNN
F 1 "10M" H 4820 4455 50  0000 L CNN
F 2 "" V 4680 4500 50  0001 C CNN
F 3 "~" H 4750 4500 50  0001 C CNN
	1    4750 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E4F2A65
P 4450 5300
AR Path="/5E4C8A07/5E4F2A65" Ref="#PWR?"  Part="1" 
AR Path="/5E4F2A65" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4450 5050 50  0001 C CNN
F 1 "GND" H 4455 5127 50  0000 C CNN
F 2 "" H 4450 5300 50  0001 C CNN
F 3 "" H 4450 5300 50  0001 C CNN
	1    4450 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4750 4100 5000
Wire Wire Line
	4100 5000 4150 5000
Wire Wire Line
	4450 4600 4450 4700
Wire Wire Line
	4100 4300 4250 4300
Wire Wire Line
	4100 4450 4100 4300
$Comp
L Device:Q_PMOS_DGS Q?
U 1 1 5E4F2A5A
P 4450 4400
AR Path="/5E4C8A07/5E4F2A5A" Ref="Q?"  Part="1" 
AR Path="/5E4F2A5A" Ref="Q?"  Part="1" 
F 0 "Q?" V 4793 4400 50  0000 C CNN
F 1 "Q_PMOS_DGS" V 4702 4400 50  0000 C CNN
F 2 "" H 4650 4500 50  0001 C CNN
F 3 "~" H 4450 4400 50  0001 C CNN
	1    4450 4400
	0    -1   -1   0   
$EndComp
$Comp
L Device:Q_NMOS_DGS Q?
U 1 1 5E4F2A54
P 4350 5000
AR Path="/5E4C8A07/5E4F2A54" Ref="Q?"  Part="1" 
AR Path="/5E4F2A54" Ref="Q?"  Part="1" 
F 0 "Q?" H 4556 5046 50  0000 L CNN
F 1 "Q_NMOS_DGS" H 4556 4955 50  0000 L CNN
F 2 "" H 4550 5100 50  0001 C CNN
F 3 "~" H 4350 5000 50  0001 C CNN
	1    4350 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E4F2A4E
P 4100 4600
AR Path="/5E4C8A07/5E4F2A4E" Ref="R?"  Part="1" 
AR Path="/5E4F2A4E" Ref="R?"  Part="1" 
F 0 "R?" H 4170 4646 50  0000 L CNN
F 1 "R" H 4170 4555 50  0000 L CNN
F 2 "" V 4030 4600 50  0001 C CNN
F 3 "~" H 4100 4600 50  0001 C CNN
	1    4100 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4300 4750 4300
Wire Wire Line
	4750 4300 6750 4300
Wire Wire Line
	3200 4300 4100 4300
Wire Wire Line
	4450 3000 4450 2900
Wire Wire Line
	4450 2400 4450 2500
Connection ~ 4450 2400
Wire Wire Line
	4750 2400 4450 2400
Wire Wire Line
	4750 2350 4750 2400
Wire Wire Line
	4750 2050 4750 2000
$Comp
L Device:R R?
U 1 1 5E511817
P 4750 2200
AR Path="/5E4C8A07/5E511817" Ref="R?"  Part="1" 
AR Path="/5E511817" Ref="R?"  Part="1" 
F 0 "R?" H 4820 2246 50  0000 L CNN
F 1 "10M" H 4820 2155 50  0000 L CNN
F 2 "" V 4680 2200 50  0001 C CNN
F 3 "~" H 4750 2200 50  0001 C CNN
	1    4750 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E51181D
P 4450 3000
AR Path="/5E4C8A07/5E51181D" Ref="#PWR?"  Part="1" 
AR Path="/5E51181D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4450 2750 50  0001 C CNN
F 1 "GND" H 4455 2827 50  0000 C CNN
F 2 "" H 4450 3000 50  0001 C CNN
F 3 "" H 4450 3000 50  0001 C CNN
	1    4450 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2450 4100 2700
Wire Wire Line
	4100 2700 4150 2700
Wire Wire Line
	4450 2300 4450 2400
Wire Wire Line
	4100 2150 4100 2000
$Comp
L Device:Q_PMOS_DGS Q?
U 1 1 5E511828
P 4450 2100
AR Path="/5E4C8A07/5E511828" Ref="Q?"  Part="1" 
AR Path="/5E511828" Ref="Q?"  Part="1" 
F 0 "Q?" V 4793 2100 50  0000 C CNN
F 1 "Q_PMOS_DGS" V 4702 2100 50  0000 C CNN
F 2 "" H 4650 2200 50  0001 C CNN
F 3 "~" H 4450 2100 50  0001 C CNN
	1    4450 2100
	0    -1   -1   0   
$EndComp
$Comp
L Device:Q_NMOS_DGS Q?
U 1 1 5E51182E
P 4350 2700
AR Path="/5E4C8A07/5E51182E" Ref="Q?"  Part="1" 
AR Path="/5E51182E" Ref="Q?"  Part="1" 
F 0 "Q?" H 4556 2746 50  0000 L CNN
F 1 "Q_NMOS_DGS" H 4556 2655 50  0000 L CNN
F 2 "" H 4550 2800 50  0001 C CNN
F 3 "~" H 4350 2700 50  0001 C CNN
	1    4350 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E511834
P 4100 2300
AR Path="/5E4C8A07/5E511834" Ref="R?"  Part="1" 
AR Path="/5E511834" Ref="R?"  Part="1" 
F 0 "R?" H 4170 2346 50  0000 L CNN
F 1 "R" H 4170 2255 50  0000 L CNN
F 2 "" V 4030 2300 50  0001 C CNN
F 3 "~" H 4100 2300 50  0001 C CNN
	1    4100 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2000 4750 2000
Wire Wire Line
	-800 3450 -400 3450
$Comp
L Device:Q_PMOS_DGS Q?
U 1 1 5E536348
P -200 3550
AR Path="/5E4C83A3/5E536348" Ref="Q?"  Part="1" 
AR Path="/5E536348" Ref="Q?"  Part="1" 
F 0 "Q?" V 143 3550 50  0000 C CNN
F 1 "Q_PMOS_DGS" V 52  3550 50  0000 C CNN
F 2 "" H 0   3650 50  0001 C CNN
F 3 "~" H -200 3550 50  0001 C CNN
	1    -200 3550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E53634E
P -200 4350
AR Path="/5E4C83A3/5E53634E" Ref="#PWR?"  Part="1" 
AR Path="/5E53634E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H -200 4100 50  0001 C CNN
F 1 "GND" H -195 4177 50  0000 C CNN
F 2 "" H -200 4350 50  0001 C CNN
F 3 "" H -200 4350 50  0001 C CNN
	1    -200 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D?
U 1 1 5E53635A
P 550 4100
AR Path="/5E4C83A3/5E53635A" Ref="D?"  Part="1" 
AR Path="/5E53635A" Ref="D?"  Part="1" 
F 0 "D?" H 550 4316 50  0000 C CNN
F 1 "5V" H 550 4225 50  0000 C CNN
F 2 "" H 550 4100 50  0001 C CNN
F 3 "~" H 550 4100 50  0001 C CNN
	1    550  4100
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E536360
P 550 3700
AR Path="/5E4C83A3/5E536360" Ref="R?"  Part="1" 
AR Path="/5E536360" Ref="R?"  Part="1" 
F 0 "R?" H 480 3654 50  0000 R CNN
F 1 "120k" H 480 3745 50  0000 R CNN
F 2 "" V 480 3700 50  0001 C CNN
F 3 "~" H 550 3700 50  0001 C CNN
	1    550  3700
	-1   0    0    1   
$EndComp
Wire Wire Line
	550  3550 550  3450
$Comp
L power:GND #PWR?
U 1 1 5E536369
P 550 4350
AR Path="/5E4C83A3/5E536369" Ref="#PWR?"  Part="1" 
AR Path="/5E536369" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 550 4100 50  0001 C CNN
F 1 "GND" H 555 4177 50  0000 C CNN
F 2 "" H 550 4350 50  0001 C CNN
F 3 "" H 550 4350 50  0001 C CNN
	1    550  4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	550  4350 550  4250
Wire Wire Line
	5600 2100 5600 3450
Wire Wire Line
	2600 3450 5600 3450
Connection ~ 5600 3450
Wire Wire Line
	5600 3450 5600 4400
Text Notes -400 3000 0    50   ~ 0
need  <8V gate-source zener clamp to prevent mosfet destruction\n\nmin zener current for stabilization * Resistor + Vzener = threshold?
Text Notes -500 4900 0    50   ~ 0
reverse polarity clamp should activate at 5.5V, overvoltage protection should activate at 5.1V
$Comp
L Device:D_Zener D?
U 1 1 5E4DC5A2
P 150 3700
AR Path="/5E4C83A3/5E4DC5A2" Ref="D?"  Part="1" 
AR Path="/5E4DC5A2" Ref="D?"  Part="1" 
F 0 "D?" H 150 3916 50  0000 C CNN
F 1 "5V" H 150 3825 50  0000 C CNN
F 2 "" H 150 3700 50  0001 C CNN
F 3 "~" H 150 3700 50  0001 C CNN
	1    150  3700
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E4E9E5B
P -200 4100
AR Path="/5E4C83A3/5E4E9E5B" Ref="R?"  Part="1" 
AR Path="/5E4E9E5B" Ref="R?"  Part="1" 
F 0 "R?" H -270 4054 50  0000 R CNN
F 1 "470k" H -270 4145 50  0000 R CNN
F 2 "" V -270 4100 50  0001 C CNN
F 3 "~" H -200 4100 50  0001 C CNN
	1    -200 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	150  3550 150  3450
Connection ~ 150  3450
Wire Wire Line
	150  3450 0    3450
Wire Wire Line
	-200 3900 150  3900
Wire Wire Line
	150  3900 150  3850
Wire Wire Line
	-200 3750 -200 3900
Wire Wire Line
	-200 3900 -200 3950
Connection ~ -200 3900
Wire Wire Line
	-200 4250 -200 4350
Wire Wire Line
	150  3450 550  3450
Connection ~ 550  3450
$Comp
L Device:R R?
U 1 1 5E55D7F8
P 950 3900
AR Path="/5E4C83A3/5E55D7F8" Ref="R?"  Part="1" 
AR Path="/5E55D7F8" Ref="R?"  Part="1" 
F 0 "R?" H 880 3854 50  0000 R CNN
F 1 "470k" H 880 3945 50  0000 R CNN
F 2 "" V 880 3900 50  0001 C CNN
F 3 "~" H 950 3900 50  0001 C CNN
	1    950  3900
	0    1    1    0   
$EndComp
Wire Wire Line
	550  3850 550  3900
Wire Wire Line
	800  3900 550  3900
Connection ~ 550  3900
Wire Wire Line
	550  3900 550  3950
$Comp
L Device:D_Zener D?
U 1 1 5E56D26F
P 1250 3650
AR Path="/5E4C83A3/5E56D26F" Ref="D?"  Part="1" 
AR Path="/5E56D26F" Ref="D?"  Part="1" 
F 0 "D?" H 1250 3866 50  0000 C CNN
F 1 "5V" H 1250 3775 50  0000 C CNN
F 2 "" H 1250 3650 50  0001 C CNN
F 3 "~" H 1250 3650 50  0001 C CNN
	1    1250 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	1250 3500 1250 3450
Wire Wire Line
	550  3450 1250 3450
Wire Wire Line
	1250 3800 1250 3900
Wire Wire Line
	1250 3900 1100 3900
Connection ~ 1250 3450
$Comp
L Device:R R?
U 1 1 5E5BDE14
P 2400 4150
AR Path="/5E4C83A3/5E5BDE14" Ref="R?"  Part="1" 
AR Path="/5E5BDE14" Ref="R?"  Part="1" 
F 0 "R?" H 2330 4104 50  0000 R CNN
F 1 "470k" H 2330 4195 50  0000 R CNN
F 2 "" V 2330 4150 50  0001 C CNN
F 3 "~" H 2400 4150 50  0001 C CNN
	1    2400 4150
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E5BDE1A
P 2400 4350
AR Path="/5E4C83A3/5E5BDE1A" Ref="#PWR?"  Part="1" 
AR Path="/5E5BDE1A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2400 4100 50  0001 C CNN
F 1 "GND" H 2405 4177 50  0000 C CNN
F 2 "" H 2400 4350 50  0001 C CNN
F 3 "" H 2400 4350 50  0001 C CNN
	1    2400 4350
	1    0    0    -1  
$EndComp
Connection ~ 1900 3450
Wire Wire Line
	1900 3450 1250 3450
Wire Wire Line
	1250 3900 1500 3900
Wire Wire Line
	1500 3900 1500 3700
Connection ~ 1250 3900
$Comp
L Device:Q_PMOS_DGS Q?
U 1 1 5E6A2591
P 2400 3550
AR Path="/5E4C83A3/5E6A2591" Ref="Q?"  Part="1" 
AR Path="/5E6A2591" Ref="Q?"  Part="1" 
F 0 "Q?" V 2743 3550 50  0000 C CNN
F 1 "Q_PMOS_DGS" V 2652 3550 50  0000 C CNN
F 2 "" H 2600 3650 50  0001 C CNN
F 3 "~" H 2400 3550 50  0001 C CNN
	1    2400 3550
	0    1    -1   0   
$EndComp
Wire Wire Line
	2400 3950 2400 3750
Wire Wire Line
	2400 4350 2400 4300
Text Notes -450 4800 0    50   ~ 0
LT1389, DMG3401LSN-7
Wire Wire Line
	1900 3950 2400 3950
Wire Wire Line
	1900 3450 2200 3450
Wire Wire Line
	1900 3500 1900 3450
Wire Wire Line
	1500 3700 1600 3700
Wire Wire Line
	1900 3900 1900 3950
$Comp
L Device:Q_PMOS_DGS Q?
U 1 1 5E536354
P 1800 3700
AR Path="/5E4C83A3/5E536354" Ref="Q?"  Part="1" 
AR Path="/5E536354" Ref="Q?"  Part="1" 
F 0 "Q?" V 2143 3700 50  0000 C CNN
F 1 "Q_PMOS_DGS" V 2052 3700 50  0000 C CNN
F 2 "" H 2000 3800 50  0001 C CNN
F 3 "~" H 1800 3700 50  0001 C CNN
	1    1800 3700
	1    0    0    1   
$EndComp
Wire Wire Line
	2400 4000 2400 3950
Connection ~ 2400 3950
Text Notes 3200 5650 0    50   ~ 0
alternative to this: SiP32101
Text Notes -650 2200 0    50   ~ 0
solder jumpers to forgo the polarity checking for efficiency
Text Notes 2650 3900 0    50   ~ 0
average loss from panel within voltage limits = 1.5 uA?
Text Notes 2250 5950 0    50   ~ 0
assuming leakage doesn't flip the transistors on, average current consumption should be 400 nA max
Text Notes 2250 1450 0    50   ~ 0
assuming leakage doesn't flip the transistors on, average current consumption should be 400 nA max
Text Notes 5600 1300 0    50   ~ 0
worst case 4V applied across resistors totaling to 10M -> 400 nA + approx 400 nA from charger.\n\nworst case 1 uA
Text Notes 6800 6200 0    50   ~ 0
worst case 1 uA
Text Notes 8550 5700 0    50   ~ 0
absolute worst case charging loss: 5 uA max, typ. 2 uA if polarity protection is skipped checked\n\n1.5 uA of which doesn't exist if no solar panel attached\n\nbattery leakage should be 0.5 uA + typ sleep power of control units (1.2 uA + 1.28 uA if no standby, else 1.5 uA total on standby w/ RTC)
$Comp
L Jumper:SolderJumper_2_Bridged JP?
U 1 1 5E790DDE
P 3700 2000
F 0 "JP?" H 3700 2205 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 3700 2114 50  0000 C CNN
F 2 "" H 3700 2000 50  0001 C CNN
F 3 "~" H 3700 2000 50  0001 C CNN
	1    3700 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 2000 3400 2000
Wire Wire Line
	3850 2000 4100 2000
Connection ~ 4100 2000
Wire Wire Line
	4100 2000 4250 2000
$Comp
L Jumper:SolderJumper_2_Bridged JP?
U 1 1 5E79D20E
P 5250 2000
F 0 "JP?" H 5250 2205 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 5250 2114 50  0000 C CNN
F 2 "" H 5250 2000 50  0001 C CNN
F 3 "~" H 5250 2000 50  0001 C CNN
	1    5250 2000
	1    0    0    -1  
$EndComp
Connection ~ 4750 2000
Wire Wire Line
	4750 2000 5100 2000
Wire Wire Line
	5400 2000 5750 2000
Wire Wire Line
	4300 1600 3400 1600
Wire Wire Line
	3400 1600 3400 2000
Connection ~ 3400 2000
Wire Wire Line
	3400 2000 3200 2000
Wire Wire Line
	4600 1600 5750 1600
Wire Wire Line
	5750 1600 5750 2000
Connection ~ 5750 2000
Wire Wire Line
	5750 2000 6750 2000
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 5E7C6502
P 4450 1600
F 0 "JP?" H 4450 1805 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 4450 1714 50  0000 C CNN
F 2 "" H 4450 1600 50  0001 C CNN
F 3 "~" H 4450 1600 50  0001 C CNN
	1    4450 1600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
