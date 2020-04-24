EESchema Schematic File Version 4
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Connector:Conn_ARM_JTAG_SWD_10 J?
U 1 1 5EA2F091
P 2000 6850
F 0 "J?" H 1557 6896 50  0000 R CNN
F 1 "Conn_ARM_JTAG_SWD_10" H 1557 6805 50  0000 R CNN
F 2 "" H 2000 6850 50  0001 C CNN
F 3 "http://infocenter.arm.com/help/topic/com.arm.doc.ddi0314h/DDI0314H_coresight_components_trm.pdf" V 1650 5600 50  0001 C CNN
	1    2000 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EA3165F
P 1900 7550
F 0 "#PWR?" H 1900 7300 50  0001 C CNN
F 1 "GND" H 1905 7377 50  0000 C CNN
F 2 "" H 1900 7550 50  0001 C CNN
F 3 "" H 1900 7550 50  0001 C CNN
	1    1900 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 7450 1900 7500
Wire Wire Line
	1900 7500 2000 7500
Wire Wire Line
	2000 7500 2000 7450
Connection ~ 1900 7500
Wire Wire Line
	1900 7500 1900 7550
Wire Wire Line
	2000 6250 2000 6200
Text GLabel 3100 6550 2    50   Input ~ 0
SAML21_RESET
Text GLabel 3100 6750 2    50   Input ~ 0
SAML21_SWDCLK
Text GLabel 3100 6850 2    50   Input ~ 0
SAML21_SWDIO
Wire Wire Line
	3100 6850 2800 6850
Wire Wire Line
	3100 6750 2650 6750
Wire Wire Line
	2500 6550 3000 6550
NoConn ~ 2650 6950
NoConn ~ 2650 7050
Wire Wire Line
	2650 7050 2500 7050
Wire Wire Line
	2650 6950 2500 6950
$Comp
L Device:R R?
U 1 1 5EA3F20B
P 3000 6200
F 0 "R?" H 2930 6154 50  0000 R CNN
F 1 "R" H 2930 6245 50  0000 R CNN
F 2 "" V 2930 6200 50  0001 C CNN
F 3 "~" H 3000 6200 50  0001 C CNN
	1    3000 6200
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5EA41639
P 2800 5900
F 0 "R?" H 2870 5946 50  0000 L CNN
F 1 "R" H 2870 5855 50  0000 L CNN
F 2 "" V 2730 5900 50  0001 C CNN
F 3 "~" H 2800 5900 50  0001 C CNN
	1    2800 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EA418D1
P 2650 5600
F 0 "R?" H 2581 5554 50  0000 R CNN
F 1 "R" H 2581 5645 50  0000 R CNN
F 2 "" V 2580 5600 50  0001 C CNN
F 3 "~" H 2650 5600 50  0001 C CNN
	1    2650 5600
	1    0    0    1   
$EndComp
Wire Wire Line
	4750 1450 4950 1450
Text GLabel 5550 1450 2    50   Input ~ 0
SAML21_VDDIN
$Comp
L Device:C C?
U 1 1 5EA4B964
P 4950 1650
F 0 "C?" H 5065 1696 50  0000 L CNN
F 1 "C" H 5065 1605 50  0000 L CNN
F 2 "" H 4988 1500 50  0001 C CNN
F 3 "~" H 4950 1650 50  0001 C CNN
	1    4950 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA4C2A2
P 5250 1650
F 0 "C?" H 5365 1696 50  0000 L CNN
F 1 "C" H 5365 1605 50  0000 L CNN
F 2 "" H 5288 1500 50  0001 C CNN
F 3 "~" H 5250 1650 50  0001 C CNN
	1    5250 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1500 4950 1450
Connection ~ 4950 1450
Wire Wire Line
	5250 1500 5250 1450
Wire Wire Line
	4950 1450 5250 1450
Wire Wire Line
	5550 1450 5250 1450
Connection ~ 5250 1450
Wire Wire Line
	4950 1800 4950 1850
Wire Wire Line
	5250 1850 5250 1800
Wire Wire Line
	4950 1850 5100 1850
$Comp
L power:GND #PWR?
U 1 1 5EA4F70D
P 5100 1900
F 0 "#PWR?" H 5100 1650 50  0001 C CNN
F 1 "GND" H 5105 1727 50  0000 C CNN
F 2 "" H 5100 1900 50  0001 C CNN
F 3 "" H 5100 1900 50  0001 C CNN
	1    5100 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 1900 5100 1850
