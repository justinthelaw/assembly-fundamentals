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

  ## Add 4 and 4
  # Move immediate decimal 4 to register r0
  MOV r0, #4
  # Move immediate decimal 4 to register r1
  MOV r1, #4
  # Add the values in r0 and r1 and store the result in r0
  ADD r0, r0, r1
  # Move the result from register r0 to r1
  MOV r1, r0
  # Load the output data format into r1
  LDR r0, =add
  # Call the printf function
  BL printf

  ## Subtract 12 from 16
  # Move the decimal value 16 into register 0
  MOV r0, #16
  # Move the decimal value 12 into register 1
  MOV r1, #12
  # Subtract the value of r1 from r0 and store in r0
  SUB r0, r0, r1
  # Move the result from register r0 to register r1
  MOV r1, r0
  # Load the output format string into register r0
  LDR r0, =sub
  # Call the printf function
  BL printf
  
  ## Multiply 4 by 2
  # Move the decimal value 4 into register 0
  MOV r0, #4
  # Move the decimal value 2 into register 1
  MOV r1, #2
  # Multiply the value of r1 with r0 and store in r0
  MUL r0, r0, r1
  # Move the result from register r0 to register r1
  MOV r1, r0
  # Load the output format string into register r0
  LDR r0, =multi
  # Call the printf function
  BL printf

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
  add: .asciz "The result of 4 + 4 is: %d\n"
  sub: .asciz "The result of 16 - 12 is: %d\n"
  multi: .asciz "The result of 4 * 2 is: %d\n"
  div: .asciz "The result of 8 / 2 is: %d\n"
