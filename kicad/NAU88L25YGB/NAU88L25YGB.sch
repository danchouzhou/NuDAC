EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
Title "NuDAC"
Date "2021-06-02"
Rev "1.0.0"
Comp "DANCHOUZHOU"
Comment1 "Copyright © Danny Chou, all rights reserved."
Comment2 "danchouzhou@gmail.com"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L NuDAC-rescue:C-Device C21
U 1 1 60777693
P 5250 5350
F 0 "C21" H 5365 5396 50  0000 L CNN
F 1 "2.2uF" H 5365 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5288 5200 50  0001 C CNN
F 3 "~" H 5250 5350 50  0001 C CNN
	1    5250 5350
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:C-Device C22
U 1 1 60778263
P 5750 5350
F 0 "C22" H 5865 5396 50  0000 L CNN
F 1 "4.7uF" H 5865 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5788 5200 50  0001 C CNN
F 3 "~" H 5750 5350 50  0001 C CNN
	1    5750 5350
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:C-Device C24
U 1 1 60778475
P 6250 5350
F 0 "C24" H 6365 5396 50  0000 L CNN
F 1 "4.7uF" H 6365 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6288 5200 50  0001 C CNN
F 3 "~" H 6250 5350 50  0001 C CNN
	1    6250 5350
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:C-Device C20
U 1 1 6077970B
P 4750 5350
F 0 "C20" H 4865 5396 50  0000 L CNN
F 1 "2.2uF" H 4865 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4788 5200 50  0001 C CNN
F 3 "~" H 4750 5350 50  0001 C CNN
	1    4750 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 5000 5250 5200
Wire Wire Line
	5750 5000 5750 5200
Wire Wire Line
	6250 5000 6250 5200
$Comp
L NuDAC-rescue:C-Device C18
U 1 1 6077C807
P 3950 4650
F 0 "C18" H 4065 4696 50  0000 L CNN
F 1 "2.2uF" H 4065 4605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3988 4500 50  0001 C CNN
F 3 "~" H 3950 4650 50  0001 C CNN
	1    3950 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4500 4250 4500
Wire Wire Line
	3950 4800 4250 4800
Wire Wire Line
	5250 5700 5250 5500
Wire Wire Line
	5750 5700 5750 5500
Wire Wire Line
	6250 5700 6250 5500
Wire Wire Line
	4750 5700 4750 5500
$Comp
L NuDAC-rescue:GND-power #PWR043
U 1 1 6077EE47
P 5250 5700
F 0 "#PWR043" H 5250 5450 50  0001 C CNN
F 1 "GND" H 5255 5527 50  0000 C CNN
F 2 "" H 5250 5700 50  0001 C CNN
F 3 "" H 5250 5700 50  0001 C CNN
	1    5250 5700
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:GND-power #PWR045
U 1 1 6077F194
P 5750 5700
F 0 "#PWR045" H 5750 5450 50  0001 C CNN
F 1 "GND" H 5755 5527 50  0000 C CNN
F 2 "" H 5750 5700 50  0001 C CNN
F 3 "" H 5750 5700 50  0001 C CNN
	1    5750 5700
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:GND-power #PWR047
U 1 1 6077F30C
P 6250 5700
F 0 "#PWR047" H 6250 5450 50  0001 C CNN
F 1 "GND" H 6255 5527 50  0000 C CNN
F 2 "" H 6250 5700 50  0001 C CNN
F 3 "" H 6250 5700 50  0001 C CNN
	1    6250 5700
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:GND-power #PWR042
U 1 1 6077F4D3
P 4750 5700
F 0 "#PWR042" H 4750 5450 50  0001 C CNN
F 1 "GND" H 4755 5527 50  0000 C CNN
F 2 "" H 4750 5700 50  0001 C CNN
F 3 "" H 4750 5700 50  0001 C CNN
	1    4750 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5000 4750 5100
Wire Wire Line
	4750 5100 4850 5100
Wire Wire Line
	4850 5100 4850 5000
Connection ~ 4750 5100
Wire Wire Line
	4750 5100 4750 5200
