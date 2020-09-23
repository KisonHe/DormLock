EESchema Schematic File Version 4
EELAYER 30 0
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
L Connector_Generic:Conn_02x03_Odd_Even J1
U 1 1 5F571E9F
P 1100 850
F 0 "J1" H 1150 1167 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 1150 1076 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x03_P1.27mm_Vertical" H 1100 850 50  0001 C CNN
F 3 "~" H 1100 850 50  0001 C CNN
	1    1100 850 
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR022
U 1 1 5F57AC5E
P 3000 1600
F 0 "#PWR022" H 3000 1450 50  0001 C CNN
F 1 "+3V3" V 3015 1728 50  0000 L CNN
F 2 "" H 3000 1600 50  0001 C CNN
F 3 "" H 3000 1600 50  0001 C CNN
	1    3000 1600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR036
U 1 1 5F57BAF7
P 2900 4600
F 0 "#PWR036" H 2900 4350 50  0001 C CNN
F 1 "GND" V 2905 4472 50  0000 R CNN
F 2 "" H 2900 4600 50  0001 C CNN
F 3 "" H 2900 4600 50  0001 C CNN
	1    2900 4600
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C1
U 1 1 5F57D295
P 3950 950
F 0 "C1" H 4065 996 50  0000 L CNN
F 1 "100nf" H 4065 905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3988 800 50  0001 C CNN
F 3 "~" H 3950 950 50  0001 C CNN
	1    3950 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5F57D662
P 3950 1100
F 0 "#PWR013" H 3950 850 50  0001 C CNN
F 1 "GND" H 3955 927 50  0000 C CNN
F 2 "" H 3950 1100 50  0001 C CNN
F 3 "" H 3950 1100 50  0001 C CNN
	1    3950 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR04
U 1 1 5F57DA58
P 3950 800
F 0 "#PWR04" H 3950 650 50  0001 C CNN
F 1 "+3V3" H 3965 973 50  0000 C CNN
F 2 "" H 3950 800 50  0001 C CNN
F 3 "" H 3950 800 50  0001 C CNN
	1    3950 800 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5F583B3E
P 4400 950
F 0 "C2" H 4515 996 50  0000 L CNN
F 1 "100nf" H 4515 905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4438 800 50  0001 C CNN
F 3 "~" H 4400 950 50  0001 C CNN
	1    4400 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5F583B44
P 4400 1100
F 0 "#PWR014" H 4400 850 50  0001 C CNN
F 1 "GND" H 4405 927 50  0000 C CNN
F 2 "" H 4400 1100 50  0001 C CNN
F 3 "" H 4400 1100 50  0001 C CNN
	1    4400 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR05
U 1 1 5F583B4A
P 4400 800
F 0 "#PWR05" H 4400 650 50  0001 C CNN
F 1 "+3V3" H 4415 973 50  0000 C CNN
F 2 "" H 4400 800 50  0001 C CNN
F 3 "" H 4400 800 50  0001 C CNN
	1    4400 800 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5F584193
P 4850 950
F 0 "C3" H 4965 996 50  0000 L CNN
F 1 "100nf" H 4965 905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4888 800 50  0001 C CNN
F 3 "~" H 4850 950 50  0001 C CNN
	1    4850 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5F584199
P 4850 1100
F 0 "#PWR015" H 4850 850 50  0001 C CNN
F 1 "GND" H 4855 927 50  0000 C CNN
F 2 "" H 4850 1100 50  0001 C CNN
F 3 "" H 4850 1100 50  0001 C CNN
	1    4850 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR06
U 1 1 5F58419F
P 4850 800
F 0 "#PWR06" H 4850 650 50  0001 C CNN
F 1 "+3V3" H 4865 973 50  0000 C CNN
F 2 "" H 4850 800 50  0001 C CNN
F 3 "" H 4850 800 50  0001 C CNN
	1    4850 800 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5F584B2C
P 5300 950
F 0 "C4" H 5415 996 50  0000 L CNN
F 1 "100nf" H 5415 905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5338 800 50  0001 C CNN
F 3 "~" H 5300 950 50  0001 C CNN
	1    5300 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5F584B32
P 5300 1100
F 0 "#PWR016" H 5300 850 50  0001 C CNN
F 1 "GND" H 5305 927 50  0000 C CNN
F 2 "" H 5300 1100 50  0001 C CNN
F 3 "" H 5300 1100 50  0001 C CNN
	1    5300 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR07
U 1 1 5F584B38
P 5300 800
F 0 "#PWR07" H 5300 650 50  0001 C CNN
F 1 "+3V3" H 5315 973 50  0000 C CNN
F 2 "" H 5300 800 50  0001 C CNN
F 3 "" H 5300 800 50  0001 C CNN
	1    5300 800 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5F5854CD
P 5750 950
F 0 "C5" H 5865 996 50  0000 L CNN
F 1 "100nf" H 5865 905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5788 800 50  0001 C CNN
F 3 "~" H 5750 950 50  0001 C CNN
	1    5750 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5F5854D3
P 5750 1100
F 0 "#PWR017" H 5750 850 50  0001 C CNN
F 1 "GND" H 5755 927 50  0000 C CNN
F 2 "" H 5750 1100 50  0001 C CNN
F 3 "" H 5750 1100 50  0001 C CNN
	1    5750 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR08
U 1 1 5F5854D9
P 5750 800
F 0 "#PWR08" H 5750 650 50  0001 C CNN
F 1 "+3V3" H 5765 973 50  0000 C CNN
F 2 "" H 5750 800 50  0001 C CNN
F 3 "" H 5750 800 50  0001 C CNN
	1    5750 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5F58C087
P 1400 750
F 0 "#PWR03" H 1400 500 50  0001 C CNN
F 1 "GND" V 1405 622 50  0000 R CNN
F 2 "" H 1400 750 50  0001 C CNN
F 3 "" H 1400 750 50  0001 C CNN
	1    1400 750 
	0    -1   -1   0   
