#
# Program name: TenTimes.s
# Author: Justin Law
# Date: 25 Feb 2023
# Purpose: This program multiples the input integer by 10 using
#          LSL and ADD
#

.text
.global main

main:
  # Save return address to OS stack
  # Allocate 4 bytes of space on the stack for return address
  SUB sp, sp, #4
  # Store the return address to the top of the stack
  STR lr, [sp]

  ## Prompt the user for a number to multiply
  # Load into register r0 the prompt
  LDR r0, =promptNumber
  # Branch and link to C's printf function
  BL printf

  ## Scan the user's input number into memory
  # Load into register r0 the input temperature format
  LDR r0, =formatNumber
  # Load into register r1 the input's address
  LDR r1, =number
  # Branch and link to C's scanf function
  BL scanf

  ## Conversion
  # Load into register r0 the address of input
  LDR r0, =number
  # Load the value from the address
  LDR r0, [r0]
  # LSL with 3 to achieve input * 8
  LSL r1, r0, #3
  # Add original input to itself
  ADD r0, r0, r0
  # Add double original to LSL result
  ADD r0, r0, r1

  ## Print out the result
  # Move answer in register r0 to r1
  MOV r1, r0
  # Load into register r0 the output format
  LDR r0, =outputNumber
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
  promptNumber: .asciz "Enter an integer: "
  formatNumber: .asciz "%d"
  number: .word 32
  outputNumber: .asciz "The integer * 10 is: %d\n"
