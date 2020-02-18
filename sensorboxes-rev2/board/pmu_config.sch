EESchema Schematic File Version 4
LIBS:wsn-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 5850 3250 0    50   ~ 0
VBAT_OK = 3.75V
Text Notes 3700 5250 0    50   ~ 0
configuration of power management,\nvbat_status divided down yields each threshold, which is compared against internal references.
Text Notes 4000 3250 0    50   ~ 0
VOV = 4.2V
Wire Wire Line
	4900 3400 4900 3300
$Comp
L Device:R R?
U 1 1 5E6162D6
P 4900 3550
AR Path="/5E6162D6" Ref="R?"  Part="1" 
AR Path="/5E4C7A3A/5E6162D6" Ref="R?"  Part="1" 
AR Path="/5E607FB1/5E6162D6" Ref="R?"  Part="1" 
AR Path="/5E608311/5E6162D6" Ref="R?"  Part="1" 
AR Path="/5E63F3FC/5E6162D6" Ref="R?"  Part="1" 
F 0 "R?" H 4830 3504 50  0000 R CNN
F 1 "3.9M" H 4830 3595 50  0000 R CNN
F 2 "" V 4830 3550 50  0001 C CNN
F 3 "~" H 4900 3550 50  0001 C CNN
	1    4900 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 2900 4900 3000
$Comp
L Device:R R?
U 1 1 5E6162DD
P 4900 2750
AR Path="/5E6162DD" Ref="R?"  Part="1" 
AR Path="/5E4C7A3A/5E6162DD" Ref="R?"  Part="1" 
AR Path="/5E607FB1/5E6162DD" Ref="R?"  Part="1" 
AR Path="/5E608311/5E6162DD" Ref="R?"  Part="1" 
AR Path="/5E63F3FC/5E6162DD" Ref="R?"  Part="1" 
F 0 "R?" V 4693 2750 50  0000 C CNN
F 1 "4.7M" V 4784 2750 50  0000 C CNN
F 2 "" V 4830 2750 50  0001 C CNN
F 3 "~" H 4900 2750 50  0001 C CNN
	1    4900 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV?
U 1 1 5E6162E3
P 4900 3150
AR Path="/5E6162E3" Ref="RV?"  Part="1" 
AR Path="/5E4C7A3A/5E6162E3" Ref="RV?"  Part="1" 
AR Path="/5E607FB1/5E6162E3" Ref="RV?"  Part="1" 
AR Path="/5E608311/5E6162E3" Ref="RV?"  Part="1" 
AR Path="/5E63F3FC/5E6162E3" Ref="RV?"  Part="1" 
F 0 "RV?" H 4830 3104 50  0000 R CNN
F 1 "1M" H 4830 3195 50  0000 R CNN
F 2 "" H 4900 3150 50  0001 C CNN
F 3 "~" H 4900 3150 50  0001 C CNN
	1    4900 3150
	-1   0    0    1   
$EndComp
Text Notes 4450 4350 0    50   ~ 0
VUV = 3.25V
Wire Wire Line
	5350 4500 5350 4400
$Comp
L Device:R R?
U 1 1 5E6162EB
P 5350 4650
AR Path="/5E6162EB" Ref="R?"  Part="1" 
AR Path="/5E4C7A3A/5E6162EB" Ref="R?"  Part="1" 
AR Path="/5E607FB1/5E6162EB" Ref="R?"  Part="1" 
AR Path="/5E608311/5E6162EB" Ref="R?"  Part="1" 
AR Path="/5E63F3FC/5E6162EB" Ref="R?"  Part="1" 
F 0 "R?" H 5280 4604 50  0000 R CNN
F 1 "3.3M" H 5280 4695 50  0000 R CNN
F 2 "" V 5280 4650 50  0001 C CNN
F 3 "~" H 5350 4650 50  0001 C CNN
	1    5350 4650
	-1   0    0    1   
$EndComp
Wire Wire Line
	5350 4000 5350 4100
$Comp
L Device:R R?
U 1 1 5E6162F2
P 5350 3850
AR Path="/5E6162F2" Ref="R?"  Part="1" 
AR Path="/5E4C7A3A/5E6162F2" Ref="R?"  Part="1" 
AR Path="/5E607FB1/5E6162F2" Ref="R?"  Part="1" 
AR Path="/5E608311/5E6162F2" Ref="R?"  Part="1" 
AR Path="/5E63F3FC/5E6162F2" Ref="R?"  Part="1" 
F 0 "R?" V 5143 3850 50  0000 C CNN
F 1 "5.6M" V 5234 3850 50  0000 C CNN
F 2 "" V 5280 3850 50  0001 C CNN
F 3 "~" H 5350 3850 50  0001 C CNN
	1    5350 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV?