Wire Wire Line
	3750 3100 4250 3100
Wire Wire Line
	3750 3200 4250 3200
Wire Wire Line
	3750 3300 4250 3300
Wire Wire Line
	3750 3400 4250 3400
Wire Wire Line
	3750 3500 4250 3500
Wire Wire Line
	4250 3650 4050 3650
Wire Wire Line
	4050 3650 4050 3750
Wire Wire Line
	4050 3750 4250 3750
Connection ~ 4050 3750
Wire Wire Line
	4050 3750 4050 3850
Wire Wire Line
	4050 3850 4250 3850
Connection ~ 4050 3850
Wire Wire Line
	4050 3850 4050 3950
Wire Wire Line
	4050 3950 4250 3950
Connection ~ 4050 3950
Wire Wire Line
	4050 3950 4050 4050
Wire Wire Line
	4050 4050 4250 4050
Connection ~ 4050 4050
Wire Wire Line
	4050 4050 4050 4200
$Comp
L NuDAC-rescue:GND-power #PWR039
U 1 1 60785A45
P 4050 4200
F 0 "#PWR039" H 4050 3950 50  0001 C CNN
F 1 "GND" H 4055 4027 50  0000 C CNN
F 2 "" H 4050 4200 50  0001 C CNN
F 3 "" H 4050 4200 50  0001 C CNN
	1    4050 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 3850 6750 3850
Wire Wire Line
	7250 3950 6750 3950
Wire Wire Line
	7250 4150 6750 4150
Wire Wire Line
	7250 4250 6750 4250
Wire Wire Line
	7250 4350 6750 4350
Wire Wire Line
	7250 4450 6750 4450
Wire Wire Line
	7250 4550 6750 4550
Wire Wire Line
	7250 4700 6750 4700
Wire Wire Line
	7250 4800 6750 4800
Wire Notes Line
	1000 1000 3000 1000
Wire Notes Line
	8000 1000 10000 1000
Wire Notes Line
	10000 1000 10000 2500
Wire Notes Line
	10000 2500 8000 2500
Wire Notes Line
	8000 2500 8000 1000
Wire Notes Line
	8000 3000 10000 3000
Wire Notes Line
	10000 3000 10000 6500
Wire Notes Line
	10000 6500 8000 6500
Wire Notes Line
	8000 6500 8000 3000
Wire Wire Line
	7250 3300 6750 3300
Wire Wire Line
	7250 3500 6750 3500
Wire Wire Line
	7250 3400 6750 3400
Wire Wire Line
	7250 3100 6750 3100
Wire Wire Line
	7250 3200 6750 3200
Text Label 7250 3300 2    50   ~ 0
I2S0_LRCK
Text Label 7250 3500 2    50   ~ 0
I2S0_DO
Text Label 7250 3400 2    50   ~ 0
I2S0_DI
Text Label 7250 3100 2    50   ~ 0
I2S0_MCLK
Text Label 7250 3200 2    50   ~ 0
I2S0_BCLK
Text Label 3750 3100 0    50   ~ 0
VDDA
Text Label 3750 3200 0    50   ~ 0
VDDA
Text Label 3750 3300 0    50   ~ 0
VDDMIC
Text Label 3750 3400 0    50   ~ 0
VDDB
Text Label 3750 3500 0    50   ~ 0
VDDC
Wire Wire Line
	6750 3650 7250 3650
Wire Wire Line
	6750 3750 7250 3750
Text Label 7250 3650 2    50   ~ 0
I2C0_SDA
Text Label 7250 3750 2    50   ~ 0
I2C0_SCL
$Comp
L NuDAC-rescue:GND-power #PWR049
U 1 1 607A21AA
P 7250 3950
F 0 "#PWR049" H 7250 3700 50  0001 C CNN
F 1 "GND" V 7255 3822 50  0000 R CNN
F 2 "" H 7250 3950 50  0001 C CNN
F 3 "" H 7250 3950 50  0001 C CNN
	1    7250 3950
	0    -1   -1   0   
