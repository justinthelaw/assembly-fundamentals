# Program name: Age.s
# Author: Justin Law
# Date: 13 Feb 2023
# Purpose: this program asks the user for their age and outputs it

.text

.global main

main:
    # allocate space on the stack for a 32-bit integer
    SUB sp, sp, #4

    # prompt the user for their age
    LDR r0, =promptAge
    BL printf

    # read in the user's age
    LDR r0, =formatAge
    LDR r1, [sp, #0]
    BL scanf

    # output the user's age
    LDR r0, =outputAge
    LDR r1, [sp, #0]
    BL printf

    # clean up the stack and return
    ADD sp, sp, #4
    MOV r0, #0
    BX lr

.data
promptAge: .asciz "Enter your age: "
outputAge: .asciz "Your age is: %d\n"
formatAge: .asicz "%d"