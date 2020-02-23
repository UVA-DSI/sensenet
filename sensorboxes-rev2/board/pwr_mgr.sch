EESchema Schematic File Version 4
LIBS:wsn-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 7800 3550
Wire Wire Line
	7950 3550 7800 3550
Text HLabel 7950 3550 2    50   Output ~ 0
VOUT
Text HLabel 7950 2950 2    50   Output ~ 0
PWR_GOOD
Wire Wire Line
	5400 2300 7100 2300
Text HLabel 5400 2300 0    50   BiDi ~ 0
VBAT
Text HLabel 4900 2400 0    50   Input ~ 0
VIN_DC
$Comp
L Battery_Management:BQ25504 U?
U 1 1 5E5637CF
P 6700 3250
AR Path="/5E5637CF" Ref="U?"  Part="1" 
AR Path="/5E4C7A3A/5E5637CF" Ref="U?"  Part="1" 
AR Path="/5E50A26F/5E5637CF" Ref="U?"  Part="1" 
AR Path="/5E63F3F1/5E5637CF" Ref="U?"  Part="1" 
F 0 "U?" H 7344 3296 50  0000 L CNN
F 1 "BQ25504" H 7344 3205 50  0000 L CNN
F 2 "Package_DFN_QFN:QFN-16-1EP_3x3mm_P0.5mm_EP1.8x1.8mm" H 6700 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/bq25504.pdf" H 6400 4050 50  0001 C CNN
	1    6700 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E5637C8
P 6800 1500
AR Path="/5E5637C8" Ref="C?"  Part="1" 
AR Path="/5E4C7A3A/5E5637C8" Ref="C?"  Part="1" 
AR Path="/5E50A26F/5E5637C8" Ref="C?"  Part="1" 
AR Path="/5E63F3F1/5E5637C8" Ref="C?"  Part="1" 
F 0 "C?" H 6915 1546 50  0000 L CNN
F 1 "4.7u" H 6915 1455 50  0000 L CNN
F 2 "" H 6838 1350 50  0001 C CNN
F 3 "~" H 6800 1500 50  0001 C CNN
	1    6800 1500
	1    0    0    1   
$EndComp
$Comp
L Device:L L?
U 1 1 5E5637C2
P 6800 1900
AR Path="/5E5637C2" Ref="L?"  Part="1" 
AR Path="/5E4C7A3A/5E5637C2" Ref="L?"  Part="1" 
AR Path="/5E50A26F/5E5637C2" Ref="L?"  Part="1" 
AR Path="/5E63F3F1/5E5637C2" Ref="L?"  Part="1" 
F 0 "L?" H 6853 1946 50  0000 L CNN
F 1 "22u" H 6853 1855 50  0000 L CNN
F 2 "" H 6800 1900 50  0001 C CNN
F 3 "~" H 6800 1900 50  0001 C CNN
	1    6800 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E5637BC
P 5050 2600
AR Path="/5E5637BC" Ref="R?"  Part="1" 
AR Path="/5E4C7A3A/5E5637BC" Ref="R?"  Part="1" 
AR Path="/5E50A26F/5E5637BC" Ref="R?"  Part="1" 
AR Path="/5E63F3F1/5E5637BC" Ref="R?"  Part="1" 
F 0 "R?" H 5120 2646 50  0000 L CNN
F 1 "2.7" H 5120 2555 50  0000 L CNN
F 2 "" V 4980 2600 50  0001 C CNN
F 3 "~" H 5050 2600 50  0001 C CNN
	1    5050 2600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6800 1650 6800 1700
Connection ~ 6800 1700
Wire Wire Line
	6800 1700 6800 1750
Wire Wire Line
	7100 2300 7100 2450
Wire Wire Line
	6800 2050 6800 2450
Wire Wire Line
	6300 1700 6800 1700
Wire Wire Line
	6300 1700 6300 2400