$EndComp
Text Label 7250 3850 2    50   ~ 0
PB0
$Comp
L NAU88L25YGB:NAU88L25YGB U5
U 1 1 608863DF
P 5500 3950
F 0 "U5" H 5500 5065 50  0000 C CNN
F 1 "NAU88L25YGB" H 5500 4974 50  0000 C CNN
F 2 "Package_DFN_QFN:VQFN-32-1EP_5x5mm_P0.5mm_EP3.5x3.5mm" H 5500 5050 50  0001 C CNN
F 3 "" H 5500 5050 50  0001 C CNN
	1    5500 3950
	1    0    0    -1  
$EndComp
Text GLabel 9000 1900 2    50   Input ~ 0
I2S_DO
Text GLabel 9000 1800 2    50   Output ~ 0
I2S_DI
Text GLabel 9000 1700 2    50   Input ~ 0
I2S_LRCK
Text GLabel 9000 1600 2    50   Input ~ 0
I2S_BCLK
Text GLabel 9000 1500 2    50   Input ~ 0
I2S_MCLK
Wire Wire Line
	8500 1900 9000 1900
Text GLabel 9000 2000 2    50   Output ~ 0
PB0
Text GLabel 9000 2200 2    50   BiDi ~ 0
I2C0_SDA
Text GLabel 9000 2300 2    50   Input ~ 0
I2C0_SCL
Text Label 8500 2300 0    50   ~ 0
I2C0_SCL
Text Label 8500 2200 0    50   ~ 0
I2C0_SDA
Wire Wire Line
	9000 2300 8500 2300
Wire Wire Line
	9000 2200 8500 2200
Text Label 8500 2000 0    50   ~ 0
PB0
Wire Wire Line
	8500 2000 9000 2000
Text Label 8500 1600 0    50   ~ 0
I2S0_BCLK
Text Label 8500 1500 0    50   ~ 0
I2S0_MCLK
Text Label 8500 1900 0    50   ~ 0
I2S0_DO
Text Label 8500 1800 0    50   ~ 0
I2S0_DI
Text Label 8500 1700 0    50   ~ 0
I2S0_LRCK
Wire Wire Line
	8500 1600 9000 1600
Wire Wire Line
	8500 1500 9000 1500
Wire Wire Line
	8500 1800 9000 1800
Wire Wire Line
	8500 1700 9000 1700
Text Notes 8100 1200 0    100  Italic 20
Off page connection
Text Notes 8100 3200 0    100  Italic 20
Phone jack
Wire Wire Line
	1850 1750 1850 1950
Connection ~ 1850 1750
Wire Wire Line
	1850 1750 1650 1750
Wire Wire Line
	1850 1750 2350 1750
$Comp
L NuDAC-rescue:C-Device C10
U 1 1 609330EF
P 1850 2100
F 0 "C10" H 1965 2146 50  0000 L CNN
F 1 "4.7uF" H 1965 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1888 1950 50  0001 C CNN
F 3 "~" H 1850 2100 50  0001 C CNN
	1    1850 2100
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:C-Device C14
U 1 1 609334C9
P 2350 2100
F 0 "C14" H 2465 2146 50  0000 L CNN
F 1 "100nF" H 2465 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2388 1950 50  0001 C CNN
F 3 "~" H 2350 2100 50  0001 C CNN
	1    2350 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 1750 2350 1950
Wire Wire Line
	1150 1750 1350 1750
Wire Wire Line
	1850 2250 1850 2450
Wire Wire Line
	2350 2450 2350 2250
$Comp
L NuDAC-rescue:GND-power #PWR031
U 1 1 6093BB83
P 1850 2450
F 0 "#PWR031" H 1850 2200 50  0001 C CNN
F 1 "GND" H 1855 2277 50  0000 C CNN
F 2 "" H 1850 2450 50  0001 C CNN
F 3 "" H 1850 2450 50  0001 C CNN
	1    1850 2450
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:GND-power #PWR035
U 1 1 6093BE9C
P 2350 2450
F 0 "#PWR035" H 2350 2200 50  0001 C CNN
F 1 "GND" H 2355 2277 50  0000 C CNN
F 2 "" H 2350 2450 50  0001 C CNN
F 3 "" H 2350 2450 50  0001 C CNN
	1    2350 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 1750 2350 1750
