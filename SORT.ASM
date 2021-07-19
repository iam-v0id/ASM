ASSUME CS: CODE, DS: DATA
DATA SEGMENT
    LIST DW 02H,10H, 01H, 04H, 03H 
    COUNT EQU 05H
DATA ENDS
CODE SEGMENT
    START:
        MOV AX, DATA
        MOV DS, AX
        MOV CH, COUNT-1
    Bck2:
        MOV SI, OFFSET LIST
        MOV CL, COUNT-1
    Bck1:
        MOV AX, [SI]
        MOV BX, [SI+02H]
        CMP AX, BX
        JC Skip   ; JNC for Descending Order
        MOV [SI], BX
        MOV [SI+2], AX
    Skip:
        ADD SI,02H
        DEC CL
        JNZ Bck1
        DEC CH
        JNZ Bck2
        INT 03H
CODE ENDS
    END START
