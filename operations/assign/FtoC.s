# Program name: FtoC.s
# Author: Justin Law
# Date: 25 Feb 2023
# Purpose: This program uses ADD, MUL, and __aeabi_idiv to convert from Fahrenheit (F)
#          to Celsius (C), where C = (F - 32) * 5/9
#

.text
.global main

main:
  # Save return address to OS stack
  # Allocate 4 bytes of space on the stack for return address
  SUB sp, sp, #4
  # Store the return address to the top of the stack
  STR lr, [sp]

  ## Prompt the user for a temperature to convert
  # Load into register r0 the prompt
  LDR r0, =promptFahrenheit
  # Branch and link to C's printf function
  BL printf

  ## Scan the user's input temperature into memory
  # Load into register r0 the input temperature format
  LDR r0, =formatTemp
  # Load into register r1 the number format
  LDR r1, =numberTemp
  # Branch and link to C's scanf function
  BL scanf

  ## Conversion
  # Subtract 32 from the input temperature
  MOV r2, #32
  MOV r1, [r1, #0]
  SUB r1, r1, r2
  # Multiply the result by 5
  MOV r2, #5
  MUL r1, r1, r2
  # Divide the result by 9 using division function
  MOV r0, r1
  MOV r1, #9
  BL __aeabi_idiv
  # Move the result of the division back into r0
  MOV r0, r1

  ## Print out the resultant temperature
  # Load into register r0 the output format
  LDR r0, =outputCelsius
  # Load into the register r1 the number format
  LDR r1, =numberTemp
  # Load value into the address
  LDR r1, [r1]
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
  promptFahrenheit: .asciz "Enter a temperature in Fahrenheit: "
  formatTemp: .asciz "%d"
  numberTemp: .word 32
  outputCelsius: .asciz "The temperature in Celsius is: %d\n"
