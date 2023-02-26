#
# Program name: toFeet.s
# Author: Justin Law
# Date: 25 Feb 2023
# Purpose: This program takes in inches and
#          converts to total feet and inches
#

.text
.global main

main:
  # Save return address to OS stack
  # Allocate 4 bytes of space on the stack for return address
  SUB sp, sp, #4
  # Store the return address to the top of the stack
  STR lr, [sp]

  ## Prompt the user for inches to convert
  # Load into register r0 the prompt
  LDR r0, =promptInches
  # Branch and link to C's printf function
  BL printf

  ## Scan the user's input number into memory
  # Load into register r0 the input temperature format
  LDR r0, =formatNumber
  # Load into register r1 the input's address
  LDR r1, =inches
  # Branch and link to C's scanf function
  BL scanf

  ## Conversion
  # Load into register r0 the address of input
  LDR r0, =inches
  # Load the value from the address
  LDR r0, [r0]
  # Move into register r1 the value 12
  MOV r1, #12
  # Divide by 12
  BL __aeabi_idiv
  # Move feet into register r4
  MOV r4, r0

  MOV r1, #12
  MOV r0, r4
  MUL r0, r0, r4

  LDR r1, =inches
  LDR r1, [r1]
  SUB r1, r1, r0

  MOV r2, r1
  MOV r0, r1
  ## Print out the result
  # Load into register r0 the output format
  LDR r0, =output
  # Branch and link C's printf function
  BL printf

  # Return to OS
  # Restore the return address from the stack to the link register
  LDR lr, [sp]
  # Deallocate the space used by the return address on the stack
  ADD sp, sp, #4
  # Return to the caller by branching to the address in the link register
  MOV pc, lr

.data
  promptInches: .asciz "Enter inches: "
  formatNumber: .asciz "%d"
  inches: .word 0
  output: .asciz "Total feet: %d | Total inches: %d\n"
