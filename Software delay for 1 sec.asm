;Software delay for 1 second:
;Use the delay subroutine from question 2 in problem set 1 develop a 1 second timer delay. 
;The programshould set the pins P1.4 to P1.7 of Port-1 for about 1 second and then clear these off.
;Write the main routine which should:
 ;     •Set the pins P1.4 to P1.7 of Port-1.
 ;     •Enter a loop which calls the delay routine in each iteration
 ;     •When the loop terminates, Clear the pins P1.4 to P1.7 of Port-1
;Adjust the number of iterations in the main routine loop and the delay count to produce a total delay ofnearly 1 second.





ORG 00H
SJMP MAIN
ORG 030H
MAIN:
    CALL GO
HERE:SJMP HERE
GO:
   MOV P1,#0FH
CALL DELAY
  MOV P1,#00H
  RET
DELAY:

        MOV A,71H
		MOV R3,A
		JNZ DELAY_250
        RET
		DELAY_250:
		L5:MOV R6,#02H
		L4:MOV R5,#0FFH
		L3:MOV R0,#05H
		L2:MOV R1,#00H
		L1:INC R1
		CJNE R1,#0FFH,L1
		DJNZ R0,L2
		DJNZ R5,L3
		DJNZ R6,L4
		DJNZ R3,L5
RET
END