$EndComp
Text Label 900  850  2    50   ~ 0
STM_NRST
$Comp
L power:+3V3 #PWR02
U 1 1 5F539E6A
P 900 950
F 0 "#PWR02" H 900 800 50  0001 C CNN
F 1 "+3V3" V 915 1078 50  0000 L CNN
F 2 "" H 900 950 50  0001 C CNN
F 3 "" H 900 950 50  0001 C CNN
	1    900  950 
	0    -1   -1   0   
$EndComp
Text Label 1400 850  0    50   ~ 0
STM_SWCLK
Text Label 1400 950  0    50   ~ 0
STM_SWDIO
Text Label 3400 4300 0    50   ~ 0
STM_SWCLK
Text Label 3400 4200 0    50   ~ 0
STM_SWDIO
Connection ~ 2900 4600
Connection ~ 2800 4600
Wire Wire Line
	2800 4600 2900 4600
Connection ~ 2700 4600
Wire Wire Line
	2700 4600 2800 4600
Wire Wire Line
	2600 4600 2700 4600
Connection ~ 3000 1600
Connection ~ 2900 1600
Connection ~ 2800 1600
Wire Wire Line
	2900 1600 3000 1600
Wire Wire Line
	2800 1600 2900 1600
Connection ~ 2700 1600
Wire Wire Line
	2700 1600 2800 1600
Wire Wire Line
	2600 1600 2700 1600
$Comp
L power:+3V3 #PWR019
U 1 1 5F55C107
P 1500 1450
F 0 "#PWR019" H 1500 1300 50  0001 C CNN
F 1 "+3V3" H 1515 1623 50  0000 C CNN
F 2 "" H 1500 1450 50  0001 C CNN
F 3 "" H 1500 1450 50  0001 C CNN
	1    1500 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1750 1500 1800
Connection ~ 1500 1800
$Comp
L power:GND #PWR021
U 1 1 5F53E6C9
P 1300 1500
F 0 "#PWR021" H 1300 1250 50  0001 C CNN
F 1 "GND" H 1305 1327 50  0000 C CNN
F 2 "" H 1300 1500 50  0001 C CNN
F 3 "" H 1300 1500 50  0001 C CNN
	1    1300 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	1300 1800 1500 1800
Connection ~ 1300 1800
$Comp
L Device:C C8
U 1 1 5F53CCCF
P 1300 1650
F 0 "C8" H 1000 1750 50  0000 L CNN
F 1 "100nf" H 950 1650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1338 1500 50  0001 C CNN
F 3 "~" H 1300 1650 50  0001 C CNN
	1    1300 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 1800 1300 1800
Text Label 1200 1800 2    50   ~ 0
STM_NRST
$Comp
L power:GND #PWR018
U 1 1 5F56ACDA
P 1850 1200
F 0 "#PWR018" H 1850 950 50  0001 C CNN
F 1 "GND" H 1855 1027 50  0000 C CNN
F 2 "" H 1850 1200 50  0001 C CNN
F 3 "" H 1850 1200 50  0001 C CNN
	1    1850 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	1500 1800 1850 1800
$Comp
L Switch:SW_Push SW1
U 1 1 5F5778B8
P 1850 1400
F 0 "SW1" V 1804 1548 50  0000 L CNN
F 1 "SW_Push" V 1895 1548 50  0000 L CNN
F 2 "Button_Switch_SMD:SW_SPST_REED_CT05-XXXX-J1" H 1850 1600 50  0001 C CNN
F 3 "~" H 1850 1600 50  0001 C CNN
	1    1850 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 1600 1850 1800
Connection ~ 1850 1800
Wire Wire Line
	1850 1800 2100 1800
$Comp
L Device:R R1
U 1 1 5F57BE8F
P 1500 1600
F 0 "R1" H 1570 1646 50  0000 L CNN
F 1 "10K" H 1570 1555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1430 1600 50  0001 C CNN
F 3 "~" H 1500 1600 50  0001 C CNN
	1    1500 1600
	1    0    0    -1  
$EndComp
Text Label 2700 750  2    50   ~ 0
STM_SWDIO
Text Label 2700 950  2    50   ~ 0
STM_SWCLK
Text Label 2700 1050 2    50   ~ 0
STM_NRST
$Comp
L power:GND #PWR09
U 1 1 5F585777
P 2700 850
F 0 "#PWR09" H 2700 600 50  0001 C CNN
F 1 "GND" V 2705 722 50  0000 R CNN
F 2 "" H 2700 850 50  0001 C CNN
F 3 "" H 2700 850 50  0001 C CNN
	1    2700 850 
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR01
U 1 1 5F586C06
P 2700 650
F 0 "#PWR01" H 2700 500 50  0001 C CNN
F 1 "+3V3" V 2715 778 50  0000 L CNN
F 2 "" H 2700 650 50  0001 C CNN
F 3 "" H 2700 650 50  0001 C CNN
	1    2700 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J2
U 1 1 5F57E3E5
P 2900 850
F 0 "J2" H 2980 892 50  0000 L CNN
F 1 "Conn_01x05" H 2980 801 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 2900 850 50  0001 C CNN
F 3 "~" H 2900 850 50  0001 C CNN
	1    2900 850 
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x15 J6
U 1 1 5F54504C
P 4950 4200
F 0 "J6" H 4900 3300 50  0000 L CNN
F 1 "Conn_01x15" H 4700 3400 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 4950 4200 50  0001 C CNN
F 3 "~" H 4950 4200 50  0001 C CNN
	1    4950 4200
	1    0    0    1   
$EndComp
Text Label 2100 2500 2    50   ~ 0
STMSYS_WAKEUP2
$Comp
L power:+3V3 #PWR038
U 1 1 5F5507B2
P 4750 4900
F 0 "#PWR038" H 4750 4750 50  0001 C CNN
F 1 "+3V3" V 4765 5028 50  0000 L CNN
F 2 "" H 4750 4900 50  0001 C CNN
F 3 "" H 4750 4900 50  0001 C CNN
	1    4750 4900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR037
