ASSUME CS:CODE,DS:DATA,ES:EXTRA
DATA SEGMENT
        STRING1 DB 'CMRCET  1$'
        STRLEN EQU ($-STRING1) 
        UNEQUAL DB 'STRINGS ARE UNEQUAL$'
        EQUAL DB 'STRINGS ARE EQUAL$'
DATA ENDS

EXTRA SEGMENT
        STRING2 DB 'CMRCET  1$'
EXTRA ENDS

CODE SEGMENT
        START:
                MOV AX,DATA
                MOV DS,AX
                MOV AX,EXTRA
                MOV ES,AX
                MOV CX,STRLEN
                CLD
                MOV SI,OFFSET STRING1
                MOV DI,OFFSET STRING2
                REP CMPSB
                JZ SKIP
                MOV AH,09H
                MOV DX,OFFSET UNEQUAL
                INT 21H
                INT 03H
        SKIP:
                MOV AH,09H
                MOV DX,OFFSET EQUAL
                INT 21H
                INT 03H
CODE ENDS
        END START

