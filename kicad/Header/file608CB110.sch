EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title "NuDAC"
Date "2021-06-02"
Rev "1.0.0"
Comp "DANCHOUZHOU"
Comment1 "Copyright © Danny Chou, all rights reserved."
Comment2 "danchouzhou@gmail.com"
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	3750 3200 4250 3200
Wire Wire Line
	3750 3300 4250 3300
Wire Wire Line
	3750 3400 4250 3400
Wire Wire Line
	3750 3500 4250 3500
Wire Wire Line
	3750 3700 4250 3700
Wire Wire Line
	3750 3800 4250 3800
Wire Wire Line
	3750 3900 4250 3900
Wire Wire Line
	3750 4000 4250 4000
Wire Wire Line
	3750 4100 4250 4100
Wire Wire Line
	3750 4200 4250 4200
Wire Wire Line
	3750 4300 4250 4300
Wire Wire Line
	3750 4400 4250 4400
Wire Wire Line
	3750 4500 4250 4500
Wire Wire Line
	6750 4400 6250 4400
Wire Wire Line
	6750 4300 6250 4300
Wire Wire Line
	6750 4200 6250 4200
Wire Wire Line
	6750 4100 6250 4100
Wire Wire Line
	6750 4000 6250 4000
Wire Wire Line
	6750 3900 6250 3900
Wire Wire Line
	6750 3800 6250 3800
Wire Wire Line
	6750 3700 6250 3700
Wire Wire Line
	6750 3600 6250 3600
Wire Wire Line
	6750 3500 6250 3500
Wire Wire Line
	6750 3400 6250 3400
Wire Wire Line
	6750 3300 6250 3300
Wire Wire Line
	6750 3200 6250 3200
Text Label 3750 3200 0    50   ~ 0
PC1
Text Label 3750 3300 0    50   ~ 0
PC0
Text Label 3750 3400 0    50   ~ 0
5V
Text Label 3750 3500 0    50   ~ 0
GND
Text Label 3750 3700 0    50   ~ 0
PA15
Text Label 3750 3800 0    50   ~ 0
PB15
Text Label 3750 3900 0    50   ~ 0
PB14
Text Label 3750 4000 0    50   ~ 0
PB13
Text Label 3750 4100 0    50   ~ 0
PB12
Text Label 3750 4200 0    50   ~ 0
PB5
Text Label 3750 4300 0    50   ~ 0
PB4
Text Label 3750 4400 0    50   ~ 0
PB3
Text Label 3750 4500 0    50   ~ 0
PB2
Text Label 6750 3200 2    50   ~ 0
VDD
Text Label 6750 3300 2    50   ~ 0
PF0
Text Label 6750 3400 2    50   ~ 0
PF1
Text Label 6750 3500 2    50   ~ 0
nRESET
Text Label 6750 3600 2    50   ~ 0
GND
Text Label 6750 3700 2    50   ~ 0
VDDIO
Text Label 6750 3800 2    50   ~ 0
PA0
Text Label 6750 3900 2    50   ~ 0
PA1
Text Label 6750 4000 2    50   ~ 0
PA2
Text Label 6750 4100 2    50   ~ 0
PA3
$Comp
L NuDAC-rescue:Conn_01x14-Connector_Generic J2
U 1 1 608D3151
P 4450 3800
F 0 "J2" H 4530 3792 50  0000 L CNN
F 1 "Conn_01x14" H 4530 3701 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x14_P2.54mm_Vertical" H 4450 3800 50  0001 C CNN
F 3 "~" H 4450 3800 50  0001 C CNN
	1    4450 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3600 4250 3600