U 1 1 5F552837
P 4750 4800
F 0 "#PWR037" H 4750 4550 50  0001 C CNN
F 1 "GND" V 4755 4672 50  0000 R CNN
F 2 "" H 4750 4800 50  0001 C CNN
F 3 "" H 4750 4800 50  0001 C CNN
	1    4750 4800
	0    1    1    0   
$EndComp
Text Label 3400 3800 0    50   ~ 0
UART_32TX
Text Label 3400 3900 0    50   ~ 0
UART_32RX
Text Label 4750 4700 2    50   ~ 0
UART_32TX
Text Label 4750 4600 2    50   ~ 0
UART_32RX
Text Label 4750 3600 2    50   ~ 0
STMSYS_WAKEUP2
$Comp
L Mechanical:MountingHole H4
U 1 1 5F55953B
P 10900 5200
F 0 "H4" H 11000 5246 50  0000 L CNN
F 1 "MountingHole" H 11000 5155 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965" H 10900 5200 50  0001 C CNN
F 3 "~" H 10900 5200 50  0001 C CNN
	1    10900 5200
	0    1    -1   0   
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5F55A050
P 10900 4350
F 0 "H3" H 11000 4396 50  0000 L CNN
F 1 "MountingHole" H 11000 4305 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965" H 10900 4350 50  0001 C CNN
F 3 "~" H 10900 4350 50  0001 C CNN
	1    10900 4350
	0    1    -1   0   
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5F55A4CE
P 10900 3450
F 0 "H2" H 11000 3496 50  0000 L CNN
F 1 "MountingHole" H 11000 3405 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965" H 10900 3450 50  0001 C CNN
F 3 "~" H 10900 3450 50  0001 C CNN
	1    10900 3450
	0    1    -1   0   
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5F55A7DD
P 10900 2650
F 0 "H1" H 11000 2696 50  0000 L CNN
F 1 "MountingHole" H 11000 2605 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965" H 10900 2650 50  0001 C CNN
F 3 "~" H 10900 2650 50  0001 C CNN
	1    10900 2650
	0    1    -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 5F57F9F7
P 5350 2850
F 0 "J5" H 5430 2842 50  0000 L CNN
F 1 "Conn_01x02" H 5430 2751 50  0000 L CNN
F 2 "Connector_AMASS:AMASS_XT60-M_1x02_P7.20mm_Vertical" H 5350 2850 50  0001 C CNN
F 3 "~" H 5350 2850 50  0001 C CNN
	1    5350 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR035
U 1 1 5F59785A
P 5150 2850
F 0 "#PWR035" H 5150 2600 50  0001 C CNN
F 1 "GND" H 5155 2677 50  0000 C CNN
F 2 "" H 5150 2850 50  0001 C CNN
F 3 "" H 5150 2850 50  0001 C CNN
	1    5150 2850
	0    1    1    0   
$EndComp
Text Label 2100 3700 2    50   ~ 0
STEER_PWM
Text Label 2100 4100 2    50   ~ 0
STEER_EN
$Comp
L power:+BATT #PWR034
U 1 1 5F5B4924
P 5150 2950
F 0 "#PWR034" H 5150 2800 50  0001 C CNN
F 1 "+BATT" V 5165 3077 50  0000 L CNN
F 2 "" H 5150 2950 50  0001 C CNN
F 3 "" H 5150 2950 50  0001 C CNN
	1    5150 2950
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x15 J7
U 1 1 5F54582C
P 5150 4200
F 0 "J7" H 5150 3300 50  0000 C CNN
F 1 "Conn_01x15" H 5150 3400 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 5150 4200 50  0001 C CNN
F 3 "~" H 5150 4200 50  0001 C CNN
	1    5150 4200
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5F5A2A8A
P 4200 2200
F 0 "#PWR026" H 4200 1950 50  0001 C CNN
F 1 "GND" H 4205 2027 50  0000 C CNN
F 2 "" H 4200 2200 50  0001 C CNN
F 3 "" H 4200 2200 50  0001 C CNN
	1    4200 2200
	0    1    1    0   
$EndComp
Text Label 4200 2000 2    50   ~ 0
STEER_PWM
$Comp
L Connector_Generic:Conn_01x03 J4
U 1 1 5F594A08
P 4400 2100
F 0 "J4" H 4480 2142 50  0000 L CNN
F 1 "Conn_01x03" H 4480 2051 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4400 2100 50  0001 C CNN
F 3 "~" H 4400 2100 50  0001 C CNN
	1    4400 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C9
U 1 1 5F590512
P 9350 3250
F 0 "C9" H 9468 3296 50  0000 L CNN
F 1 "470uf" H 9468 3205 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 9388 3100 50  0001 C CNN
F 3 "~" H 9350 3250 50  0001 C CNN
	1    9350 3250
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AP1117-15 U1
U 1 1 5F610F60
P 9000 900
F 0 "U1" H 9000 1142 50  0000 C CNN
F 1 "SPX1117M3-L-3-3/TR" H 9000 1051 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 9000 1100 50  0001 C CNN
F 3 "http://www.diodes.com/datasheets/AP1117.pdf" H 9100 650 50  0001 C CNN
	1    9000 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR033
U 1 1 5F5FE97C
P 8600 2750
F 0 "#PWR033" H 8600 2600 50  0001 C CNN
F 1 "+5V" H 8615 2923 50  0000 C CNN
F 2 "" H 8600 2750 50  0001 C CNN
F 3 "" H 8600 2750 50  0001 C CNN
	1    8600 2750
	-1   0    0    1   
$EndComp
$Comp
L power:+BATT #PWR031
U 1 1 5F5C1171
P 6250 2650
F 0 "#PWR031" H 6250 2500 50  0001 C CNN
F 1 "+BATT" V 6265 2777 50  0000 L CNN
F 2 "" H 6250 2650 50  0001 C CNN
F 3 "" H 6250 2650 50  0001 C CNN
	1    6250 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7050 2250 6650 2250
