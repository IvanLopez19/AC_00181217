        org     100h

section .text

        mov CX,5d
        mov AX,1d
        jmp iterar

iterar:
        MUL CX
        LOOP iterar
final:
        mov [20Bh],AX
        int 20h