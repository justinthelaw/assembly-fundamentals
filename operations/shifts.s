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

  ## Bitmask "a" to "A" (toUppercase) using AND complement through BIC
  # Move the ASCII value a into register 0
  MOV r0, #0x61
  # Move the bit mask for toLowercase 0x20 into register 1
  MOV r1, #0x20
  # Use the AND operation to perform toUppercase bitmask
  BIC r0, r0, r1
  # Move the resulting value to register r1 from r0  
  MOV r1, r0
  # Load the value format string into register r0
  LDR r0, =and
  # Call the printf function
  BL printf

  ## Bitmask "B" to "b" (toLowercase) using OR
  # Move the ASCII value B into register 0
  MOV r0, #0x42
  # Move the bit mask for toLowercase 0x20 into register 1
  MOV r1, #0x20
  # Use the OR operation to perform toLowercase bitmask
  ORR r0, r0, r1
  # Move the resulting value to register r1 from r0  
  MOV r1, r0
  # Load the value format string into register r0
  LDR r0, =or
  # Call the printf function
  BL printf

  ## XOR (EOR) of a 1 and 1 is 0
  # Move the ASCII value 1 into register 0
  MOV r0, #0x1
   # Use the EOR operation
  EOR r1, r0, #0x1
  # Load the value format string into register r0
  LDR r0, =log
  # Call the printf function
  BL printf

  ## AND of a 1 and 1 is 1
  # Move the ASCII value 1 into register 0
  MOV r0, #0x1
   # Use the AND operation
  AND r1, r0, #0x1
  # Load the value format string into register r0
  LDR r0, =log
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
  and: .asciz "The uppercase of a is: %c\n"
  or: .asciz "The lowercase of B is: %c\n"
  log: .asciz "The result of 1 and 1 is: %d\n "
