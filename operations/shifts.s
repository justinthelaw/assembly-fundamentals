
#
# Program name: logic.s
# Author: Justin Law
# Date: 25 Feb 2023
# Purpose: This program demonstrates the usage of LSL and ASR for multiplication and division by factors of 2.
#

.text
.global main

main:
  # Save return address to OS stack
  # Allocate 4 bytes of space on the stack for return address
  SUB sp, sp, #4
  # Store the return address to the top of the stack
  STR lr, [sp]

  ## Left Shift Left to multiplt by factors of 2 (immediate *2)
  # Move the immediate 2 into r0
  MOV r0, #2
  # LSL by 3, which is multiplying the value of 2 by 2^3 (8)
  LSL r0, r0, #3
  # Move the resulting value from register r0 to r1
  MOV r1, r0
  # Load the value format string into register r0
  LDR r0, =lsl
  # Call the printf function
  BL printf

  # Return to OS
  # Restore the return address from the stack to the link register
  LDR lr, [sp]
  # Deallocate the space used by the return address on the stack
  ADD sp, sp, #4
  # Return to the caller by branching to the address in the link register
  MOV pc, lr

.data
  lsl: .asciz "The result of 2 * (2^3) is: %d\n"

