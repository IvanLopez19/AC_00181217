org     100h

section .text

xor DX,DX
call modotexto
mov DH,10d
call asignarvaloraDHydh
call movercursor
mov DX, pnombre
call escribircadena
mov DH,12d
call asignarvaloraDHydh
call movercursor
mov DX,snombre
call escribircadena
mov DH,14d
call asignarvaloraDHydh
call movercursor
mov DX,papellido
call escribircadena
mov DH,16d
call asignarvaloraDHydh
call movercursor
mov DX,sapellido
call escribircadena
call esperartecla
call exit

exit:
        INT 20h

esperartecla:
        MOV AH, 00h
        INT 16h

        ret

asignarvaloraDHydh:

        mov DL, 10d
        RET

modotexto:
        mov AH, 00h
        mov AL, 03h
        INT 10h
        xor AX,AX
        RET

movercursor:
        mov AH, 02h
        mov BH, 0h
        INT 10H
        xor DX,DX
        xor AX,AX
        RET

escribircadena:
        mov AH, 09h
        INT 21h
        xor DX,DX
        xor AX,AX
        RET

section .data

pnombre db "Ivan $"
snombre db "Andres $"
papellido db "Lopez $"
sapellido db "Linares $"