Connection ~ 5100 1850
Wire Wire Line
	5100 1850 5250 1850
Wire Wire Line
	4150 1450 3950 1450
Text GLabel 2850 1450 0    50   Input ~ 0
SAML21_VDDIN
$Comp
L Device:C C?
U 1 1 5EA55C57
P 3950 1650
F 0 "C?" H 4065 1696 50  0000 L CNN
F 1 "C" H 4065 1605 50  0000 L CNN
F 2 "" H 3988 1500 50  0001 C CNN
F 3 "~" H 3950 1650 50  0001 C CNN
	1    3950 1650
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA55C5D
P 3650 1650
F 0 "C?" H 3765 1696 50  0000 L CNN
F 1 "C" H 3765 1605 50  0000 L CNN
F 2 "" H 3688 1500 50  0001 C CNN
F 3 "~" H 3650 1650 50  0001 C CNN
	1    3650 1650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3950 1500 3950 1450
Connection ~ 3950 1450
Wire Wire Line
	3650 1500 3650 1450
Wire Wire Line
	3950 1450 3650 1450
Wire Wire Line
	3450 1450 3650 1450
Connection ~ 3650 1450
Wire Wire Line
	3950 1800 3950 1850
Wire Wire Line
	3650 1850 3650 1800
$Comp
L Device:L L?
U 1 1 5EA562C4
P 3300 1450
F 0 "L?" V 3119 1450 50  0000 C CNN
F 1 "L" V 3210 1450 50  0000 C CNN
F 2 "" H 3300 1450 50  0001 C CNN
F 3 "~" H 3300 1450 50  0001 C CNN
	1    3300 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 1450 2950 1450
Wire Wire Line
	4150 2000 4150 1450
Wire Wire Line
	4750 2000 4750 1450
Wire Wire Line
	4550 5800 4550 5850
$Comp
L power:GND #PWR?
U 1 1 5EA2B151
P 4350 5900
F 0 "#PWR?" H 4350 5650 50  0001 C CNN
F 1 "GND" H 4355 5727 50  0000 C CNN
F 2 "" H 4350 5900 50  0001 C CNN
F 3 "" H 4350 5900 50  0001 C CNN
	1    4350 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 5850 4350 5800
Wire Wire Line
	4350 5900 4350 5850
Connection ~ 4350 5850
Wire Wire Line
	4550 5850 4350 5850
$Comp
L power:GND #PWR?
U 1 1 5EA602E1
P 3800 1900
F 0 "#PWR?" H 3800 1650 50  0001 C CNN
F 1 "GND" H 3805 1727 50  0000 C CNN
F 2 "" H 3800 1900 50  0001 C CNN
F 3 "" H 3800 1900 50  0001 C CNN
	1    3800 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 1900 3800 1850
Connection ~ 3800 1850
Wire Wire Line
	3800 1850 3950 1850
Wire Wire Line
	3650 1850 3800 1850
$Comp
L Device:C C?
U 1 1 5EA64BCC
P 3900 950
F 0 "C?" H 4015 996 50  0000 L CNN
F 1 "C" H 4015 905 50  0000 L CNN
F 2 "" H 3938 800 50  0001 C CNN
F 3 "~" H 3900 950 50  0001 C CNN
	1    3900 950 
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5EA64BD2
P 3600 950
F 0 "C?" H 3715 996 50  0000 L CNN
F 1 "C" H 3715 905 50  0000 L CNN
F 2 "" H 3638 800 50  0001 C CNN
F 3 "~" H 3600 950 50  0001 C CNN
	1    3600 950 
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3900 1100 3900 1150
Wire Wire Line
	3600 1150 3600 1100
$Comp
L power:GND #PWR?
U 1 1 5EA64BDA
P 3750 1200
F 0 "#PWR?" H 3750 950 50  0001 C CNN
F 1 "GND" H 3755 1027 50  0000 C CNN
F 2 "" H 3750 1200 50  0001 C CNN
F 3 "" H 3750 1200 50  0001 C CNN
	1    3750 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1200 3750 1150
Connection ~ 3750 1150
Wire Wire Line
	3750 1150 3900 1150
Wire Wire Line
	3600 1150 3750 1150
Wire Wire Line
	4350 2000 4350 750 
Wire Wire Line
	4350 750  3900 750 
Wire Wire Line
	3600 800  3600 750 
Wire Wire Line
	3900 800  3900 750 
Connection ~ 3900 750 
Wire Wire Line
	3900 750  3600 750 
