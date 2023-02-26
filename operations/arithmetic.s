#
# Program name: arithmetic.s
# Author: Justin Law
# Date: 25 Feb 2023
# Purpose: this is a program to test simple arithmetic using 3-address instructions
#

.text
.global main

main:
  # Save return to OS stack
  SUB sp, sp, #4
  STR lr, [sp]
  
  ## Divide 8 by 2
  # move the immediate decimal 8 into register 0
  MOV r0, #8
  # move the immediate decimal 2 into register 1
  MOV r1, #2
  # branch link division function, r0 / r1 values (8 / 2)
  BL __aeabi_idiv
  # move value in register 1 to register 0
  MOV r1, r0
  # load into register 0 the output data format
  LDR r0, =div
  # branch link C printf function
  BL printf

  # Return to OS
  LDR lr, [sp]
  ADD sp, sp, #4
  MOV pc, lr

.data
  div: .asciz "The result of 8 / 2 is: %d\n"
