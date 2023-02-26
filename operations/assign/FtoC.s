#
# Program name: FtoC.s
# Author: Justin Law
# Date: 25 Feb 2023
# Purpose: This program uses ADD, MUL, and __aeabi_idiv to convert from Fahrenheit (F)
#          to Celsius (C), where C = (F - 32) * 5/9
#

.text
.global main

main:
  # Save return address to OS stack
  # Allocate 4 bytes of space on the stack for return address
  SUB sp, sp, #4
  # Store the return address to the top of the stack
  STR lr, [sp]

  # Prompt user for input
  LDR r0, =fahr_prompt
  BL printf

  # Read in Fahrenheit temperature as input
  LDR r0, =fahr_format
  MOV r1, #0
  BL scanf

  # Convert Fahrenheit to Celsius
  # Subtract 32 from the input Fahrenheit temperature and store the result in r0
  SUB r0, r0, #32
  # Multiply the result by 5 and store the result in r0
  MOV r1, #5
  MUL r0, r0, r1
  # Divide the result by 9 and store the result in r0
  MOV r1, #9
  BL __aeabi_idiv
  # Move the Celsius temperature from r0 to r1
  MOV r1, r0

  # Output Celsius temperature to console
  LDR r0, =celsius_output
  BL printf

  # Return to OS
  # Restore the return address from the stack to the link register
  LDR lr, [sp]
  # Deallocate the space used by the return address on the stack
  ADD sp, sp, #4
  # Return to the caller by branching to the address in the link register
  MOV pc, lr

.data
  fahr_prompt: .asciz "Enter a temperature in Fahrenheit: "
  fahr_format: .asciz "%d"
  celsius_output: .asciz "The equivalent temperature in Celsius is: %d\n"
