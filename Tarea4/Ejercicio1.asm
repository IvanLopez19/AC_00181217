        org     100h

        section .text
        xor SI,SI
        mov SI,0h
        mov DI,20h
        CALL Funcion

        int 20h

        section .data

        numeros db 1,2,3,4,5,6,7,8,9,10,0xA

Funcion:
        mov CX,[numeros]
        mov AL,[numeros]
        inc numeros
        cmp CX,0xA
        je salir
        div 2
        jz par
        jmp impar
par:
        mov[300h + SI],CX
        inc SI
        jmp Funcion
impar:
        mov[300h + DI],CX
        inc DI
        jmp Funcion
salir:
        ret
