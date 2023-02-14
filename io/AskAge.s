# Program name: Age.s
# Author: Justin Law
# Date: 13 Feb 2023
# Purpose: this program asks the user for their age and outputs it

.text
.global main

main:
  # allocate space on the stack for a 32-bit integer
  SUB sp, sp, #4

  # read in the user's age
  LDR r0, =formatAge
  ADD r1, sp, #0
  BL scanf

  # output the user's age
  LDR r0, =outputAge
  LDR r1, [sp, #0]
  BL printf

  # pop the stack and return
  # retrieve the link register from the stack
  LDR lr, [sp, 0]
  # add 4 bytes back to stack
  ADD sp, sp, #4
  # return, move link register back to PC
  MOV pc, lr

.data
  promptAge: .asciz "Enter your age: "
  outputAge: .asciz "Your age is: %d\n"
  formatAge: .asciz "%d"

