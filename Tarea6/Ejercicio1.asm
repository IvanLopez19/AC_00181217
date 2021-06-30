
	org     100h

	section	.text

        xor AX, AX
        xor SI, SI
        xor BX, BX
        XOR CX, CX
        xor DX, DX
        xor BP, BP

        MOV SI, 0
        MOV DI, 0d
        call    modotexto
        call    movercursor
        call    escribirMensaje
        call    movercursordos
	call 	LeerCadena
        call    movercursortres
	call	Compararcontra
        
	call 	EsperarTecla
        
        int 20h
	

	section	.data

msg1    db      "cinco$"
msg2	db	"Ingrese su password ", "$"
msg3 	db 	"BIENVENIDO", "$"
msg4    db      "INCORRECTO" , "$"
frase 	times 	20  	db	" " 

; Funciones

modotexto: 
        MOV AH, 0h
        MOV AL, 03h
        INT 10h
        RET

movercursor:
        MOV AH, 02h
        MOV DH, 10
        MOV DL, 20
        MOV BH, 0h
        INT 10h
        RET
movercursordos:
        MOV AH, 02h
        MOV DH, 12
        MOV DL, 20
        MOV BH, 0h
        INT 10h
        RET
movercursortres:
        MOV AH, 02h
        MOV DH, 14
        MOV DL, 20
        MOV BH, 0h
        INT 10h
        RET
escribirMensaje: ;utilizando interrupcion DOS
        MOV AH, 09h
        MOV DX, msg2
        INT 21h
        RET

escribircadena: ;utilizando interrupcion DOS
        MOV AH, 09h
        MOV DX, BP
        INT 21h
        RET


EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret


LeerCadena:
        xor     SI, SI
while:  
        call    EsperarTecla 
        cmp     AL, 0x0D 
        je      exit      
        mov     [BP+SI], AL  
        inc     SI    
        jmp     while
exit:
	mov 	byte [BP+SI], "$"
        ret


Compararcontra:
       
       mov     AL, [BP]
       mov     BL, [msg1]
       cmp     AL,BL
       je      welcome
       jmp     fail


welcome:
        
        MOV AH, 09h
        MOV DX, msg3
        INT 21h
        RET

fail:
        
        MOV AH, 09h
        MOV DX, msg4
        INT 21h
        RET