$Comp
L Device:R R?
U 1 1 5E5637AF
P 5050 3300
AR Path="/5E5637AF" Ref="R?"  Part="1" 
AR Path="/5E4C7A3A/5E5637AF" Ref="R?"  Part="1" 
AR Path="/5E50A26F/5E5637AF" Ref="R?"  Part="1" 
AR Path="/5E63F3F1/5E5637AF" Ref="R?"  Part="1" 
F 0 "R?" V 5257 3300 50  0000 C CNN
F 1 "8.2M" V 5166 3300 50  0000 C CNN
F 2 "" V 4980 3300 50  0001 C CNN
F 3 "~" H 5050 3300 50  0001 C CNN
	1    5050 3300
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E5637A3
P 5050 3500
AR Path="/5E5637A3" Ref="#PWR?"  Part="1" 
AR Path="/5E4C7A3A/5E5637A3" Ref="#PWR?"  Part="1" 
AR Path="/5E50A26F/5E5637A3" Ref="#PWR?"  Part="1" 
AR Path="/5E63F3F1/5E5637A3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5050 3250 50  0001 C CNN
F 1 "GND" V 5055 3372 50  0000 R CNN
F 2 "" H 5050 3500 50  0001 C CNN
F 3 "" H 5050 3500 50  0001 C CNN
	1    5050 3500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5050 3500 5050 3450
$Comp
L power:GND #PWR?
U 1 1 5E56379C
P 6800 1200
AR Path="/5E56379C" Ref="#PWR?"  Part="1" 
AR Path="/5E4C7A3A/5E56379C" Ref="#PWR?"  Part="1" 
AR Path="/5E50A26F/5E56379C" Ref="#PWR?"  Part="1" 
AR Path="/5E63F3F1/5E56379C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6800 950 50  0001 C CNN
F 1 "GND" V 6805 1072 50  0000 R CNN
F 2 "" H 6800 1200 50  0001 C CNN
F 3 "" H 6800 1200 50  0001 C CNN
	1    6800 1200
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5E563796
P 5850 3550
AR Path="/5E563796" Ref="C?"  Part="1" 
AR Path="/5E4C7A3A/5E563796" Ref="C?"  Part="1" 
AR Path="/5E50A26F/5E563796" Ref="C?"  Part="1" 
AR Path="/5E63F3F1/5E563796" Ref="C?"  Part="1" 
F 0 "C?" V 6102 3550 50  0000 C CNN
F 1 "10n" V 6011 3550 50  0000 C CNN
F 2 "" H 5888 3400 50  0001 C CNN
F 3 "~" H 5850 3550 50  0001 C CNN
	1    5850 3550
	0    1    -1   0   
$EndComp
Wire Wire Line
	6000 3550 6100 3550
$Comp
L power:GND #PWR?
U 1 1 5E56378F
P 5600 3550
AR Path="/5E56378F" Ref="#PWR?"  Part="1" 
AR Path="/5E4C7A3A/5E56378F" Ref="#PWR?"  Part="1" 
AR Path="/5E50A26F/5E56378F" Ref="#PWR?"  Part="1" 
AR Path="/5E63F3F1/5E56378F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5600 3300 50  0001 C CNN
F 1 "GND" V 5605 3422 50  0000 R CNN
F 2 "" H 5600 3550 50  0001 C CNN
F 3 "" H 5600 3550 50  0001 C CNN
	1    5600 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 3550 5650 3550
Connection ~ 5650 3550
$Comp
L power:GND #PWR?
U 1 1 5E563787
P 6500 4150
AR Path="/5E563787" Ref="#PWR?"  Part="1" 
AR Path="/5E4C7A3A/5E563787" Ref="#PWR?"  Part="1" 
AR Path="/5E50A26F/5E563787" Ref="#PWR?"  Part="1" 
AR Path="/5E63F3F1/5E563787" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6500 3900 50  0001 C CNN
F 1 "GND" H 6505 3977 50  0000 C CNN
F 2 "" H 6500 4150 50  0001 C CNN
F 3 "" H 6500 4150 50  0001 C CNN
	1    6500 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4050 6500 4100
Connection ~ 6500 4100
Wire Wire Line
	6500 4100 6900 4100
Wire Wire Line
	6900 4100 6900 4050
Wire Wire Line
	6500 4100 6500 4150
Wire Wire Line
	5650 3550 5650 3650
