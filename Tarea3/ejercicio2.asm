        org     100h

section .text

        mov CX,5d
        mov AL,1d
        jmp iterar

iterar:
        MUL CX
        LOOP iterar
final:
        mov [20Bh],AL
        int 20h