#
# Program name: XORSwap.s
# Author: Justin Law
# Date: 25 Feb 2023
# Purpose: This program swaps 2 register values using XOR
#

.text
.global main

main:
  @ initialize registers r1 and r2 with arbitrary values
  MOV r1,#10
  MOV r2,#20
  @ print initial register values
  LDR r0,=INITIAL
  BL printf
  LDR r0,[r1]
  LDR r1,[r0]
  LDR r0,[r2]
  LDR r2,[r0]
  LDR r0,=OUTPUT
  BL printf
  @ swap r1 and r2 using eor
  EOR r1,r1,r2
  EOR r2,r1,r2
  EOR r1,r1,r2
  @ print final register values
  LDR r0,=FINAL
  BL printf
  LDR r0, [r1]
  LDR r1,[r0]
  LDR r0,[r2]
  LDR r2,[r0]
  LDR r0,=OUTPUT
  BL printf
  MOV r0,#0
  BX LR

.data
  INITIAL: .asciz "Initial values: r1=%d, r2=%d\n"
  FINAL:   .asciz "Final values:   r1=%d, r2=%d\n"
  OUTPUT:  .asciz "%d\n"
