.MODEL small
.RADIX 16
.STACK
.DATA
esquina1                db      0c9, "$"
esquina2                db      0bb, "$"
esquina3                db      0c8, "$"
esquina4                db      0bc, "$"
lateral1                db      0cc, "$"
lateral2                db      0b9, "$"
lineas                  db      30 dup (0cd), "$"
universidad             db      0ba, " Universidad de San Carlos de Guatemala         ", 0ba, 0a, "$"
facultad                db      0ba, " Facultad de Ingenieria                         ", 0ba, 0a, "$"
curso                   db      0ba, " Arquitectura de Computadoras y Ensambladores 1 ", 0ba, 0a, "$"
seccion                 db      0ba, " Seccion A                                      ", 0ba, 0a, "$"
semestre                db      0ba, " Segundo Semestre 2023                          ", 0ba, 0a, "$"
nombre                  db      0ba, " Nombre: Brandon Andy Jefferson Tejaxun Pichiya ", 0ba, 0a, "$"
carnet                  db      0ba, " Carne: 202112030                               ", 0ba, 0a, "$"
menu0                   db      "  Elija una opcion:",0a, "  1. Cargar Archivo",0a, "  2. Modo Calculadora",0a, "  3. Factorial",0a, "  4. Crear Reporte",0a, "  5. Salir",0a, "$"
nl                      db      0a,"$"
input_num1              db      0a, "Operando: $"
resultado_suma          db      0a, "La suma es: $"
seleccionar_op          db      0a, "Ingrese el Operador (+, -, *, /, =)$"
error_signo             db      0a, "Operador invalido$"
numero_invalido         db      0a, "Numero Invalido [-99, 99]$"
resultado_label         db      02 dup (0a), "RESULTADO = $"
suma_label              db      02 dup (0a), "SUMA$"
resta_label             db      02 dup (0a), "RESTA$"
multiplicacion_label    db      02 dup (0a), "MULTIPLICACION$"
division_label          db      02 dup (0a), "DIVISION$"
buffer_num1             db      03 dup (00)
cadena_num              db      03 dup (30)
n_num1                  dw      00
n_resultado             dw      00
buffer_entrada          db      21, 00
                        db      21 dup (00)
.CODE
.STARTUP

print macro texto
        mov DX, offset texto
        mov AH, 09
        int 21
endm

stoi macro numero, cadena
	local convertir, terminate
		mov DI, offset cadena
		mov AX, 0000              ; INICIALIZAR LA SALIDA
		mov CX, 0005
	convertir:
		mov BL, [DI]
		cmp BL, 00
		je terminate
		sub BL, 30                ; BL VALOR NUMÉRICO DEL CARACTER
		mov DX, 000a              ; DX VALOR 10 (000A)
		mul DX                    ; AX * DX : SIEMPRE MUL MULTIPLICA EL OPERANDO POR AX
                mov BH, 00
		add AX, BX                ; AX += BX
		inc DI                    ; AVANZA PUNTERO EN LA CADENA
		loop convertir
	terminate:
		mov [numero], AX
endm

toString macro cadena, numero
	local ciclo, cicloConvertir, aumentos, aumentarSiguiente, terminate
		mov AX, [numero]
		mov CX, 0005              ; INICIALIZAR CONTADOR
		mov DI, offset cadena
	ciclo:
		mov BL, 30 
		mov [DI], BL
		inc DI
		loop ciclo
		; TENEMOS '0' EN TODA LA CADENA
		mov CX, AX                ; INICIALIZAR CONTADOR
		mov DI, offset cadena
		add DI, 0004
		;
	cicloConvertir:
		mov BL, [DI]
		inc BL
		mov [DI], BL
		cmp BL, 3a
		je aumentos
		loop cicloConvertir
		jmp terminate
	aumentos:
		push DI
	aumentarSiguiente:
		mov BL, 30                ; PONER EN '0' EL ACTUAL
		mov [DI], BL
		dec DI
		mov BL, [DI]
		inc BL
		mov [DI], BL
		cmp BL, 3a
		je aumentarSiguiente
		pop DI
		loop cicloConvertir
	terminate:
endm

memcpy macro campo, buffer
	local aceptarCampo, copiarCampoAEstructura
	aceptarCampo:
		mov SI, offset campo
		mov DI, offset buffer
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI                   ; CONTENIDO EN EL BUFFER
	copiarCampoAEstructura:
		mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiarCampoAEstructura
endm

memset macro campo, longitud
	local ciclo, terminate
		mov DI, offset campo
		mov CX, longitud
	ciclo:
		mov AL, 00
		mov [DI], AL
		inc DI
		loop ciclo
endm

inicio:
        print esquina1
        print lineas
        print esquina2
        print nl
        print universidad
        print facultad
        print curso
        print seccion
        print semestre
        print lateral1
        print lineas
        print lateral2
        print nl
        print nombre
        print carnet
        print esquina3
        print lineas
        print esquina4
        print nl