$Comp
L Device:Jumper JP?
U 1 1 5EA68B22
P 2950 1100
F 0 "JP?" H 2950 1364 50  0000 C CNN
F 1 "Jumper" H 2950 1273 50  0000 C CNN
F 2 "" H 2950 1100 50  0001 C CNN
F 3 "~" H 2950 1100 50  0001 C CNN
	1    2950 1100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2950 1450 2950 1400
Connection ~ 2950 1450
Wire Wire Line
	2950 1450 2850 1450
Wire Wire Line
	3600 750  2950 750 
Wire Wire Line
	2950 750  2950 800 
Connection ~ 3600 750 
$Comp
L Device:C C?
U 1 1 5EA71DE3
P 4950 950
F 0 "C?" H 5065 996 50  0000 L CNN
F 1 "C" H 5065 905 50  0000 L CNN
F 2 "" H 4988 800 50  0001 C CNN
F 3 "~" H 4950 950 50  0001 C CNN
	1    4950 950 
	1    0    0    1   
$EndComp
$Comp
L Device:L L?
U 1 1 5EA73BAA
P 4650 950
F 0 "L?" H 4606 904 50  0000 R CNN
F 1 "L" H 4606 995 50  0000 R CNN
F 2 "" H 4650 950 50  0001 C CNN
F 3 "~" H 4650 950 50  0001 C CNN
	1    4650 950 
	-1   0    0    1   
$EndComp
Wire Wire Line
	4650 800  4650 750 
Wire Wire Line
	4650 750  4550 750 
Wire Wire Line
	4650 1100 4650 2000
Wire Wire Line
	4550 750  4550 2000
$Comp
L power:GND #PWR?
U 1 1 5EA8D949
P 4950 1150
F 0 "#PWR?" H 4950 900 50  0001 C CNN
F 1 "GND" H 4955 977 50  0000 C CNN
F 2 "" H 4950 1150 50  0001 C CNN
F 3 "" H 4950 1150 50  0001 C CNN
	1    4950 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 1150 4950 1100
Wire Wire Line
	3000 6550 3000 6350
Connection ~ 3000 6550
Wire Wire Line
	3000 6550 3100 6550
Wire Wire Line
	3000 6050 3000 5950
Wire Wire Line
	3000 5400 3450 5400
Wire Wire Line
	2800 6850 2800 6050
Connection ~ 2800 6850
Wire Wire Line
	2800 6850 2500 6850
Wire Wire Line
	2800 5750 2800 5200
Wire Wire Line
	2800 5200 3450 5200
Wire Wire Line
	2650 6750 2650 5750
Connection ~ 2650 6750
Wire Wire Line
	2650 6750 2500 6750
Wire Wire Line
	2650 5450 2650 5100
Wire Wire Line
	2650 5100 3450 5100
Wire Wire Line
	4650 750  4950 750 
Wire Wire Line
	4950 750  4950 800 
Connection ~ 4650 750 
NoConn ~ 5450 3300
NoConn ~ 3450 2700
NoConn ~ 5450 3400
NoConn ~ 5450 3500
NoConn ~ 3450 3600
NoConn ~ 3450 3700
NoConn ~ 5450 3200
NoConn ~ 5450 3700
NoConn ~ 5450 3600
NoConn ~ 3450 2900
NoConn ~ 3450 3000
NoConn ~ 3450 2800
NoConn ~ 3450 3100
NoConn ~ 3450 3500
NoConn ~ 5450 4000
NoConn ~ 5450 4100
NoConn ~ 5450 4200
NoConn ~ 5450 4300
NoConn ~ 3450 4200
NoConn ~ 3450 4300
NoConn ~ 3450 4100
NoConn ~ 5450 2800
NoConn ~ 5450 4800
NoConn ~ 5450 3900
NoConn ~ 3450 5000
NoConn ~ 5450 4500
$Comp
L MCU_Microchip_SAML:ATSAML21J18B-AUT U?
U 1 1 5EA270F8
P 4450 3900
F 0 "U?" H 5000 2100 50  0000 C CNN
F 1 "ATSAML21J18B-AUT" H 5000 2000 50  0000 C CNN
F 2 "Package_QFP:TQFP-64_10x10mm_P0.5mm" H 5650 5700 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/60001477A.pdf" H 4450 3900 50  0001 C CNN
	1    4450 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2600 2550 2600
