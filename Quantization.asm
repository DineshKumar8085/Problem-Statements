\*Quantization:
In order to convert an analog signal to a digital signal, the 3 steps to be followed are sampling, quantizationand encoding.  
Assume that a sampled signal (consisting of 8 samples in the range 0 to 40) is present.
Write an assembly code to quantize the signal into 4 discrete levels.  
Follow the below scheme.
if (sample >= 0 and sample < 10):
        output 5
else if (sample >= 10 and sample < 20):
        output 15
else if (sample >= 20 and sample < 30):
        output 25
else:
        output 35

// -- DO NOT CHANGE ANYTHING UNTIL THE **** LINE--//
ORG 0H
LJMP MAIN
ORG 100H
MAIN:
CALL QUANT
HERE: SJMP HERE
ORG 130H
// *****************

QUANT:
// ADD YOUR CODE HERE
RET\
END*\




ORG 00H
LJMP MAIN
ORG 100H
MAIN:
CALL QUANT
HERE: SJMP HERE
ORG 130H
QUANT:
MOV R0,#60H
MOV R1,#70H
MOV R2,#00H
LOOP_1:
MOV A,@R0
CLR C
SUBB A,#0AH
JNC LOOP_2
MOV @R1,#05H
SJMP INCRE
LOOP_2:
CLR C
MOV A,@R0
SUBB A,#14H
JNC LOOP_3
MOV @R1,#0FH
SJMP INCRE
LOOP_3:
CLR C
MOV A,@R0
SUBB A,#1EH
JNC LOOP_4
MOV @R1,#19H
SJMP INCRE
LOOP_4:
CLR C
MOV @R1,#23H
INCRE:
INC R2
INC R0
INC R1
CJNE R2,#08H,LOOP_1
	
RET
END
