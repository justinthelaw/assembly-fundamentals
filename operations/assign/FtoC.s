# Program name: FtoC.s
# Author: Justin Law
# Date: 25 Feb 2023
# Purpose: This program uses ADD, MUL, and __aeabi_idiv to convert from Fahrenheit (F)
#          to Celsius (C), where C = (F - 32) * 5/9
#

    .text
.global main

main:
    LDR R0,=PROMPT
    BL printf
    LDR R0,=FAHRENHEIT
    BL scanf

    LDR R1,=FAHRENHEIT
    LDR R2,[R1]
    SUB R2,R2,#32
    MOV R3,#5
    MUL R2,R2,R3
    MOV R3,#9
    SDIV R2,R2,R3

    LDR R0,=OUTPUT
    LDR R1,=CELSIUS
    STR R2,[R1]
    BL printf

    MOV R0,#0
    BX LR

    .data
PROMPT:     .asciz "Enter a Fahrenheit temperature: "
FAHRENHEIT: .word 0
CELSIUS:    .word 0
OUTPUT:     .asciz "The Celsius temperature is: %d\n"

    .ltorg

