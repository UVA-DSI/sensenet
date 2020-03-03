EESchema Schematic File Version 4
EELAYER 26 0
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
L Connector_Generic:Conn_02x05_Odd_Even J1
U 1 1 5D9AB594
P 5085 4275
F 0 "J1" H 5135 4692 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 5135 4601 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05_Pitch1.27mm" H 5085 4275 50  0001 C CNN
F 3 "~" H 5085 4275 50  0001 C CNN
	1    5085 4275
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J2
U 1 1 5D9B6DB9
P 5165 5270
F 0 "J2" V 5038 5550 50  0000 L CNN
F 1 "Conn_01x06" V 5129 5550 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 5165 5270 50  0001 C CNN
F 3 "~" H 5165 5270 50  0001 C CNN
	1    5165 5270
	0    1    1    0   
$EndComp
Wire Wire Line
	5385 4075 5710 4075
Wire Wire Line
	5710 4075 5710 5070
Wire Wire Line
	5710 5070 5365 5070
Wire Wire Line
	4565 3770 5710 3770
Wire Wire Line
	5710 3770 5710 4075
Connection ~ 5710 4075
Wire Wire Line
	4885 4075 4565 4075
Wire Wire Line
	4565 3770 4565 4075
Wire Wire Line
	5585 4950 5585 4945
Wire Wire Line
	5585 4175 5385 4175
Wire Wire Line
	5265 5070 5265 4950
Wire Wire Line
	5265 4950 5585 4950
Wire Wire Line
	4885 4175 4415 4175
Wire Wire Line
	4415 4175 4415 3610
Wire Wire Line
	4415 3610 5845 3610
Wire Wire Line
	5845 3610 5845 4945
Wire Wire Line
	5845 4945 5585 4945
Connection ~ 5585 4945
Wire Wire Line
	5585 4945 5585 4175
Wire Wire Line
	5165 4670 4580 4670
Wire Wire Line
	4580 4670 4580 4275
NoConn ~ 5385 4275
NoConn ~ 5385 4375
Wire Wire Line
	5065 5070 5065 4880
Wire Wire Line
	5065 4880 4415 4880
Wire Wire Line
	4415 4880 4415 4375
Wire Wire Line
	4415 4375 4885 4375
Wire Wire Line
	4965 5070 4965 4600
Wire Wire Line
	4965 4600 4885 4600
Wire Wire Line
	4885 4600 4885 4475
Wire Wire Line
	5385 4475 5385 4775
Wire Wire Line
	5385 4775 4865 4775
Wire Wire Line
	4865 4775 4865 5070
Wire Wire Line
	5165 4670 5165 5070
Wire Wire Line
	4580 4275 4885 4275
$EndSCHEMATC
