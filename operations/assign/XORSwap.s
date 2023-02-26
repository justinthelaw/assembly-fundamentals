#
# Program name: XORSwap.s
# Author: Justin Law
# Date: 25 Feb 2023
# Purpose: This program swaps 2 register values using XOR(EOR)
#

.text
.global main

main:

  # Save return address to OS stack
  # Allocate 4 bytes of space on the stack for return address
  SUB sp, sp, #4
  # Store the return address to the top of the stack
  STR lr, [sp]

  # Initialize registers r1 and r2 with arbitrary values
  MOV r1, #10
  MOV r2, #20
  # Print initial register values
  LDR r0, =initial
  BL printf
  # Swap r1 and r2 using EOR
  EOR r1, r1, r2
  EOR r1, r1, r2
  EOR r2, r2, r1
  # Print final register values
  LDR r0, =final
  BL printf

  # Return to OS
  # Restore the return address from the stack to the link register
  LDR lr, [sp]
  # Deallocate the space used by the return address on the stack
  ADD sp, sp, #4
  # Return to the caller by branching to the address in the link register
  MOV pc, lr

.data
  initial: .asciz "Initial values: r1=%d, r2=%d\n"
  final: .asciz "Final values: r1=%d, r2=%d\n"
  output: .asciz "%d\n"
