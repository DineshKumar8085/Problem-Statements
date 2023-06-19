/*Write an assembly language program to add two 16-bit numbers x and y.Use the following program as a starting point.  Add your code in the ADD16 subroutine.
// – DO NOT CHANGE ANYTHING UNTIL THE **** LINE //

ORG 00H
LJMP MAIN
ORG 100H
MAIN:
CALL ADD16
HERE:
SJMP HERE
ORG 130H

// *****************

ADD16:

// ADD YOUR CODE HERE
RET
END

->The numberxis stored at locations 60H and 61H, with its most significant byte (MSB) in 60H andthe least significant byte in 61H.
->The numberyis stored at locations 62H (MSB) and 63H (LSB).
->Since the resultz = x + ycan be 17 bits long, store the result in memory locations 64H, 65H, 66H
->Forz=z16z15z14...z3z2z1z0, wherez0is the least significant bit andz16is the most significant bit,the memory location 64H should have 0000000z16,  the memory location 65H should have the bitsz15z14...z8, and the memory location 66H should have the bitsz7z6...z0.*/


ORG 00H                ;Origin Address of the program
LJMP MAIN              ;jump to main program
ORG 100H               ;starting the address from 100H
MAIN:                  
ACALL ADD16            ;calling the ADD16 function to execute
HERE:
SJMP HERE
ORG 130H               ;starting the address from 130H
ADD16:                 ;program for ADD16 function 
CLR C                  ;clear the carry bit
MOV A,61H              ;moving the content of 61H into accumulator register
ADD A,63H              ;adding the content of 63H and accumulator register
MOV 65H,A              ;moving the result of addition(accumulator) to 65H address 
MOV  A,60H             ;moving the content of 60H to accumulator register
ADDC A,62H             ;adding the content of 62H to accumulator register with carry
MOV 64H,A              ;moving the content of accumulator registor to 64H address
MOV A,#00H             ;clearing the accumulator
ADDC A,#00H            ;adding the accumulator with carry
MOV 66H,A              ;moving the content of accumulator into 66H address
RET                    ;return the program
END                    ;end the program