Text Label 3750 3600 0    50   ~ 0
GND
Text Label 6750 4200 2    50   ~ 0
PF4
$Comp
L NuDAC-rescue:Conn_01x14-Connector_Generic J3
U 1 1 608D48AD
P 6050 3900
F 0 "J3" H 6130 3892 50  0000 L CNN
F 1 "Conn_01x14" H 6130 3801 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x14_P2.54mm_Vertical" H 6050 3900 50  0001 C CNN
F 3 "~" H 6050 3900 50  0001 C CNN
	1    6050 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	6750 4500 6250 4500
Text Label 6750 4300 2    50   ~ 0
PF5
Text Label 6750 4400 2    50   ~ 0
PB0
Text Label 6750 4500 2    50   ~ 0
PB1
Wire Notes Line
	8000 5000 10000 5000
Wire Notes Line
	10000 5000 10000 6500
Wire Notes Line
	10000 6500 8000 6500
Wire Notes Line
	8000 6500 8000 5000
Text Notes 8100 5200 0    100  Italic 20
VDDIO selection
$Comp
L NuDAC-rescue:SolderJumper_2_Open-Jumper JP1
U 1 1 608E6204
P 9000 5850
F 0 "JP1" H 9000 6055 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 9000 5964 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 9000 5850 50  0001 C CNN
F 3 "~" H 9000 5850 50  0001 C CNN
	1    9000 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 5850 9650 5850
Wire Wire Line
	8850 5850 8350 5850
Text Label 9650 5850 2    50   ~ 0
VDDIO
Wire Notes Line
	8000 1000 10000 1000
Wire Notes Line
	10000 1000 10000 4500
Wire Notes Line
	10000 4500 8000 4500
Wire Notes Line
	8000 4500 8000 1000
Text Notes 8100 1200 0    100  Italic 20
Off page connection
Text GLabel 9000 2300 2    50   Output ~ 0
I2S_DO
Text GLabel 9000 2200 2    50   Input ~ 0
I2S_DI
Text GLabel 9000 2100 2    50   Output ~ 0
I2S_LRCK
Text GLabel 9000 2000 2    50   Output ~ 0
I2S_BCLK
Text GLabel 9000 1900 2    50   Output ~ 0
I2S_MCLK
Wire Wire Line
	8500 2300 9000 2300
Text GLabel 9000 2400 2    50   Input ~ 0
PB0
Text GLabel 9000 2600 2    50   BiDi ~ 0
I2C0_SDA
Text GLabel 9000 2700 2    50   Output ~ 0
I2C0_SCL
Text GLabel 9000 4300 2    50   Input ~ 0
nRESET
Text GLabel 9000 4200 2    50   BiDi ~ 0
ICE_CLK
Text GLabel 9000 4100 2    50   BiDi ~ 0
ICE_DAT
Text GLabel 9000 4000 2    50   BiDi ~ 0
PF5
Text GLabel 9000 3900 2    50   BiDi ~ 0
PF4
Text GLabel 9000 3800 2    50   BiDi ~ 0
PB15
Text GLabel 9000 3700 2    50   BiDi ~ 0
PB14
Text GLabel 9000 3600 2    50   BiDi ~ 0
PB13
Text GLabel 9000 3500 2    50   BiDi ~ 0
PB12
Text GLabel 9000 3400 2    50   BiDi ~ 0
PA15
Text GLabel 9000 3300 2    50   BiDi ~ 0
PA3
Text GLabel 9000 3200 2    50   BiDi ~ 0
PA2
Text GLabel 9000 3100 2    50   BiDi ~ 0
PA1
Text GLabel 9000 3000 2    50   BiDi ~ 0
PA0
Text GLabel 9000 2900 2    50   Input ~ 0
VDDIO
Text Label 8500 4300 0    50   ~ 0
nRESET
Text Label 8500 4200 0    50   ~ 0
PF1
Text Label 8500 4100 0    50   ~ 0
PF0
Wire Wire Line
	8500 4300 9000 4300
Wire Wire Line
	8500 4200 9000 4200
Wire Wire Line
	8500 4100 9000 4100
