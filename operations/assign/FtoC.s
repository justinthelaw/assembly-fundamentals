# Program name: FtoC.s
# Author: Justin Law
# Date: 25 Feb 2023
# Purpose: This program uses ADD, MUL, and __aeabi_idiv to convert from Fahrenheit (F)
#          to Celsius (C), where C = (F - 32) * 5/9
#

.text
.global main

main:
  ldr r0,=prompt
  bl printf
  ldr r0,=fahrenheit
  bl scanf

  ldr r1,=fahrenheit
  ldr r2,[r1]
  sub r2,r2,#32
  mov r3,#5
  mul r2,r2,r3
  mov r3,#9
  sdiv r2,r2,r3

  ldr r0,=output
  ldr r1,=celsius
  str r2,[r1]
  bl printf

  mov r0,#0
  bx lr

.data
  prompt: .asciz "Enter a Fahrenheit temperature: "
  fahrenheit: .word 0
  celsius: .word 0
  output: .asciz "The Celsius temperature is: %d\n"