Connection ~ 2350 1750
Text Label 2850 1750 2    50   ~ 0
VDDA
Wire Notes Line
	1000 6500 3000 6500
Wire Notes Line
	1000 1000 1000 6500
$Comp
L NuDAC-rescue:Ferrite_Bead-Device FB4
U 1 1 60945245
P 1500 3000
F 0 "FB4" V 1226 3000 50  0000 C CNN
F 1 "bead" V 1317 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1430 3000 50  0001 C CNN
F 3 "~" H 1500 3000 50  0001 C CNN
	1    1500 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 3000 1850 3200
Connection ~ 1850 3000
Wire Wire Line
	1850 3000 1650 3000
Wire Wire Line
	1850 3000 2350 3000
$Comp
L NuDAC-rescue:C-Device C11
U 1 1 60945253
P 1850 3350
F 0 "C11" H 1965 3396 50  0000 L CNN
F 1 "4.7uF" H 1965 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1888 3200 50  0001 C CNN
F 3 "~" H 1850 3350 50  0001 C CNN
	1    1850 3350
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:C-Device C15
U 1 1 6094525D
P 2350 3350
F 0 "C15" H 2465 3396 50  0000 L CNN
F 1 "100nF" H 2465 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2388 3200 50  0001 C CNN
F 3 "~" H 2350 3350 50  0001 C CNN
	1    2350 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3000 2350 3200
Wire Wire Line
	1150 3000 1350 3000
Wire Wire Line
	1850 3500 1850 3700
Wire Wire Line
	2350 3700 2350 3500
$Comp
L NuDAC-rescue:GND-power #PWR032
U 1 1 6094526B
P 1850 3700
F 0 "#PWR032" H 1850 3450 50  0001 C CNN
F 1 "GND" H 1855 3527 50  0000 C CNN
F 2 "" H 1850 3700 50  0001 C CNN
F 3 "" H 1850 3700 50  0001 C CNN
	1    1850 3700
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:GND-power #PWR036
U 1 1 60945275
P 2350 3700
F 0 "#PWR036" H 2350 3450 50  0001 C CNN
F 1 "GND" H 2355 3527 50  0000 C CNN
F 2 "" H 2350 3700 50  0001 C CNN
F 3 "" H 2350 3700 50  0001 C CNN
	1    2350 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3000 2350 3000
Connection ~ 2350 3000
Text Label 2850 3000 2    50   ~ 0
VDDC
$Comp
L NuDAC-rescue:Ferrite_Bead-Device FB5
U 1 1 6094C302
P 1500 4250
F 0 "FB5" V 1226 4250 50  0000 C CNN
F 1 "bead" V 1317 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1430 4250 50  0001 C CNN
F 3 "~" H 1500 4250 50  0001 C CNN
	1    1500 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 4250 1850 4450
Connection ~ 1850 4250
Wire Wire Line
	1850 4250 1650 4250
Wire Wire Line
	1850 4250 2350 4250
$Comp
L NuDAC-rescue:C-Device C12
U 1 1 6094C310
P 1850 4600
F 0 "C12" H 1965 4646 50  0000 L CNN
F 1 "4.7uF" H 1965 4555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1888 4450 50  0001 C CNN
F 3 "~" H 1850 4600 50  0001 C CNN
	1    1850 4600
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:C-Device C16
U 1 1 6094C31A
P 2350 4600
F 0 "C16" H 2465 4646 50  0000 L CNN
F 1 "100nF" H 2465 4555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2388 4450 50  0001 C CNN
F 3 "~" H 2350 4600 50  0001 C CNN
	1    2350 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4250 2350 4450
Wire Wire Line
	1150 4250 1350 4250
Wire Wire Line
	1850 4750 1850 4950
Wire Wire Line
	2350 4950 2350 4750
