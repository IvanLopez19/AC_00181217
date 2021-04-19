        org     100h

        section .text

        mov     byte [200h], "I"
        mov     byte [201h], "A"
        mov     byte [202h], "L"
        mov     byte [203h], "L"
        mov     BX, [201h]
        mov     SI, [001h]

        ;Direccionamiento Directo

        mov     AX, [200h]

        ;Direccionamiento Indirecto por registro

        mov     CX, [BX]

        ;Direccionamiento Indirecto base mas indice

        mov     DX, [BX+SI]

        ;Direccionamiento Relativo por registro

        mov     DI, [SI+202h]

        int     20h