$Comp
L Device:Crystal_GND3 Y?
U 1 1 5EB31833
P 1400 2200
F 0 "Y?" H 1400 2468 50  0000 C CNN
F 1 "Crystal_GND3" H 1400 2377 50  0000 C CNN
F 2 "" H 1400 2200 50  0001 C CNN
F 3 "~" H 1400 2200 50  0001 C CNN
	1    1400 2200
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EB32091
P 1150 2500
F 0 "C?" H 1265 2546 50  0000 L CNN
F 1 "C" H 1265 2455 50  0000 L CNN
F 2 "" H 1188 2350 50  0001 C CNN
F 3 "~" H 1150 2500 50  0001 C CNN
	1    1150 2500
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5EB32AB0
P 1150 1900
F 0 "C?" H 1265 1946 50  0000 L CNN
F 1 "C" H 1265 1855 50  0000 L CNN
F 2 "" H 1188 1750 50  0001 C CNN
F 3 "~" H 1150 1900 50  0001 C CNN
	1    1150 1900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB3305A
P 900 2200
F 0 "#PWR?" H 900 1950 50  0001 C CNN
F 1 "GND" H 905 2027 50  0000 C CNN
F 2 "" H 900 2200 50  0001 C CNN
F 3 "" H 900 2200 50  0001 C CNN
	1    900  2200
	0    1    1    0   
$EndComp
Wire Wire Line
	3450 2400 3200 2400
Wire Wire Line
	3200 2400 3200 1900
Wire Wire Line
	3200 1900 1400 1900
Wire Wire Line
	1400 1900 1400 2050
Wire Wire Line
	3450 2500 1400 2500
Wire Wire Line
	1400 2500 1400 2350
Wire Wire Line
	1300 2500 1400 2500
Connection ~ 1400 2500
Wire Wire Line
	1000 2500 950  2500
Wire Wire Line
	950  2500 950  2200
Wire Wire Line
	950  2200 1200 2200
Wire Wire Line
	950  2200 950  1900
Wire Wire Line
	950  1900 1000 1900
Connection ~ 950  2200
Wire Wire Line
	900  2200 950  2200
Wire Wire Line
	1300 1900 1400 1900
Connection ~ 1400 1900
$Comp
L Device:R R?
U 1 1 5EB67394
P 4900 6700
F 0 "R?" V 4693 6700 50  0000 C CNN
F 1 "R" V 4784 6700 50  0000 C CNN
F 2 "" V 4830 6700 50  0001 C CNN
F 3 "~" H 4900 6700 50  0001 C CNN
	1    4900 6700
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 5EB65A11
P 4900 7100
F 0 "SW?" H 4900 7385 50  0000 C CNN
F 1 "SW_Push" H 4900 7294 50  0000 C CNN
F 2 "" H 4900 7300 50  0001 C CNN
F 3 "~" H 4900 7300 50  0001 C CNN
	1    4900 7100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB76F62
P 4900 7350
F 0 "#PWR?" H 4900 7100 50  0001 C CNN
F 1 "GND" H 4905 7177 50  0000 C CNN
F 2 "" H 4900 7350 50  0001 C CNN
F 3 "" H 4900 7350 50  0001 C CNN
	1    4900 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 7350 4900 7300
Wire Wire Line
	4900 6900 4900 6850
$Comp
L Device:R R?
U 1 1 5EB7DDD8
P 4900 6300
F 0 "R?" V 4693 6300 50  0000 C CNN
F 1 "R" V 4784 6300 50  0000 C CNN
F 2 "" V 4830 6300 50  0001 C CNN
F 3 "~" H 4900 6300 50  0001 C CNN
	1    4900 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 6450 4900 6500
Wire Wire Line
	4900 6500 4300 6500
Wire Wire Line
	3800 6500 3800 5950
Wire Wire Line
	3800 5950 3000 5950
Connection ~ 4900 6500
Wire Wire Line
	4900 6500 4900 6550
Connection ~ 3000 5950
Wire Wire Line
	3000 5950 3000 5400
$Comp
L Device:Jumper JP?
U 1 1 5EB957AA
P 6550 2150
F 0 "JP?" H 6550 2414 50  0000 C CNN
F 1 "Jumper" H 6550 2323 50  0000 C CNN
F 2 "" H 6550 2150 50  0001 C CNN
F 3 "~" H 6550 2150 50  0001 C CNN
	1    6550 2150
	1    0    0    -1  
$EndComp
Text GLabel 6150 2150 0    50   Input ~ 0
SAML21_VDDIN
Wire Wire Line
	6150 2150 6250 2150