Wire Wire Line
	6650 2250 6650 2550
Connection ~ 6650 2550
$Comp
L power:GND #PWR028
U 1 1 5F57E308
P 9600 2300
F 0 "#PWR028" H 9600 2050 50  0001 C CNN
F 1 "GND" H 9605 2127 50  0000 C CNN
F 2 "" H 9600 2300 50  0001 C CNN
F 3 "" H 9600 2300 50  0001 C CNN
	1    9600 2300
	-1   0    0    1   
$EndComp
Wire Wire Line
	9600 2450 9850 2450
Connection ~ 9600 2450
Wire Wire Line
	9600 2450 9600 2300
Wire Wire Line
	9400 2450 9600 2450
Wire Wire Line
	9400 2750 9850 2750
$Comp
L Device:C C13
U 1 1 5F57B19B
P 9850 2600
F 0 "C13" H 9965 2646 50  0000 L CNN
F 1 "22uf" H 9965 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9888 2450 50  0001 C CNN
F 3 "~" H 9850 2600 50  0001 C CNN
	1    9850 2600
	1    0    0    -1  
$EndComp
Connection ~ 9400 2750
$Comp
L Device:C C12
U 1 1 5F5742ED
P 9400 2600
F 0 "C12" H 9515 2646 50  0000 L CNN
F 1 "22uf" H 9515 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9438 2450 50  0001 C CNN
F 3 "~" H 9400 2600 50  0001 C CNN
	1    9400 2600
	1    0    0    -1  
$EndComp
Connection ~ 9000 2750
Wire Wire Line
	9000 2750 9400 2750
Wire Wire Line
	8600 2300 8600 1800
Connection ~ 8600 2300
Wire Wire Line
	9000 2300 8600 2300
Wire Wire Line
	9000 2450 9000 2300
Connection ~ 8600 2750
Wire Wire Line
	8600 2750 9000 2750
$Comp
L Device:C C11
U 1 1 5F56F9EE
P 9000 2600
F 0 "C11" H 9115 2646 50  0000 L CNN
F 1 "47pf" H 9115 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9038 2450 50  0001 C CNN
F 3 "~" H 9000 2600 50  0001 C CNN
	1    9000 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 5F56D9A4
P 6350 2550
F 0 "#PWR029" H 6350 2300 50  0001 C CNN
F 1 "GND" V 6355 2422 50  0000 R CNN
F 2 "" H 6350 2550 50  0001 C CNN
F 3 "" H 6350 2550 50  0001 C CNN
	1    6350 2550
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5F56BDDE
P 6500 2550
F 0 "R3" V 6293 2550 50  0000 C CNN
F 1 "13.7k" V 6384 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6430 2550 50  0001 C CNN
F 3 "~" H 6500 2550 50  0001 C CNN
	1    6500 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 1800 7050 2250
Wire Wire Line
	8600 1800 7050 1800
Wire Wire Line
	8600 2450 8600 2300
$Comp
L Device:R R4
U 1 1 5F569414
P 8600 2600
F 0 "R4" H 8670 2646 50  0000 L CNN
F 1 "100k" H 8670 2555 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8530 2600 50  0001 C CNN
F 3 "~" H 8600 2600 50  0001 C CNN
	1    8600 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 5F567F97
P 8450 2750
F 0 "L1" V 8269 2750 50  0000 C CNN
F 1 "4.7uh" V 8360 2750 50  0000 C CNN
F 2 "Inductor_SMD:L_6.3x6.3_H3" H 8450 2750 50  0001 C CNN
F 3 "~" H 8450 2750 50  0001 C CNN
	1    8450 2750
	0    1    1    0   
$EndComp
Connection ~ 7800 2650
Wire Wire Line
	6650 2550 6900 2550
Wire Wire Line
	8050 2750 8300 2750
Wire Wire Line
	8050 2650 8050 2750
$Comp
L power:GND #PWR032
U 1 1 5F56432B
P 6900 2950
F 0 "#PWR032" H 6900 2700 50  0001 C CNN
F 1 "GND" V 6905 2822 50  0000 R CNN
F 2 "" H 6900 2950 50  0001 C CNN
F 3 "" H 6900 2950 50  0001 C CNN
	1    6900 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 2550 8000 2550
Connection ~ 7700 2550
Wire Wire Line
	7500 2950 7500 2750
Wire Wire Line
	7800 2950 7500 2950
Wire Wire Line
	7500 2650 7800 2650
$Comp
L Device:C C14
U 1 1 5F55A430
P 7800 2800
F 0 "C14" H 7915 2846 50  0000 L CNN
F 1 "100nf" H 7915 2755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7838 2650 50  0001 C CNN
F 3 "~" H 7800 2800 50  0001 C CNN
	1    7800 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR027
U 1 1 5F559635
P 7700 2250
F 0 "#PWR027" H 7700 2000 50  0001 C CNN
F 1 "GND" H 7705 2077 50  0000 C CNN
F 2 "" H 7700 2250 50  0001 C CNN
F 3 "" H 7700 2250 50  0001 C CNN
	1    7700 2250
	-1   0    0    1   
$EndComp
$Comp
L Device:C C10
U 1 1 5F558FCD
P 7700 2400
F 0 "C10" H 7815 2446 50  0000 L CNN
F 1 "10uf" H 7815 2355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7738 2250 50  0001 C CNN
F 3 "~" H 7700 2400 50  0001 C CNN
	1    7700 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2550 7700 2550
$Comp
L power:+BATT #PWR030
U 1 1 5F5529C4
P 8000 2550
F 0 "#PWR030" H 8000 2400 50  0001 C CNN
F 1 "+BATT" H 8015 2723 50  0000 C CNN
F 2 "" H 8000 2550 50  0001 C CNN
F 3 "" H 8000 2550 50  0001 C CNN
	1    8000 2550
	0    1    1    0   
