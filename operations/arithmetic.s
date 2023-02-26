#
# Program name: arithmetic.s
# Author: Justin Law
# Date: 25 Feb 2023
# Purpose: This program demonstrates simple arithmetic using 3-address instructions.
#

.text
.global main

main:
  # Save return address to OS stack
  # Allocate 4 bytes of space on the stack for return address
  SUB sp, sp, #4
  # Store the return address to the top of the stack
  STR lr, [sp]
  
  ## Divide 8 by 2
  # Move the decimal value 8 into register 0
  MOV r0, #8
  # Move the decimal value 2 into register 1
  MOV r1, #2
  # Call the integer division function, which computes r0 / r1 (8 / 2)
  BL __aeabi_idiv
  # Move the result from register r0 to register r1
  MOV r1, r0
  # Load the output format string into register r0
  LDR r0, =div
  # Call the C printf function with the output format string and the result in register r1
  BL printf

  # Return to OS
  # Restore the return address from the stack to the link register
  LDR lr, [sp]
  # Deallocate the space used by the return address on the stack
  ADD sp, sp, #4
  # Return to the caller by branching to the address in the link register
  MOV pc, lr

.data
  div: .asciz "The result of 8 / 2 is: %d\n"