Text Label 8500 4000 0    50   ~ 0
PF5
Text Label 8500 3900 0    50   ~ 0
PF4
Wire Wire Line
	8500 4000 9000 4000
Wire Wire Line
	8500 3900 9000 3900
Text Label 8500 3800 0    50   ~ 0
PB15
Text Label 8500 3700 0    50   ~ 0
PB14
Text Label 8500 3600 0    50   ~ 0
PB13
Text Label 8500 3500 0    50   ~ 0
PB12
Wire Wire Line
	8500 3800 9000 3800
Wire Wire Line
	8500 3700 9000 3700
Wire Wire Line
	8500 3600 9000 3600
Wire Wire Line
	8500 3500 9000 3500
Text Label 8500 3400 0    50   ~ 0
PA15
Wire Wire Line
	8500 3400 9000 3400
Text Label 8500 3300 0    50   ~ 0
PA3
Text Label 8500 3200 0    50   ~ 0
PA2
Text Label 8500 3100 0    50   ~ 0
PA1
Text Label 8500 3000 0    50   ~ 0
PA0
Text Label 8500 2900 0    50   ~ 0
VDDIO
Wire Wire Line
	8500 3300 9000 3300
Wire Wire Line
	8500 3200 9000 3200
Wire Wire Line
	8500 3100 9000 3100
Wire Wire Line
	8500 3000 9000 3000
Wire Wire Line
	8500 2900 9000 2900
Text Label 8500 2700 0    50   ~ 0
PC1
Text Label 8500 2600 0    50   ~ 0
PC0
Wire Wire Line
	9000 2700 8500 2700
Wire Wire Line
	9000 2600 8500 2600
Text Label 8500 2400 0    50   ~ 0
PB0
Wire Wire Line
	8500 2400 9000 2400
Text Label 8500 2000 0    50   ~ 0
PB5
Text Label 8500 1900 0    50   ~ 0
PB4
Text Label 8500 2300 0    50   ~ 0
PB2
Text Label 8500 2200 0    50   ~ 0
PB3
Text Label 8500 2100 0    50   ~ 0
PB1
Wire Wire Line
	8500 2000 9000 2000
Wire Wire Line
	8500 1900 9000 1900
Wire Wire Line
	8500 2200 9000 2200
Wire Wire Line
	8500 2100 9000 2100
Text Notes 6950 3950 0    50   Italic 0
VDDIO domain\nPA3:PA0
Wire Notes Line
	6800 3650 6900 3650
Wire Notes Line
	6900 3650 6900 4100
Wire Notes Line
	6900 4100 6800 4100
Wire Notes Line
	1000 1000 3000 1000
Wire Notes Line
	3000 1000 3000 2500
Wire Notes Line
	3000 2500 1000 2500
Wire Notes Line
	1000 2500 1000 1000
$Comp
L power:GND #PWR057
U 1 1 60CCDB83
P 1500 2250
F 0 "#PWR057" H 1500 2000 50  0001 C CNN
F 1 "GND" H 1505 2077 50  0000 C CNN
F 2 "" H 1500 2250 50  0001 C CNN
F 3 "" H 1500 2250 50  0001 C CNN
	1    1500 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR056
U 1 1 60CCEADB
P 1500 1850
F 0 "#PWR056" H 1500 1700 50  0001 C CNN
F 1 "+5V" H 1515 2023 50  0000 C CNN
F 2 "" H 1500 1850 50  0001 C CNN
F 3 "" H 1500 1850 50  0001 C CNN
	1    1500 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1450 2500 1450
Wire Wire Line
	1500 1850 2500 1850
Wire Wire Line
	1500 2250 2500 2250