$EndComp
$Comp
L KisonDCDC:SY8105 U2
U 1 1 5F5509A8
P 7200 2650
F 0 "U2" H 7200 3015 50  0000 C CNN
F 1 "SY8105" H 7200 2924 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-6" H 7900 3350 50  0001 C CNN
F 3 "" H 7900 3350 50  0001 C CNN
	1    7200 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 1200 9000 1500
Connection ~ 9450 900 
Wire Wire Line
	9450 1200 9450 900 
Connection ~ 8600 900 
Wire Wire Line
	8600 900  8600 1200
Wire Wire Line
	8600 900  8700 900 
Wire Wire Line
	9450 900  9300 900 
Connection ~ 9000 1500
Wire Wire Line
	9000 1500 9450 1500
Wire Wire Line
	9000 1500 9000 1600
Wire Wire Line
	8600 1500 9000 1500
$Comp
L Device:C C6
U 1 1 5F5A0788
P 8600 1350
F 0 "C6" H 8715 1396 50  0000 L CNN
F 1 "1uf" H 8715 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8638 1200 50  0001 C CNN
F 3 "~" H 8600 1350 50  0001 C CNN
	1    8600 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5F59CBDE
P 9450 1350
F 0 "C7" H 9565 1396 50  0000 L CNN
F 1 "2.2uf" H 9565 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9488 1200 50  0001 C CNN
F 3 "~" H 9450 1350 50  0001 C CNN
	1    9450 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR012
U 1 1 5F59C2FF
P 9450 900
F 0 "#PWR012" H 9450 750 50  0001 C CNN
F 1 "+3V3" H 9465 1073 50  0000 C CNN
F 2 "" H 9450 900 50  0001 C CNN
F 3 "" H 9450 900 50  0001 C CNN
	1    9450 900 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR023
U 1 1 5F59BE98
P 9000 1600
F 0 "#PWR023" H 9000 1350 50  0001 C CNN
F 1 "GND" H 9005 1427 50  0000 C CNN
F 2 "" H 9000 1600 50  0001 C CNN
F 3 "" H 9000 1600 50  0001 C CNN
	1    9000 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 5F59B646
P 8600 900
F 0 "#PWR011" H 8600 750 50  0001 C CNN
F 1 "+5V" V 8615 1028 50  0000 L CNN
F 2 "" H 8600 900 50  0001 C CNN
F 3 "" H 8600 900 50  0001 C CNN
	1    8600 900 
	0    -1   -1   0   
$EndComp
$Comp
L MCU_ST_STM32F0:STM32F030CCTx U3
U 1 1 5F535BA1
P 2800 3100
F 0 "U3" H 2750 1511 50  0000 C CNN
F 1 "STM32F030CCTx" H 2750 1420 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 2200 1700 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00088500.pdf" H 2800 3100 50  0001 C CNN
	1    2800 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5F5A3250
P 6400 2650
F 0 "R5" V 6193 2650 50  0000 C CNN
F 1 "0" V 6284 2650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6330 2650 50  0001 C CNN
F 3 "~" H 6400 2650 50  0001 C CNN
	1    6400 2650
	0    1    -1   0   
$EndComp
$Comp
L Device:R R6
U 1 1 5F5B1E00
P 6550 2800
F 0 "R6" V 6343 2800 50  0000 C CNN
F 1 "10k" V 6434 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6480 2800 50  0001 C CNN
F 3 "~" H 6550 2800 50  0001 C CNN
	1    6550 2800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6550 2650 6900 2650
Connection ~ 6550 2650
Wire Wire Line
	6550 2950 6900 2950
Wire Wire Line
	6900 2950 6900 2750
Connection ~ 6900 2950
$Comp
L power:GND #PWR0102
U 1 1 5F57DBCC
P 9350 3400
F 0 "#PWR0102" H 9350 3150 50  0001 C CNN
F 1 "GND" V 9355 3272 50  0000 R CNN
F 2 "" H 9350 3400 50  0001 C CNN
F 3 "" H 9350 3400 50  0001 C CNN
	1    9350 3400
	1    0    0    -1  
$EndComp
$Comp
L power:Vdrive #PWR0103
U 1 1 5F58BB11
P 5800 1750
F 0 "#PWR0103" H 5600 1600 50  0001 C CNN
F 1 "Vdrive" H 5815 1923 50  0000 C CNN
F 2 "" H 5800 1750 50  0001 C CNN
F 3 "" H 5800 1750 50  0001 C CNN
	1    5800 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F58D8FC
P 5950 1750
F 0 "R2" V 5743 1750 50  0000 C CNN
F 1 "0" V 5834 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5880 1750 50  0001 C CNN
F 3 "~" H 5950 1750 50  0001 C CNN
	1    5950 1750
	0    1    -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 5F58E9BC
P 5950 2050
F 0 "R7" V 5743 2050 50  0000 C CNN
F 1 "0" V 5834 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5880 2050 50  0001 C CNN
F 3 "~" H 5950 2050 50  0001 C CNN
	1    5950 2050
	0    1    -1   0   
$EndComp
Wire Wire Line
	5800 1750 5800 2050
Connection ~ 5800 1750
$Comp
L power:+BATT #PWR0104
U 1 1 5F59083B
P 6100 2050
F 0 "#PWR0104" H 6100 1900 50  0001 C CNN
F 1 "+BATT" V 6115 2177 50  0000 L CNN
F 2 "" H 6100 2050 50  0001 C CNN
F 3 "" H 6100 2050 50  0001 C CNN
	1    6100 2050
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 5F591B32
P 6100 1750
F 0 "#PWR0105" H 6100 1600 50  0001 C CNN
F 1 "+5V" H 6115 1923 50  0000 C CNN
F 2 "" H 6100 1750 50  0001 C CNN
F 3 "" H 6100 1750 50  0001 C CNN
	1    6100 1750
	0    1    1    0   
$EndComp
Text Label 3400 3600 0    50   ~ 0
SDA
Text Label 3400 3400 0    50   ~ 0
SCL
Text Label 2100 2900 2    50   ~ 0
DC
Text Label 3400 3300 0    50   ~ 0
CS
Wire Wire Line
	7800 2650 8050 2650