U 1 1 5E6162F8
P 5350 4250
AR Path="/5E6162F8" Ref="RV?"  Part="1" 
AR Path="/5E4C7A3A/5E6162F8" Ref="RV?"  Part="1" 
AR Path="/5E607FB1/5E6162F8" Ref="RV?"  Part="1" 
AR Path="/5E608311/5E6162F8" Ref="RV?"  Part="1" 
AR Path="/5E63F3FC/5E6162F8" Ref="RV?"  Part="1" 
F 0 "RV?" H 5280 4204 50  0000 R CNN
F 1 "1M" H 5280 4295 50  0000 R CNN
F 2 "" H 5350 4250 50  0001 C CNN
F 3 "~" H 5350 4250 50  0001 C CNN
	1    5350 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	5750 4500 5750 4550
$Comp
L power:GND #PWR?
U 1 1 5E6162FF
P 5750 4550
AR Path="/5E6162FF" Ref="#PWR?"  Part="1" 
AR Path="/5E4C7A3A/5E6162FF" Ref="#PWR?"  Part="1" 
AR Path="/5E50A26F/5E6162FF" Ref="#PWR?"  Part="1" 
AR Path="/5E607FB1/5E6162FF" Ref="#PWR?"  Part="1" 
AR Path="/5E608311/5E6162FF" Ref="#PWR?"  Part="1" 
AR Path="/5E63F3FC/5E6162FF" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5750 4300 50  0001 C CNN
F 1 "GND" H 5755 4377 50  0000 C CNN
F 2 "" H 5750 4550 50  0001 C CNN
F 3 "" H 5750 4550 50  0001 C CNN
	1    5750 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E616305
P 5750 2750
AR Path="/5E616305" Ref="R?"  Part="1" 
AR Path="/5E4C7A3A/5E616305" Ref="R?"  Part="1" 
AR Path="/5E607FB1/5E616305" Ref="R?"  Part="1" 
AR Path="/5E608311/5E616305" Ref="R?"  Part="1" 
AR Path="/5E63F3FC/5E616305" Ref="R?"  Part="1" 
F 0 "R?" V 5543 2750 50  0000 C CNN
F 1 "270k" V 5634 2750 50  0000 C CNN
F 2 "" V 5680 2750 50  0001 C CNN
F 3 "~" H 5750 2750 50  0001 C CNN
	1    5750 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV?
U 1 1 5E61630B
P 5750 3150
AR Path="/5E61630B" Ref="RV?"  Part="1" 
AR Path="/5E4C7A3A/5E61630B" Ref="RV?"  Part="1" 
AR Path="/5E607FB1/5E61630B" Ref="RV?"  Part="1" 
AR Path="/5E608311/5E61630B" Ref="RV?"  Part="1" 
AR Path="/5E63F3FC/5E61630B" Ref="RV?"  Part="1" 
F 0 "RV?" H 5681 3104 50  0000 R CNN
F 1 "100k" H 5681 3195 50  0000 R CNN
F 2 "" H 5750 3150 50  0001 C CNN
F 3 "~" H 5750 3150 50  0001 C CNN
	1    5750 3150
	1    0    0    1   
$EndComp
Text Notes 5900 4050 0    50   ~ 0
VBAT_NOT_OK = 3.6V
$Comp
L Device:R_POT RV?
U 1 1 5E616312
P 5750 3950
AR Path="/5E616312" Ref="RV?"  Part="1" 
AR Path="/5E4C7A3A/5E616312" Ref="RV?"  Part="1" 
AR Path="/5E607FB1/5E616312" Ref="RV?"  Part="1" 
AR Path="/5E608311/5E616312" Ref="RV?"  Part="1" 
AR Path="/5E63F3FC/5E616312" Ref="RV?"  Part="1" 
F 0 "RV?" H 5680 3904 50  0000 R CNN
F 1 "1M" H 5680 3995 50  0000 R CNN
F 2 "" H 5750 3950 50  0001 C CNN
F 3 "~" H 5750 3950 50  0001 C CNN
	1    5750 3950
	1    0    0    1   
$EndComp
Wire Wire Line
	5750 4100 5750 4200
