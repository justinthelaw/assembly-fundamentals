#
# Program name: PrintName.s
# Author: Justin Law
# Date: 13 Feb 2023
# Purpose: this program prints a prompt asking for user's name as input
#          and then prints the input name back to the user
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

  # read in the input name
  # load into r0 the format string
  LDR r0, =format1
  # load into r1 the name
  LDR r1, =name1
  # branch and link to scanf
  BL scanf

  # print the output name
  # load into r0 the output format
  LDR r0, =output1
  # load into r1 the address of the name read-in
  LDR r1, =name1
  # branch and link printf
  BL printf

  # pop the stack and return
  # retrieve the link register from the stack
  LDR lr, [sp, 0]
  # add 4 bytes back to stack
  ADD sp, sp, #4
  # return, move link register back to PC
  MOV pc, lr

.data
  prompt1: .asciz "Please enter your name: "
  output1: .asciz "Your name is: %s\n"
  format1: .asciz "%s"
  # 40 bytes big for the string read
  name1: .space 40
