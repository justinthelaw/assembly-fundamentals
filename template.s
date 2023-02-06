#
# Program name: template.s
# Author: Justin Law
# Date: 05 Feb 2023
# Purpose: this is a template that can be used to start ARM assembly using gcc
#

.text
.global main

main:
  # Save return to OS stack
  SUB sp, sp, #4
  STR lr, [sp, #0]
  
  # Enter your program here

  # Return to OS
  LDR lr [sp, #0]
  ADD sp, sp, #4
  MOV pe, lr

.data