Wire Wire Line
	5750 3800 5750 3700
Wire Wire Line
	5750 3300 5750 3400
Wire Wire Line
	5750 3000 5750 2900
$Comp
L Device:R R?
U 1 1 5E61631C
P 5750 3550
AR Path="/5E61631C" Ref="R?"  Part="1" 
AR Path="/5E4C7A3A/5E61631C" Ref="R?"  Part="1" 
AR Path="/5E607FB1/5E61631C" Ref="R?"  Part="1" 
AR Path="/5E608311/5E61631C" Ref="R?"  Part="1" 
AR Path="/5E63F3FC/5E61631C" Ref="R?"  Part="1" 
F 0 "R?" V 5543 3550 50  0000 C CNN
F 1 "4.7M" V 5634 3550 50  0000 C CNN
F 2 "" V 5680 3550 50  0001 C CNN
F 3 "~" H 5750 3550 50  0001 C CNN
	1    5750 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E616322
P 5750 4350
AR Path="/5E616322" Ref="R?"  Part="1" 
AR Path="/5E4C7A3A/5E616322" Ref="R?"  Part="1" 
AR Path="/5E607FB1/5E616322" Ref="R?"  Part="1" 
AR Path="/5E608311/5E616322" Ref="R?"  Part="1" 
AR Path="/5E63F3FC/5E616322" Ref="R?"  Part="1" 
F 0 "R?" H 5680 4304 50  0000 R CNN
F 1 "2.7M" H 5680 4395 50  0000 R CNN
F 2 "" V 5680 4350 50  0001 C CNN
F 3 "~" H 5750 4350 50  0001 C CNN
	1    5750 4350
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E616328
P 5350 4850
AR Path="/5E616328" Ref="#PWR?"  Part="1" 
AR Path="/5E4C7A3A/5E616328" Ref="#PWR?"  Part="1" 
AR Path="/5E50A26F/5E616328" Ref="#PWR?"  Part="1" 
AR Path="/5E607FB1/5E616328" Ref="#PWR?"  Part="1" 
AR Path="/5E608311/5E616328" Ref="#PWR?"  Part="1" 
AR Path="/5E63F3FC/5E616328" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5350 4600 50  0001 C CNN
F 1 "GND" H 5355 4677 50  0000 C CNN
F 2 "" H 5350 4850 50  0001 C CNN
F 3 "" H 5350 4850 50  0001 C CNN
	1    5350 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4800 5350 4850
$Comp
L power:GND #PWR?
U 1 1 5E61632F
P 4900 3750
AR Path="/5E61632F" Ref="#PWR?"  Part="1" 
AR Path="/5E4C7A3A/5E61632F" Ref="#PWR?"  Part="1" 
AR Path="/5E50A26F/5E61632F" Ref="#PWR?"  Part="1" 
AR Path="/5E607FB1/5E61632F" Ref="#PWR?"  Part="1" 
AR Path="/5E608311/5E61632F" Ref="#PWR?"  Part="1" 
AR Path="/5E63F3FC/5E61632F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4900 3500 50  0001 C CNN
F 1 "GND" H 4905 3577 50  0000 C CNN
F 2 "" H 4900 3750 50  0001 C CNN
F 3 "" H 4900 3750 50  0001 C CNN
	1    4900 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3700 4900 3750
Wire Wire Line
	4400 4250 5200 4250
Wire Wire Line
	5900 3150 6500 3150
Wire Wire Line
	5900 3950 6500 3950
Wire Wire Line
	3950 3150 4750 3150
Wire Wire Line
	5350 3700 5350 2500
Wire Wire Line
	5350 2500 5750 2500
Connection ~ 5350 2500
Wire Wire Line
	5350 2500 4900 2500
Wire Wire Line
	5750 2500 5750 2600
Wire Wire Line
	4900 2500 4900 2600
Text HLabel 3950 3150 0    50   Output ~ 0
OVERVOLT_THRESH
Text HLabel 4400 4250 0    50   Output ~ 0
UNDERVOLT_THRESH
Text HLabel 6500 3150 2    50   Output ~ 0
OK_THRESH_H
Text HLabel 6500 3950 2    50   Output ~ 0
OK_THRESH_L
Text HLabel 3950 2500 0    50   Input ~ 0
VBAT_STATUS
Wire Wire Line
	4900 2500 3950 2500
Connection ~ 4900 2500
$EndSCHEMATC
