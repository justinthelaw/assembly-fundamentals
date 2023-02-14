# Program name: NumberStringTabs.s
# Author: Justin Law
# Date: 13 Feb 2023
# Purpose: this program outputs a string with tabs between the number and the characters before and after it

.text
.global main
main:
    # load the number into r0
    ldr r0, =42

    # output the string with tabs
    ldr r1, =stringOutput
    bl printf

    # exit
    mov r0, #0
    bx lr

.data
    stringOutput: .asciz "The number\t%d\tis surrounded by tabs\n"