$Comp
L NuDAC-rescue:GND-power #PWR033
U 1 1 6094C328
P 1850 4950
F 0 "#PWR033" H 1850 4700 50  0001 C CNN
F 1 "GND" H 1855 4777 50  0000 C CNN
F 2 "" H 1850 4950 50  0001 C CNN
F 3 "" H 1850 4950 50  0001 C CNN
	1    1850 4950
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:GND-power #PWR037
U 1 1 6094C332
P 2350 4950
F 0 "#PWR037" H 2350 4700 50  0001 C CNN
F 1 "GND" H 2355 4777 50  0000 C CNN
F 2 "" H 2350 4950 50  0001 C CNN
F 3 "" H 2350 4950 50  0001 C CNN
	1    2350 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 4250 2350 4250
Connection ~ 2350 4250
Text Label 2850 4250 2    50   ~ 0
VDDMIC
$Comp
L NuDAC-rescue:Ferrite_Bead-Device FB6
U 1 1 6094C33F
P 1500 5500
F 0 "FB6" V 1226 5500 50  0000 C CNN
F 1 "bead" V 1317 5500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1430 5500 50  0001 C CNN
F 3 "~" H 1500 5500 50  0001 C CNN
	1    1500 5500
	0    1    1    0   
$EndComp
Wire Wire Line
	1850 5500 1850 5700
Connection ~ 1850 5500
Wire Wire Line
	1850 5500 1650 5500
Wire Wire Line
	1850 5500 2350 5500
$Comp
L NuDAC-rescue:C-Device C13
U 1 1 6094C34D
P 1850 5850
F 0 "C13" H 1965 5896 50  0000 L CNN
F 1 "4.7uF" H 1965 5805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1888 5700 50  0001 C CNN
F 3 "~" H 1850 5850 50  0001 C CNN
	1    1850 5850
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:C-Device C17
U 1 1 6094C357
P 2350 5850
F 0 "C17" H 2465 5896 50  0000 L CNN
F 1 "100nF" H 2465 5805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2388 5700 50  0001 C CNN
F 3 "~" H 2350 5850 50  0001 C CNN
	1    2350 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 5500 2350 5700
Wire Wire Line
	1150 5500 1350 5500
Wire Wire Line
	1850 6000 1850 6200
Wire Wire Line
	2350 6200 2350 6000
$Comp
L NuDAC-rescue:GND-power #PWR034
U 1 1 6094C365
P 1850 6200
F 0 "#PWR034" H 1850 5950 50  0001 C CNN
F 1 "GND" H 1855 6027 50  0000 C CNN
F 2 "" H 1850 6200 50  0001 C CNN
F 3 "" H 1850 6200 50  0001 C CNN
	1    1850 6200
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:GND-power #PWR038
U 1 1 6094C36F
P 2350 6200
F 0 "#PWR038" H 2350 5950 50  0001 C CNN
F 1 "GND" H 2355 6027 50  0000 C CNN
F 2 "" H 2350 6200 50  0001 C CNN
F 3 "" H 2350 6200 50  0001 C CNN
	1    2350 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 5500 2350 5500
Connection ~ 2350 5500
Text Label 2850 5500 2    50   ~ 0
VDDB
$Comp
L NuDAC-rescue:+1V8-power #PWR?
U 1 1 60952FE0
P 1150 1750
AR Path="/606F3289/60952FE0" Ref="#PWR?"  Part="1" 
AR Path="/606F3D2A/60952FE0" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 1150 1600 50  0001 C CNN
F 1 "+1V8" H 1165 1923 50  0000 C CNN
F 2 "" H 1150 1750 50  0001 C CNN
F 3 "" H 1150 1750 50  0001 C CNN
	1    1150 1750
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:+1V8-power #PWR?
U 1 1 609533C0
P 1150 3000
AR Path="/606F3289/609533C0" Ref="#PWR?"  Part="1" 
AR Path="/606F3D2A/609533C0" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 1150 2850 50  0001 C CNN
F 1 "+1V8" H 1165 3173 50  0000 C CNN
F 2 "" H 1150 3000 50  0001 C CNN
F 3 "" H 1150 3000 50  0001 C CNN
	1    1150 3000
	1    0    0    -1  