Wire Wire Line
	5650 3650 6100 3650
Wire Wire Line
	5650 3550 5700 3550
$Comp
L Device:C C?
U 1 1 5E563770
P 7400 3850
AR Path="/5E563770" Ref="C?"  Part="1" 
AR Path="/5E4C7A3A/5E563770" Ref="C?"  Part="1" 
AR Path="/5E50A26F/5E563770" Ref="C?"  Part="1" 
AR Path="/5E63F3F1/5E563770" Ref="C?"  Part="1" 
F 0 "C?" H 7515 3896 50  0000 L CNN
F 1 "100n" H 7515 3805 50  0000 L CNN
F 2 "" H 7438 3700 50  0001 C CNN
F 3 "~" H 7400 3850 50  0001 C CNN
	1    7400 3850
	1    0    0    1   
$EndComp
Wire Wire Line
	7400 3700 7400 3550
Connection ~ 7400 3550
Wire Wire Line
	7400 3550 7300 3550
Wire Wire Line
	7800 3550 7400 3550
$Comp
L Device:C C?
U 1 1 5E563766
P 7800 3850
AR Path="/5E563766" Ref="C?"  Part="1" 
AR Path="/5E4C7A3A/5E563766" Ref="C?"  Part="1" 
AR Path="/5E50A26F/5E563766" Ref="C?"  Part="1" 
AR Path="/5E63F3F1/5E563766" Ref="C?"  Part="1" 
F 0 "C?" H 7915 3896 50  0000 L CNN
F 1 "4.7u" H 7915 3805 50  0000 L CNN
F 2 "" H 7838 3700 50  0001 C CNN
F 3 "~" H 7800 3850 50  0001 C CNN
	1    7800 3850
	1    0    0    1   
$EndComp
Wire Wire Line
	7400 4100 7400 4000
$Comp
L power:GND #PWR?
U 1 1 5E56375F
P 7600 4150
AR Path="/5E56375F" Ref="#PWR?"  Part="1" 
AR Path="/5E4C7A3A/5E56375F" Ref="#PWR?"  Part="1" 
AR Path="/5E50A26F/5E56375F" Ref="#PWR?"  Part="1" 
AR Path="/5E63F3F1/5E56375F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7600 3900 50  0001 C CNN
F 1 "GND" H 7605 3977 50  0000 C CNN
F 2 "" H 7600 4150 50  0001 C CNN
F 3 "" H 7600 4150 50  0001 C CNN
	1    7600 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 4100 7400 4100
Connection ~ 7600 4100
Wire Wire Line
	7600 4150 7600 4100
Wire Wire Line
	7600 4100 7800 4100
Wire Wire Line
	7800 4100 7800 4000
Wire Wire Line
	7800 3700 7800 3550
Wire Wire Line
	6800 1200 6800 1350
Wire Wire Line
	7300 2950 7950 2950
$Comp
L Device:R_POT RV?
U 1 1 5E52A1D3
P 5050 2950
AR Path="/5E52A1D3" Ref="RV?"  Part="1" 
AR Path="/5E4C7A3A/5E52A1D3" Ref="RV?"  Part="1" 
AR Path="/5E63F3F1/5E52A1D3" Ref="RV?"  Part="1" 
F 0 "RV?" H 4980 2904 50  0000 R CNN
F 1 "1M" H 4980 2995 50  0000 R CNN
F 2 "" H 5050 2950 50  0001 C CNN
F 3 "~" H 5050 2950 50  0001 C CNN
	1    5050 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3100 5050 3150
Wire Wire Line
	5050 2750 5050 2800
Wire Wire Line
	5200 2950 6100 2950
Wire Wire Line
	4900 2400 5050 2400
Wire Wire Line
	5050 2400 5050 2450
Wire Wire Line
	5050 2400 6300 2400
Connection ~ 5050 2400
Connection ~ 6300 2400
Wire Wire Line
	6300 2400 6300 2450
Wire Wire Line
	6100 3050 6000 3050
Text HLabel 6000 3050 0    50   Output ~ 0
VBAT_CURRENT
$EndSCHEMATC
