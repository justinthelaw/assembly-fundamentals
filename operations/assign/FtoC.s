#
# Program name: FtoC.s
# Author: Justin Law
# Date: 25 Feb 2023
# Purpose: This program uses ADD, MUL, and __aeabi_idiv to convert from Fahrenheit (F)
#          to Celsius (C), where F = (C * 9/5) + 32
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
  # Load into register 0 the prompt
  LDR r0, =promptFahrenheit
  # Branch and link to C's printf function
  BL printf

  ## Scan the user's input temperature into memory
  # Load into register 0 the temperature format
  LDR r0, =formatTemp
  # Branch and link to C's scanf function
  BL scanf

  ## Perform multiplication first
  LDR r0, [sp, #0]
  LDR r1, #9
  MUL r0, r0, r1

  ## Perform division next
  LDR r0, [sp, #0]
  MOV r1, #5
  BL __aeabi_idiv

  ## Perform addition last
  LDR r0, [sp, #0]
  ADD r0, r0, #32
  MOV r1, r0

  ## Print out the resultant temperature
  LDR r0, =outputCelsius
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
  outputCelsius: .asciz "The temperature in Celsius is: "
  formatTemp: .asciz "%d"