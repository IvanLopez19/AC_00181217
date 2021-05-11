        org     100h

section .text

        xor DI,DI

        mov byte[200h],0d
        mov byte[201h],0d
        mov byte[202h],1d
        mov byte[203h],8d
        mov byte[204h],1d
        mov byte[205h],2d
        mov byte[206h],1d
        mov byte[207h],7d

        mov CX,8d
        mov BX,8d
        mov AX,0d

        jmp iterar

iterar:
        ADD AL,[200h+DI]
        INC DI
        LOOP iterar
final:
        DIV BX
        mov byte[20Ah],AL
        int 20h