$EndComp
Text Notes 1100 1200 0    100  Italic 20
Bulk and filter
$Comp
L NuDAC-rescue:Ferrite_Bead-Device FB3
U 1 1 609217CF
P 1500 1750
F 0 "FB3" V 1226 1750 50  0000 C CNN
F 1 "bead" V 1317 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1430 1750 50  0001 C CNN
F 3 "~" H 1500 1750 50  0001 C CNN
	1    1500 1750
	0    1    1    0   
$EndComp
Text Label 7250 4450 2    50   ~ 0
JKR2
Text Label 7250 4800 2    50   ~ 0
MIC-
Text Label 7250 4700 2    50   ~ 0
MIC+
Text Label 7250 4550 2    50   ~ 0
JKSLV
Text Label 7250 4250 2    50   ~ 0
HPL
Text Label 7250 4350 2    50   ~ 0
HPR
Text Label 7250 4150 2    50   ~ 0
JKDET
$Comp
L power:GND #PWR050
U 1 1 6107542A
P 8850 3700
F 0 "#PWR050" H 8850 3450 50  0001 C CNN
F 1 "GND" H 8855 3527 50  0000 C CNN
F 2 "" H 8850 3700 50  0001 C CNN
F 3 "" H 8850 3700 50  0001 C CNN
	1    8850 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 3700 8850 3600
Wire Wire Line
	8850 3600 9050 3600
Wire Wire Line
	9300 4100 9300 4450
Wire Wire Line
	9600 4100 9600 4350
Wire Wire Line
	9700 4100 9700 4550
Text Label 8200 4250 0    50   ~ 0
JKDET
Text Label 8200 4350 0    50   ~ 0
HPL
Text Label 8200 4450 0    50   ~ 0
HPR
Text Label 8200 4550 0    50   ~ 0
JKR2
Text Label 8200 4650 0    50   ~ 0
JKSLV
Text Label 8200 5050 0    50   ~ 0
MIC+
$Comp
L Device:C C25
U 1 1 6108CFF8
P 8700 5050
F 0 "C25" V 8448 5050 50  0000 C CNN
F 1 "4.7uF" V 8539 5050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8738 4900 50  0001 C CNN
F 3 "~" H 8700 5050 50  0001 C CNN
	1    8700 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	9200 4100 9200 4650
$Comp
L Device:C C26
U 1 1 61095A39
P 8700 5450
F 0 "C26" V 8448 5450 50  0000 C CNN
F 1 "4.7uF" V 8539 5450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8738 5300 50  0001 C CNN
F 3 "~" H 8700 5450 50  0001 C CNN
	1    8700 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	8550 5050 8200 5050
Wire Wire Line
	8200 5450 8550 5450
Wire Wire Line
	9200 4650 8200 4650
Connection ~ 9200 4650
Wire Wire Line
	8200 4550 9700 4550
Connection ~ 9700 4550
Wire Wire Line
	8200 4450 9300 4450
Wire Wire Line
	8200 4350 9600 4350
Text Label 8200 5450 0    50   ~ 0
MIC-
$Comp
L Device:C C27
U 1 1 610C95C6
P 9200 5800
F 0 "C27" H 9315 5846 50  0000 L CNN
F 1 "1nF" H 9315 5755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9238 5650 50  0001 C CNN
F 3 "~" H 9200 5800 50  0001 C CNN
	1    9200 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C28
U 1 1 610C98FA
P 9700 5800
F 0 "C28" H 9815 5846 50  0000 L CNN
F 1 "1nF" H 9815 5755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9738 5650 50  0001 C CNN
F 3 "~" H 9700 5800 50  0001 C CNN
	1    9700 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR051
U 1 1 610C9D03
P 9200 6150
F 0 "#PWR051" H 9200 5900 50  0001 C CNN
F 1 "GND" H 9205 5977 50  0000 C CNN
F 2 "" H 9200 6150 50  0001 C CNN
F 3 "" H 9200 6150 50  0001 C CNN
	1    9200 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 6150 9200 5950
