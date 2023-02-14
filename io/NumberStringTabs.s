# Program name: NumberStringTabs.s
# Author: Justin Law
# Date: 13 Feb 2023
# Purpose: this program outputs a string with tabs between the number and the characters before and after it

.text
.global main
main:
  # push the stack
  # create space on the stack by subtracting 4 bytes from the stack pointer
  SUB sp, sp, #4
  # save a register called link register to that point on the stack at offset of 0
  STR lr, [sp, #0]

  # load the number into r0
  LDR r0, =42

  # output the string with tabs
  LDR r1, =stringOutput
  BL printf

  # pop the stack and return
  # retrieve the link register from the stack
  LDR lr, [sp, 0]
  # add 4 bytes back to stack
  ADD sp, sp, #4
  # return, move link register back to PC
  MOV pc, lr

.data
  stringOutput: .asciz "The number\t%d\tis surrounded by tabs\n"

