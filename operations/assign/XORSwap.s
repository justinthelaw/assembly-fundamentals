.text
.global main

main:
  @ initialize registers R1 and R2 with arbitrary values
  MOV R1,#10
  MOV R2,#20
  @ print initial register values
  LDR R0,=INITIAL
  BL printf
  LDR R0,=R1
  LDR R1,[R0]
  LDR R0,=R2
  LDR R2,[R0]
  LDR R0,=OUTPUT
  BL printf
  @ swap R1 and R2 using eor
  EOR R1,R1,R2
  EOR R2,R1,R2
  EOR R1,R1,R2
  @ print final register values
  LDR R0,=FINAL
  BL printf
  LDR R0,=R1
  LDR R1,[R0]
  LDR R0,=R2
  LDR R2,[R0]
  LDR R0,=OUTPUT
  BL printf
  MOV R0,#0
  BX LR

.data
  INITIAL: .asciz "Initial values: R1=%d, R2=%d\n"
  FINAL:   .asciz "Final values:   R1=%d, R2=%d\n"
  OUTPUT:  .asciz "%d\n"