$Comp
L power:GND #PWR0110
U 1 1 5F67D43F
P 8150 6000
F 0 "#PWR0110" H 8150 5750 50  0001 C CNN
F 1 "GND" H 8155 5827 50  0000 C CNN
F 2 "" H 8150 6000 50  0001 C CNN
F 3 "" H 8150 6000 50  0001 C CNN
	1    8150 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 6000 8150 6000
$Comp
L power:+5V #PWR0111
U 1 1 5F68C14E
P 8750 3400
F 0 "#PWR0111" H 8750 3250 50  0001 C CNN
F 1 "+5V" H 8765 3573 50  0000 C CNN
F 2 "" H 8750 3400 50  0001 C CNN
F 3 "" H 8750 3400 50  0001 C CNN
	1    8750 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5F691EB5
P 1450 2000
F 0 "#PWR0112" H 1450 1750 50  0001 C CNN
F 1 "GND" H 1455 1827 50  0000 C CNN
F 2 "" H 1450 2000 50  0001 C CNN
F 3 "" H 1450 2000 50  0001 C CNN
	1    1450 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5F692D3C
P 1600 2000
F 0 "R8" V 1700 2000 50  0000 C CNN
F 1 "100k" V 1484 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1530 2000 50  0001 C CNN
F 3 "~" H 1600 2000 50  0001 C CNN
	1    1600 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 2000 2100 2000
Text Label 1000 5600 2    50   ~ 0
STEER_EN
$Comp
L Device:R R9
U 1 1 5F598FE9
P 1150 5600
F 0 "R9" V 943 5600 50  0000 C CNN
F 1 "2.2k" V 1034 5600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1080 5600 50  0001 C CNN
F 3 "~" H 1150 5600 50  0001 C CNN
	1    1150 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	1900 5250 1900 5400
Wire Wire Line
	1900 5400 2400 5400
Connection ~ 1900 5400
$Comp
L power:Vdrive #PWR0101
U 1 1 5F5B2138
P 1900 4950
F 0 "#PWR0101" H 1700 4800 50  0001 C CNN
F 1 "Vdrive" H 1915 5123 50  0000 C CNN
F 2 "" H 1900 4950 50  0001 C CNN
F 3 "" H 1900 4950 50  0001 C CNN
	1    1900 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4950 2700 4950
Connection ~ 1900 4950
Text Label 4200 2100 2    50   ~ 0
VOutput
Text Label 9350 3100 2    50   ~ 0
VOutput
Text Label 2700 5600 3    50   ~ 0
VOutput
$Comp
L power:GND #PWR0106
U 1 1 5F5CD524
P 1900 5800
F 0 "#PWR0106" H 1900 5550 50  0001 C CNN
F 1 "GND" V 1905 5672 50  0000 R CNN
F 2 "" H 1900 5800 50  0001 C CNN
F 3 "" H 1900 5800 50  0001 C CNN
	1    1900 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C16
U 1 1 5F59BB62
P 10100 3250
F 0 "C16" H 10218 3296 50  0000 L CNN
F 1 "1000uf" H 10218 3205 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 10138 3100 50  0001 C CNN
F 3 "~" H 10100 3250 50  0001 C CNN
	1    10100 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5F59BB68
P 10100 3400
F 0 "#PWR024" H 10100 3150 50  0001 C CNN
F 1 "GND" V 10105 3272 50  0000 R CNN
F 2 "" H 10100 3400 50  0001 C CNN
F 3 "" H 10100 3400 50  0001 C CNN
	1    10100 3400
	1    0    0    -1  
$EndComp
Text Label 10100 3100 2    50   ~ 0
VOutput
$Comp
L Device:CP C15
U 1 1 5F59D1C4
P 9350 4000
F 0 "C15" H 9468 4046 50  0000 L CNN
F 1 "470uf" H 9468 3955 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 9388 3850 50  0001 C CNN
F 3 "~" H 9350 4000 50  0001 C CNN
	1    9350 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5F59D1CA
P 9350 4150
F 0 "#PWR020" H 9350 3900 50  0001 C CNN
F 1 "GND" V 9355 4022 50  0000 R CNN
F 2 "" H 9350 4150 50  0001 C CNN
F 3 "" H 9350 4150 50  0001 C CNN
	1    9350 4150
	1    0    0    -1  
$EndComp
Text Label 9350 3850 2    50   ~ 0
VOutput
Text Label 7600 1200 3    50   ~ 0
LEDA
Text Label 2100 3000 2    50   ~ 0
LEDA_32
$Comp
L power:+3V3 #PWR010
U 1 1 5F5C9609
P 7600 800
F 0 "#PWR010" H 7600 650 50  0001 C CNN
F 1 "+3V3" V 7615 928 50  0000 L CNN
F 2 "" H 7600 800 50  0001 C CNN
F 3 "" H 7600 800 50  0001 C CNN
	1    7600 800 
	1    0    0    -1  
$EndComp
Text Label 6550 1000 2    50   ~ 0
LEDA_32
$Comp
L Device:R R11
U 1 1 5F601559
P 6700 1000
F 0 "R11" V 6493 1000 50  0000 C CNN
F 1 "1k" V 6584 1000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6630 1000 50  0001 C CNN
F 3 "~" H 6700 1000 50  0001 C CNN
	1    6700 1000
	0    1    1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 5F590065
P 1300 5750
F 0 "R13" H 1370 5796 50  0000 L CNN
F 1 "100k" H 1370 5705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1230 5750 50  0001 C CNN
F 3 "~" H 1300 5750 50  0001 C CNN
	1    1300 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 5600 1600 5600
Connection ~ 1300 5600
$Comp
L power:GND #PWR0113
U 1 1 5F59A3B1
P 1300 5900
F 0 "#PWR0113" H 1300 5650 50  0001 C CNN
F 1 "GND" V 1305 5772 50  0000 R CNN
F 2 "" H 1300 5900 50  0001 C CNN
F 3 "" H 1300 5900 50  0001 C CNN
	1    1300 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4950 2700 5200
