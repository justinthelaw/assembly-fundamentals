#
# Program name: helloWorld.s
# Author: Justin Law
# Date: 06 Feb 2023
# Purpose: this is a program for how to print a string using the C function printf
#

.text
.global main

main:
  # Save return to OS stack
  SUB sp, sp, #4
  STR lr, [sp, #0]
  
  # Printing method
  LDR r0, =helloWorld
  BL printf

  # Return to OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  # Stores the stirng to be printed
  helloWorld: .asciz "Hello World -Justin"
