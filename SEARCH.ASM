ASSUME CS:CODE,DS:DATA ,ES:EXTRA
DATA SEGMENT
      ENTER DB "ENTER A CHARACTER:$"
      FOUND DB "FOUND$"
      NOTFOUND DB "NOT FOUND$"
DATA ENDS

EXTRA SEGMENT
      STRING DB "CMRCET$"
      STRLEN DW ($-STRING)
EXTRA ENDS

CODE SEGMENT
      START:
            MOV AX,DATA
            MOV DS,AX
            MOV AX,EXTRA
            MOV ES,AX
            MOV CX,STRLEN
            MOV DX,OFFSET ENTER
            MOV AH,09H
            INT 21H
            MOV AH,08H
            INT 21H
            REPNE SCASB
            JZ SKIP
            MOV DX,OFFSET NOTFOUND
            MOV AH,09H
            INT 21H
            INT 03H
      SKIP:
            MOV DX,OFFSET FOUND
            MOV AH,09H
            INT 21H
            MOV AH,4CH
            INT 03H
CODE ENDS
      END START