$Comp
L Device:Q_PMOS_GSD Q2
U 1 1 5F5A85F7
P 2600 5400
F 0 "Q2" H 2805 5354 50  0000 L CNN
F 1 "Q_PMOS_GSD" H 2805 5445 50  0000 L CNN
F 2 "KisonCommon:DFN-8-1EP_3x3mm_P0.65mm_EP1.7x2.05mm" H 2800 5500 50  0001 C CNN
F 3 "~" H 2600 5400 50  0001 C CNN
	1    2600 5400
	1    0    0    1   
$EndComp
Connection ~ 8150 6000
$Comp
L Connector:USB_C_Receptacle J9
U 1 1 5F678410
P 8150 4400
F 0 "J9" H 8257 5667 50  0000 C CNN
F 1 "USB_C_Receptacle" H 8257 5576 50  0000 C CNN
F 2 "Connector_USB:USB_C_Receptacle_HRO_TYPE-C-31-M-12" H 8300 4400 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 8300 4400 50  0001 C CNN
	1    8150 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3900 8750 4000
Wire Wire Line
	8750 4100 8750 4200
$Comp
L Device:R R14
U 1 1 5F59C17E
P 8900 3600
F 0 "R14" V 8693 3600 50  0000 C CNN
F 1 "5.1k" V 8784 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8830 3600 50  0001 C CNN
F 3 "~" H 8900 3600 50  0001 C CNN
	1    8900 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 5F59C4FC
P 8900 3700
F 0 "R15" V 9000 3700 50  0000 C CNN
F 1 "5.1k" V 9100 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8830 3700 50  0001 C CNN
F 3 "~" H 8900 3700 50  0001 C CNN
	1    8900 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	9050 3600 9050 3700
$Comp
L power:GND #PWR025
U 1 1 5F5A897B
P 9050 3600
F 0 "#PWR025" H 9050 3350 50  0001 C CNN
F 1 "GND" V 9055 3472 50  0000 R CNN
F 2 "" H 9050 3600 50  0001 C CNN
F 3 "" H 9050 3600 50  0001 C CNN
	1    9050 3600
	0    -1   -1   0   
$EndComp
Connection ~ 9050 3600
$Comp
L Device:R R10
U 1 1 5F5A4164
P 1900 5100
F 0 "R10" H 1970 5146 50  0000 L CNN
F 1 "2.2k" H 1970 5055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1830 5100 50  0001 C CNN
F 3 "~" H 1900 5100 50  0001 C CNN
	1    1900 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0109
U 1 1 5F604079
P 7100 1300
F 0 "#PWR0109" H 7100 1150 50  0001 C CNN
F 1 "+3V3" V 7115 1428 50  0000 L CNN
F 2 "" H 7100 1300 50  0001 C CNN
F 3 "" H 7100 1300 50  0001 C CNN
	1    7100 1300
	-1   0    0    1   
$EndComp
Wire Wire Line
	7100 1000 7300 1000
Wire Wire Line
	6850 1000 7100 1000
Connection ~ 7100 1000
$Comp
L Device:R R12
U 1 1 5F60365C
P 7100 1150
F 0 "R12" H 7170 1196 50  0000 L CNN
F 1 "10k" H 7170 1105 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7030 1150 50  0001 C CNN
F 3 "~" H 7100 1150 50  0001 C CNN
	1    7100 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_PMOS_GSD Q3
U 1 1 5F593D85
P 7500 1000
F 0 "Q3" H 7705 954 50  0000 L CNN
F 1 "Q_PMOS_GSD" H 7705 1045 50  0000 L CNN
F 2 "KisonCommon:DFN-8-1EP_3x3mm_P0.65mm_EP1.7x2.05mm" H 7700 1100 50  0001 C CNN
F 3 "~" H 7500 1000 50  0001 C CNN
	1    7500 1000
	1    0    0    1   
$EndComp
Text Label 3400 3100 0    50   ~ 0
RESET
$Comp
L Device:Q_NPN_BEC Q1
U 1 1 5F6B999B
P 1800 5600
F 0 "Q1" H 1991 5646 50  0000 L CNN
F 1 "Q_NPN_BEC" H 1991 5555 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2000 5700 50  0001 C CNN
F 3 "~" H 1800 5600 50  0001 C CNN
	1    1800 5600
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM321 U4
U 1 1 5F7281B5
P 4850 5900
F 0 "U4" H 4950 5650 50  0000 C CNN
F 1 "LM321" H 4950 5750 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4850 5900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm321.pdf" H 4850 5900 50  0001 C CNN
	1    4850 5900
	1    0    0    1   
$EndComp
$Comp
L Device:R R16
U 1 1 5F72CD31
P 4150 5800
F 0 "R16" V 3943 5800 50  0000 C CNN
F 1 "10k" V 4034 5800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4080 5800 50  0001 C CNN
F 3 "~" H 4150 5800 50  0001 C CNN
	1    4150 5800
	0    1    1    0   
$EndComp
$Comp
L Device:R R19
U 1 1 5F72DC88
P 5050 5400
F 0 "R19" V 5257 5400 50  0000 C CNN
F 1 "10k" V 5166 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4980 5400 50  0001 C CNN
F 3 "~" H 5050 5400 50  0001 C CNN
	1    5050 5400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4300 5800 4400 5800
Wire Wire Line
	5200 5400 5200 5900
Wire Wire Line
	5200 5900 5150 5900
Wire Wire Line
	5200 5900 5300 5900
Connection ~ 5200 5900
$Comp
L power:+3V3 #PWR039
U 1 1 5F73D92E
P 4000 5800
F 0 "#PWR039" H 4000 5650 50  0001 C CNN
F 1 "+3V3" V 4015 5928 50  0000 L CNN
F 2 "" H 4000 5800 50  0001 C CNN
F 3 "" H 4000 5800 50  0001 C CNN
	1    4000 5800
	0    -1   -1   0   