menuPrincipal:
        ;;
        print nl
        print menu0
        ;;
pedir_entrada:
        ;; PULSACIÓN DE TECLA
        mov AH, 08
        int 21

        cmp AL, '2'
        je calculadora
        cmp AL, '5'
        je fin
        jmp pedir_entrada
calculadora:
pedir_operando:
        print input_num1
        ;; GUARDAR ENTRADA EN BUFFER
        mov DX, offset buffer_entrada
        mov AH, 0a
        int 21
        ;; GUARDAR EN N_NUM
        memcpy buffer_num1, buffer_entrada
        ;; CADENA A NUMERO
        stoi n_num1, buffer_num1
        ;; LIMPIAR BUFFER
        memset buffer_num1, 03
        ;; VALIDAR NUMERO MENOR QUE 100
        cmp n_num1, 63 ;; 63 = 99h
        jle guardar_primer_operando
        print numero_invalido
        jmp pedir_operando
guardar_primer_operando:
        mov SI, n_resultado
        add SI, n_num1
        mov n_resultado, SI
eleccion_operacion:
        print nl
        print seleccionar_op
        ;; ELEGIR OPERACIÓN
        mov AH, 08
        int 21
        ;; MENÚ DE OPERACIONES
        cmp AL, '+'
        je sumar
        cmp AL, '-'
        je restar
        cmp AL, '*'
        je multiplicar
        cmp AL, '/'
        je dividir
        cmp AL, '='
        je mostrarResultado
        print error_signo
        jmp eleccion_operacion
sumar:
        print suma_label
        print input_num1
        ;; GUARDAR ENTRADA EN BUFFER
        mov DX, offset buffer_entrada
        mov AH, 0a
        int 21
        ;; GUARDAR EN N_NUM
        memcpy buffer_num1, buffer_entrada
        ;; CADENA A NUMERO
        stoi n_num1, buffer_num1
        ;; LIMPIAR BUFFER
        memset buffer_num1, 03
        ;; VALIDAR NUMERO MENOR QUE 100
        cmp n_num1, 63 ;; 63 = 99h
        jle hacer_suma
        print nl
        print numero_invalido
        jmp sumar
hacer_suma:
        mov SI, n_resultado
        add SI, n_num1
        mov n_resultado, SI
        jmp eleccion_operacion
restar:
        print resta_label
        print input_num1
        ;; GUARDAR ENTRADA EN BUFFER
        mov DX, offset buffer_entrada
        mov AH, 0a
        int 21
        ;; GUARDAR EN N_NUM
        memcpy buffer_num1, buffer_entrada
        ;; CADENA A NUMERO
        stoi n_num1, buffer_num1
        ;; LIMPIAR BUFFER
        memset buffer_num1, 03
        ;; VALIDAR NUMERO MENOR QUE 100
        cmp n_num1, 63 ;; 63 = 99h
        jle hacer_resta
        print nl
        print numero_invalido
        jmp restar
hacer_resta:
        mov SI, n_resultado
        sub SI, n_num1
        mov n_resultado, SI
        jmp eleccion_operacion
multiplicar:
        print multiplicacion_label
        print input_num1
        ;; GUARDAR ENTRADA EN BUFFER
        mov DX, offset buffer_entrada
        mov AH, 0a
        int 21
        ;; GUARDAR EN N_NUM
        memcpy buffer_num1, buffer_entrada
        ;; CADENA A NUMERO
        stoi n_num1, buffer_num1
        ;; LIMPIAR BUFFER
        memset buffer_num1, 03
        ;; VALIDAR NUMERO MENOR QUE 100
        cmp n_num1, 63 ;; 63 = 99h
        jle hacer_multiplicacion
        print nl
        print numero_invalido
        jmp multiplicar
hacer_multiplicacion:
        mov AX, n_resultado
        mov DX, n_num1
        imul DX
        mov n_resultado, AX
        jmp eleccion_operacion
dividir:
        print division_label
        print input_num1
        ;; GUARDAR ENTRADA EN BUFFER
        mov DX, offset buffer_entrada
        mov AH, 0a
        int 21
        ;; GUARDAR EN N_NUM
        memcpy buffer_num1, buffer_entrada
        ;; CADENA A NUMERO
        stoi n_num1, buffer_num1
        ;; LIMPIAR BUFFER
        memset buffer_num1, 03
        ;; VALIDAR NUMERO MENOR QUE 100
        cmp n_num1, 63 ;; 63 = 99h
        jle hacer_division
        print nl
        print numero_invalido
        jmp dividir
hacer_division:
        mov AX, n_resultado
        mov BX, n_num1
        xor DX, DX
        idiv BX
        mov n_resultado, AX
        jmp eleccion_operacion
mostrarResultado:
        print resultado_label
        toString cadena_num, n_resultado
        mov BX, 0001
	mov CX, 0005
	mov DX, offset cadena_num
	mov AH, 40
	int 21
        print nl
        mov n_resultado, 00
        jmp menuPrincipal
fin:
.EXIT
END