Text Notes 1100 1200 0    100  Italic 20
Power
Text Label 2500 1450 2    50   ~ 0
VDD
Text Label 2500 1850 2    50   ~ 0
5V
Text Label 2500 2250 2    50   ~ 0
GND
$Comp
L power:+3V3 #PWR0104
U 1 1 60CE4F40
P 1500 1450
F 0 "#PWR0104" H 1500 1300 50  0001 C CNN
F 1 "+3V3" H 1515 1623 50  0000 C CNN
F 2 "" H 1500 1450 50  0001 C CNN
F 3 "" H 1500 1450 50  0001 C CNN
	1    1500 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0105
U 1 1 60CE55E3
P 8350 5850
F 0 "#PWR0105" H 8350 5700 50  0001 C CNN
F 1 "+3V3" H 8365 6023 50  0000 C CNN
F 2 "" H 8350 5850 50  0001 C CNN
F 3 "" H 8350 5850 50  0001 C CNN
	1    8350 5850
	1    0    0    -1  
$EndComp
Wire Notes Line
	1000 3000 3000 3000
Wire Notes Line
	3000 3000 3000 4500
Wire Notes Line
	3000 4500 1000 4500
Wire Notes Line
	1000 4500 1000 3000
$Comp
L APA-104-2020-5mA:APA-104-2020-5mA D1
U 1 1 60BB732C
P 2400 3850
F 0 "D1" H 2450 4100 50  0000 L CNN
F 1 "APA-104-2020-5mA" H 2450 3600 50  0000 L CNN
F 2 "APA-104-2020-5mA:APA-104-2020-5mA" H 2450 3550 50  0001 L TNN
F 3 "http://neon-world.com/uploads/soft/20210506/1620282805.pdf" H 2500 3475 50  0001 L TNN
	1    2400 3850
	1    0    0    -1  
$EndComp
Text Notes 1100 3200 0    100  Italic 20
RGB LED
$Comp
L Logic_LevelTranslator:SN74LV1T34DCK U6
U 1 1 60BC63E5
P 1600 3850
F 0 "U6" H 1650 4100 50  0000 L CNN
F 1 "SN74LV1T34DCK" H 1650 3600 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-353_SC-70-5" H 2400 3600 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74lv1t34.pdf" H 1200 3650 50  0001 C CNN
	1    1600 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3850 2100 3850
Wire Wire Line
	1100 3850 1300 3850
Text Label 1100 3850 0    50   ~ 0
PA15
$Comp
L power:+5V #PWR017
U 1 1 60BCACFC
P 1600 3450
F 0 "#PWR017" H 1600 3300 50  0001 C CNN
F 1 "+5V" H 1615 3623 50  0000 C CNN
F 2 "" H 1600 3450 50  0001 C CNN
F 3 "" H 1600 3450 50  0001 C CNN
	1    1600 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 3450 1600 3550
$Comp
L power:+5V #PWR030
U 1 1 60BCD287
P 2400 3450
F 0 "#PWR030" H 2400 3300 50  0001 C CNN
F 1 "+5V" H 2415 3623 50  0000 C CNN
F 2 "" H 2400 3450 50  0001 C CNN
F 3 "" H 2400 3450 50  0001 C CNN
	1    2400 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3450 2400 3550
$Comp
L power:GND #PWR029
U 1 1 60BCF91F
P 1600 4250
F 0 "#PWR029" H 1600 4000 50  0001 C CNN
F 1 "GND" H 1605 4077 50  0000 C CNN
F 2 "" H 1600 4250 50  0001 C CNN
F 3 "" H 1600 4250 50  0001 C CNN
	1    1600 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR054
U 1 1 60BCFBD4
P 2400 4250
F 0 "#PWR054" H 2400 4000 50  0001 C CNN
F 1 "GND" H 2405 4077 50  0000 C CNN
F 2 "" H 2400 4250 50  0001 C CNN
F 3 "" H 2400 4250 50  0001 C CNN
	1    2400 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4250 2400 4150
Wire Wire Line
	1600 4250 1600 4150
NoConn ~ 2700 3850
Text Notes 1650 4200 0    50   ~ 0
MC74VHC1G50DF
$EndSCHEMATC
