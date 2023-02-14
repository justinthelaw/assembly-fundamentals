# Program name: Quotes.s
# Author: Justin Law
# Date: 13 Feb 2023
# Purpose: this program prints quotes in a formatted string

.text
.global main

main:
  # print the formatted string with quotes
  LDR r0, =outputString
  BL printf

  # exit the program
  MOV r7, #1
  MOV r0, #0
  SWI 0

.data
  outputString: .asciz "This is a string with \"quotes\" in it.\n"
