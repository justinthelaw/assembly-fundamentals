#
# Program name: logic.s
# Author: Justin Law
# Date: 25 Feb 2023
# Purpose: This program demonstrates the usage of AND, OR, XOR, and BIC logical operators.
#

.text
.global main

main:
  # Save return address to OS stack
  # Allocate 4 bytes of space on the stack for return address
  SUB sp, sp, #4
  # Store the return address to the top of the stack
  STR lr, [sp]

  ## Bitmask "B" to "b" (toLowercase)
  # Move the ASCII value B into register 0
  MOV r0, #0x42
  # Move the bit mask for toLowercase 0x20 into register 1
  MOV r1, #0x20
  # Use the OR operation to perform toLowercase bitmask
  ORR r0, r0, r1
  # Load the value format string into register r0
  LDR r0, =format
  # Load the output format string into register r1
  LDR r1, =or
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
  format: .asciz "%s"
  or: .asciz "The lowercase of B is: %s\n"