$EndComp
Text Label 3400 2900 0    50   ~ 0
BATT_AD
Text Label 5300 5900 0    50   ~ 0
BATT_AD
$Comp
L Device:R R18
U 1 1 5F74B2D5
P 4400 6150
F 0 "R18" H 4330 6104 50  0000 R CNN
F 1 "5.1k" H 4330 6195 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4330 6150 50  0001 C CNN
F 3 "~" H 4400 6150 50  0001 C CNN
	1    4400 6150
	-1   0    0    1   
$EndComp
$Comp
L Device:R R17
U 1 1 5F74B9A1
P 4150 6000
F 0 "R17" V 3950 6000 50  0000 C CNN
F 1 "10k" V 4050 6000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4080 6000 50  0001 C CNN
F 3 "~" H 4150 6000 50  0001 C CNN
	1    4150 6000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4300 6000 4400 6000
Connection ~ 4400 6000
Wire Wire Line
	4400 6000 4550 6000
$Comp
L power:+BATT #PWR040
U 1 1 5F752C20
P 4000 6000
F 0 "#PWR040" H 4000 5850 50  0001 C CNN
F 1 "+BATT" V 4015 6127 50  0000 L CNN
F 2 "" H 4000 6000 50  0001 C CNN
F 3 "" H 4000 6000 50  0001 C CNN
	1    4000 6000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR041
U 1 1 5F75A52D
P 4400 6300
F 0 "#PWR041" H 4400 6050 50  0001 C CNN
F 1 "GND" V 4405 6172 50  0000 R CNN
F 2 "" H 4400 6300 50  0001 C CNN
F 3 "" H 4400 6300 50  0001 C CNN
	1    4400 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 5400 4400 5800
Wire Wire Line
	4400 5400 4900 5400
Connection ~ 4400 5800
Wire Wire Line
	4400 5800 4550 5800
$Comp
L power:GND #PWR0114
U 1 1 5F760915
P 4750 5600
F 0 "#PWR0114" H 4750 5350 50  0001 C CNN
F 1 "GND" V 4755 5472 50  0000 R CNN
F 2 "" H 4750 5600 50  0001 C CNN
F 3 "" H 4750 5600 50  0001 C CNN
	1    4750 5600
	0    1    1    0   
$EndComp
$Comp
L power:+BATT #PWR0115
U 1 1 5F764F30
P 4750 6200
F 0 "#PWR0115" H 4750 6050 50  0001 C CNN
F 1 "+BATT" V 4765 6327 50  0000 L CNN
F 2 "" H 4750 6200 50  0001 C CNN
F 3 "" H 4750 6200 50  0001 C CNN
	1    4750 6200
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J10
U 1 1 5F79540D
P 10700 6200
F 0 "J10" H 10750 6517 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 10750 6426 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x03_P1.27mm_Vertical" H 10700 6200 50  0001 C CNN
F 3 "~" H 10700 6200 50  0001 C CNN
	1    10700 6200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 5F7A6780
P 9750 4800
F 0 "H6" H 9850 4846 50  0000 L CNN
F 1 "MountingHole" H 9850 4755 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965" H 9750 4800 50  0001 C CNN
F 3 "~" H 9750 4800 50  0001 C CNN
	1    9750 4800
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H13
U 1 1 5F7CB992
P 9600 5750
F 0 "H13" H 9700 5796 50  0000 L CNN
F 1 "1mm Hole" H 9700 5705 50  0000 L CNN
F 2 "KisonCommon:1mm Hole" H 9600 5750 50  0001 C CNN
F 3 "~" H 9600 5750 50  0001 C CNN
	1    9600 5750
	-1   0    0    -1  
$EndComp
Text Label 4350 2400 0    50   ~ 0
LEDA
Text Label 4350 3100 0    50   ~ 0
CS
$Comp
L power:+3V3 #PWR0108
U 1 1 5F5C8BCD
P 4350 3000
F 0 "#PWR0108" H 4350 2850 50  0001 C CNN
F 1 "+3V3" V 4365 3128 50  0000 L CNN
F 2 "" H 4350 3000 50  0001 C CNN
F 3 "" H 4350 3000 50  0001 C CNN
	1    4350 3000
	0    1    -1   0   
$EndComp
Text Label 4350 2900 0    50   ~ 0
SCL
Text Label 4350 2800 0    50   ~ 0
SDA
Text Label 4350 2700 0    50   ~ 0
DC
Text Label 4350 2600 0    50   ~ 0
RESET
$Comp
L power:GND #PWR0107
U 1 1 5F5C40AC
P 4350 2500
F 0 "#PWR0107" H 4350 2250 50  0001 C CNN
F 1 "GND" V 4355 2372 50  0000 R CNN
F 2 "" H 4350 2500 50  0001 C CNN
F 3 "" H 4350 2500 50  0001 C CNN
	1    4350 2500
	0    -1   1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J8
U 1 1 5F5BE82F
P 4150 2700
F 0 "J8" H 4000 2050 50  0000 L CNN
F 1 "Conn_01x08" H 3800 2150 50  0000 L CNN
F 2 "Connector_FFC-FPC:Hirose_FH12-8S-0.5SH_1x08-1MP_P0.50mm_Horizontal" H 4150 2700 50  0001 C CNN
F 3 "~" H 4150 2700 50  0001 C CNN
	1    4150 2700
	-1   0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5F91C34C
P 9750 5050
F 0 "H5" H 9850 5096 50  0000 L CNN
F 1 "MountingHole" H 9850 5005 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965" H 9750 5050 50  0001 C CNN
F 3 "~" H 9750 5050 50  0001 C CNN
	1    9750 5050
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H7
U 1 1 5F91CA8B
P 9750 5250
F 0 "H7" H 9850 5296 50  0000 L CNN
F 1 "MountingHole" H 9850 5205 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_DIN965" H 9750 5250 50  0001 C CNN
F 3 "~" H 9750 5250 50  0001 C CNN
	1    9750 5250
	-1   0    0    1   
$EndComp
$EndSCHEMATC