$Comp
L power:GND #PWR053
U 1 1 610CE416
P 9700 6150
F 0 "#PWR053" H 9700 5900 50  0001 C CNN
F 1 "GND" H 9705 5977 50  0000 C CNN
F 2 "" H 9700 6150 50  0001 C CNN
F 3 "" H 9700 6150 50  0001 C CNN
	1    9700 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 6150 9700 5950
$Comp
L power:GND #PWR052
U 1 1 610D2820
P 9500 6150
F 0 "#PWR052" H 9500 5900 50  0001 C CNN
F 1 "GND" H 9505 5977 50  0000 C CNN
F 2 "" H 9500 6150 50  0001 C CNN
F 3 "" H 9500 6150 50  0001 C CNN
	1    9500 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 4100 9400 4250
Wire Wire Line
	9500 4100 9500 6150
Wire Wire Line
	8200 4250 9050 4250
$Comp
L 2SJ3080-000111F:2SJ3080-000111F CN1
U 1 1 610F17E6
P 9550 3500
F 0 "CN1" V 9350 3500 50  0000 C CNN
F 1 "2SJ3080-000111F" V 9450 3500 50  0000 C CNN
F 2 "2SJ3080-000111F:2SJ3080-000111F" H 9550 4050 50  0001 C CNN
F 3 "" H 9550 4050 50  0001 C CNN
	1    9550 3500
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 6110E163
P 8700 4150
F 0 "R11" V 8493 4150 50  0000 C CNN
F 1 "1M" V 8584 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8630 4150 50  0001 C CNN
F 3 "~" H 8700 4150 50  0001 C CNN
	1    8700 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	8550 4150 8200 4150
Text Label 8200 4150 0    50   ~ 0
VDDA
Wire Wire Line
	8850 4150 9050 4150
Wire Wire Line
	9050 4150 9050 4250
Connection ~ 9050 4250
Wire Wire Line
	9050 4250 9400 4250
Wire Wire Line
	9200 4650 9200 5050
Wire Wire Line
	9700 4550 9700 5450
Wire Wire Line
	8850 5050 9200 5050
Connection ~ 9200 5050
Wire Wire Line
	9200 5050 9200 5650
Wire Wire Line
	8850 5450 9700 5450
Connection ~ 9700 5450
Wire Wire Line
	9700 5450 9700 5650
Wire Notes Line
	3000 1000 3000 6500
$Comp
L power:+3V3 #PWR0102
U 1 1 60CE3F27
P 1150 4250
F 0 "#PWR0102" H 1150 4100 50  0001 C CNN
F 1 "+3V3" H 1165 4423 50  0000 C CNN
F 2 "" H 1150 4250 50  0001 C CNN
F 3 "" H 1150 4250 50  0001 C CNN
	1    1150 4250
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0103
U 1 1 60CE46BA
P 1150 5500
F 0 "#PWR0103" H 1150 5350 50  0001 C CNN
F 1 "+3V3" H 1165 5673 50  0000 C CNN
F 2 "" H 1150 5500 50  0001 C CNN
F 3 "" H 1150 5500 50  0001 C CNN
	1    1150 5500
	1    0    0    -1  
$EndComp
Text Notes 8050 6450 0    50   ~ 0
Thanks for Singatron Co. provide the sample.
$Comp
L NuDAC-rescue:+1V8-power #PWR?
U 1 1 6091AA93
P 6400 1500
AR Path="/606F3289/6091AA93" Ref="#PWR?"  Part="1" 
AR Path="/606F3D2A/6091AA93" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 6400 1350 50  0001 C CNN
F 1 "+1V8" H 6415 1673 50  0000 C CNN
F 2 "" H 6400 1500 50  0001 C CNN
F 3 "" H 6400 1500 50  0001 C CNN
	1    6400 1500
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:+5V-power #PWR?
U 1 1 6091AA8D
P 4200 1500
AR Path="/606F3289/6091AA8D" Ref="#PWR?"  Part="1" 
AR Path="/606F3D2A/6091AA8D" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 4200 1350 50  0001 C CNN
F 1 "+5V" H 4215 1673 50  0000 C CNN
F 2 "" H 4200 1500 50  0001 C CNN
F 3 "" H 4200 1500 50  0001 C CNN
	1    4200 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1500 6200 1500
