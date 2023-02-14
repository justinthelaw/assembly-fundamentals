#
# Program name: PrintInt.s
# Author: Justin Law
# Date: 13 Feb 2023
# Purpose: this program prints a prompt asking for an integer as input
#          and then prints the integer back to the user
#

.text

.global main

main:
  # push the stack
  # create space on the stack by subtracting 4 bytes from the stack pointer
  SUB sp, sp, #4
  # save a register called link register to that point on the stack at offset of 0
  STR lr, [sp, #0]

  # print a prompt
  # load into r0 the address of prompt1
  LDR r0, =prompt1
  # branch and link to printf
  BL printf

  # read in the input number
  # load into r0 the format string
  LDR r0, =format1
  # load into r1 the number
  LDR r1, =num1
  # branch and link to scanf
  BL scanf

  # print the output number
  # load into r0 the output format (reference)
  LDR r0, =output1
  # load into r1 the address of the integer read-in (identifier)
  LDR r1, =num1
  # load value into the address (value)
  LDR r1, [r1, #0]
  # branch and link printf
  BL printf

  # pop the stack and return
  # retrieve the link register from the stack
  LDR lr, [sp, #0]
  # add 4 bytes back to stack
  ADD sp, sp, #4
  # return, move link register back to PC
  MOV pc, lr

.data
  prompt1: .asciz "Please enter an integer number: "
  output1: .asciz "Your entered the number: %d\n"
  format1: .asciz "%s"
  # 32 bytes big for the integer number
  num1: .word 32
