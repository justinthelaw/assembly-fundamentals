# Program name: FtoC.s
# Author: Justin Law
# Date: 25 Feb 2023
# Purpose: This program uses ADD, MUL, and __aeabi_idiv to convert from Fahrenheit (F)
#          to Celsius (C), where C = (F - 32) * 5/9
#

    .text
.global main

main:
    @ Prompt user to enter a Fahrenheit temperature
    ldr r0, =prompt         # load address of prompt into r0
    bl printf               # print prompt message
    ldr r0, =fahrenheit     # load address of Fahrenheit temperature variable into r0
    bl scanf                # read user input Fahrenheit temperature into variable

    @ Convert Fahrenheit to Celsius
    ldr r1, =fahrenheit     # load address of Fahrenheit temperature into r1
    ldr r2, [r1]            # load value of Fahrenheit temperature into r2
    sub r2, r2, #32         # subtract 32 from Fahrenheit temperature
    mov r3, #5              # load 5 into r3
    mul r2, r2, r3          # multiply (Fahrenheit - 32) by 5
    mov r3, #9              # load 9 into r3
    sdiv r2, r2, r3         # divide the result by 9 to get Celsius temperature

    @ Output Celsius temperature
    ldr r0, =output         # load address of output message into r0
    ldr r1, =celsius        # load address of Celsius temperature variable into r1
    str r2, [r1]            # store the Celsius temperature value into the variable
    bl printf               # print the output message with the Celsius temperature value

    mov r0, #0              # return 0 to indicate successful execution
    bx lr                   # return from function

    @ Data section
prompt:     .asciz "Enter a Fahrenheit temperature: "
fahrenheit: .word 0          @ reserve space for Fahrenheit temperature
celsius:    .word 0          @ reserve space for Celsius temperature
output:     .asciz "The Celsius temperature is: %d\n"