Wire Wire Line
	6200 1500 6200 1700
Wire Wire Line
	6200 2200 6200 2000
$Comp
L NuDAC-rescue:GND-power #PWR?
U 1 1 6091AA83
P 6200 2200
AR Path="/606F3289/6091AA83" Ref="#PWR?"  Part="1" 
AR Path="/606F3D2A/6091AA83" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 6200 1950 50  0001 C CNN
F 1 "GND" H 6205 2027 50  0000 C CNN
F 2 "" H 6200 2200 50  0001 C CNN
F 3 "" H 6200 2200 50  0001 C CNN
	1    6200 2200
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:C-Device C?
U 1 1 6091AA7D
P 6200 1850
AR Path="/606F3289/6091AA7D" Ref="C?"  Part="1" 
AR Path="/606F3D2A/6091AA7D" Ref="C23"  Part="1" 
F 0 "C23" H 6315 1896 50  0000 L CNN
F 1 "2.2uF" H 6315 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6238 1700 50  0001 C CNN
F 3 "~" H 6200 1850 50  0001 C CNN
	1    6200 1850
	1    0    0    -1  
$EndComp
Connection ~ 6200 1500
Wire Wire Line
	6000 1500 6200 1500
Wire Wire Line
	4800 1800 5000 1800
Wire Wire Line
	4800 1500 5000 1500
Connection ~ 4800 1500
Wire Wire Line
	4800 1500 4800 1800
$Comp
L NuDAC-rescue:GND-power #PWR?
U 1 1 6091AA72
P 5500 2200
AR Path="/606F3289/6091AA72" Ref="#PWR?"  Part="1" 
AR Path="/606F3D2A/6091AA72" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 5500 1950 50  0001 C CNN
F 1 "GND" H 5505 2027 50  0000 C CNN
F 2 "" H 5500 2200 50  0001 C CNN
F 3 "" H 5500 2200 50  0001 C CNN
	1    5500 2200
	1    0    0    -1  
$EndComp
$Comp
L NuDAC-rescue:GND-power #PWR?
U 1 1 6091AA6C
P 4400 2200
AR Path="/606F3289/6091AA6C" Ref="#PWR?"  Part="1" 
AR Path="/606F3D2A/6091AA6C" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 4400 1950 50  0001 C CNN
F 1 "GND" H 4405 2027 50  0000 C CNN
F 2 "" H 4400 2200 50  0001 C CNN
F 3 "" H 4400 2200 50  0001 C CNN
	1    4400 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2000 5500 2200
$Comp
L MCP1811:MCP1812AT-018_OT U?
U 1 1 6091AA65
P 5500 1650
AR Path="/606F3289/6091AA65" Ref="U?"  Part="1" 
AR Path="/606F3D2A/6091AA65" Ref="U4"  Part="1" 
F 0 "U4" H 5500 2065 50  0000 C CNN
F 1 "MCP1812AT-018_OT" H 5500 1974 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 5450 2650 50  0001 C CNN
F 3 "" H 5450 2650 50  0001 C CNN
	1    5500 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2200 4400 2000
Wire Wire Line
	4200 1500 4400 1500
Wire Wire Line
	4400 1500 4800 1500
Connection ~ 4400 1500
Wire Wire Line
	4400 1500 4400 1700
$Comp
L NuDAC-rescue:C-Device C?
U 1 1 6091AA5C
P 4400 1850
AR Path="/606F3289/6091AA5C" Ref="C?"  Part="1" 
AR Path="/606F3D2A/6091AA5C" Ref="C19"  Part="1" 
F 0 "C19" H 4515 1896 50  0000 L CNN
F 1 "2.2uF" H 4515 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4438 1700 50  0001 C CNN
F 3 "~" H 4400 1850 50  0001 C CNN
	1    4400 1850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