Text Notes 6850 1300 0    50   ~ 0
VCC_TARGET is power to peripherals, hardware modules that are NOT the MCU.
Text Notes 7100 3000 0    50   ~ 0
SAML21_VDDIN is VCC_MCU_P3V3 e.g. current going solely to the chip.\n
Text Notes 7150 3450 0    50   ~ 0
Would like the power for peripherals to be selectable and separate from the core.
Text GLabel 6150 2550 0    50   Input ~ 0
PERIPH_VDDIN
Wire Wire Line
	7500 2150 7000 2150
Wire Wire Line
	7000 2150 7000 2550
Connection ~ 7000 2150
Wire Wire Line
	7000 2150 6850 2150
Text Notes 7150 2000 0    50   ~ 0
sourced from regulator to MCU
$Comp
L Device:C C?
U 1 1 5EBCF2D5
P 4300 6700
F 0 "C?" H 4415 6746 50  0000 L CNN
F 1 "C" H 4415 6655 50  0000 L CNN
F 2 "" H 4338 6550 50  0001 C CNN
F 3 "~" H 4300 6700 50  0001 C CNN
	1    4300 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 6850 4300 6900
Wire Wire Line
	4300 6550 4300 6500
Connection ~ 4300 6500
Wire Wire Line
	4300 6500 3800 6500
$Comp
L power:GND #PWR?
U 1 1 5EBD6A2A
P 4300 6900
F 0 "#PWR?" H 4300 6650 50  0001 C CNN
F 1 "GND" H 4305 6727 50  0000 C CNN
F 2 "" H 4300 6900 50  0001 C CNN
F 3 "" H 4300 6900 50  0001 C CNN
	1    4300 6900
	1    0    0    -1  
$EndComp
Text GLabel 5100 6000 2    50   Input ~ 0
PERIPH_VDDIN
Wire Wire Line
	5100 6000 4900 6000
Wire Wire Line
	4900 6000 4900 6150
$Comp
L Device:Q_NMOS_DGS Q?
U 1 1 5EC10B92
P 6500 3800
F 0 "Q?" H 6706 3846 50  0000 L CNN
F 1 "Q_NMOS_DGS" H 6706 3755 50  0000 L CNN
F 2 "" H 6700 3900 50  0001 C CNN
F 3 "~" H 6500 3800 50  0001 C CNN
	1    6500 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5EC12032
P 6600 3050
F 0 "R?" H 6670 3096 50  0000 L CNN
F 1 "R" H 6670 3005 50  0000 L CNN
F 2 "" V 6530 3050 50  0001 C CNN
F 3 "~" H 6600 3050 50  0001 C CNN
	1    6600 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5EC12B63
P 6600 3400
F 0 "D?" V 6639 3283 50  0000 R CNN
F 1 "LED" V 6548 3283 50  0000 R CNN
F 2 "" H 6600 3400 50  0001 C CNN
F 3 "~" H 6600 3400 50  0001 C CNN
	1    6600 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6600 3200 6600 3250
Wire Wire Line
	6600 3550 6600 3600
$Comp
L power:GND #PWR?
U 1 1 5EC2C28D
P 6600 4050
F 0 "#PWR?" H 6600 3800 50  0001 C CNN
F 1 "GND" H 6605 3877 50  0000 C CNN
F 2 "" H 6600 4050 50  0001 C CNN
F 3 "" H 6600 4050 50  0001 C CNN
	1    6600 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4050 6600 4000
Wire Wire Line
	6600 2750 6600 2900
$Comp
L Device:Jumper JP?
U 1 1 5EC5F61E
P 6550 2550
F 0 "JP?" H 6550 2814 50  0000 C CNN
F 1 "Jumper" H 6550 2723 50  0000 C CNN
F 2 "" H 6550 2550 50  0001 C CNN
F 3 "~" H 6550 2550 50  0001 C CNN
	1    6550 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 2550 6250 2550
Wire Wire Line
	7000 2550 6850 2550
Wire Wire Line
	7550 2750 7950 2750
Wire Wire Line
	6950 2750 6600 2750
$Comp
L Device:Jumper JP?
U 1 1 5EC3CE65
P 7250 2750
F 0 "JP?" H 7250 3014 50  0000 C CNN
F 1 "Jumper" H 7250 2923 50  0000 C CNN
F 2 "" H 7250 2750 50  0001 C CNN
F 3 "~" H 7250 2750 50  0001 C CNN
	1    7250 2750
	1    0    0    -1  
$EndComp
Text GLabel 7950 2750 2    50   Input ~ 0
PERIPH_VDDIN
$EndSCHEMATC
