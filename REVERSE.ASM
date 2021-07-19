ASSUME CS:CODE,DS:DATA
DATA SEGMENT
    STRING DB "abcdefghijklmn$"
    STRLEN EQU ($-STRING)
DATA ENDS

CODE SEGMENT
    START:
        MOV AX,DATA
        MOV DS,AX
        MOV AX,STRLEN
        MOV BL,02H
        DIV BL
        MOV SI,OFFSET STRING
        MOV DI,OFFSET STRING
        ADD DI,STRLEN-1
    BACK:
        XCHG [SI],AH
        XCHG [DI],AH
        XCHG [SI],AH
        DEC DI
        INC SI
        DEC AL
        JNZ BACK
        INT 03H
CODE ENDS
    END START
