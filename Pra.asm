.MODEL small
.RADIX 16
ficha_a  equ 'O'
ficha_b  equ 'X'
.STACK
.DATA
esquina1                    db      0c9, "$"
esquina2                    db      0bb, "$"
esquina3                    db      0c8, "$"
esquina4                    db      0bc, "$"
lateral1                    db      0cc, "$"
lateral2                    db      0b9, "$"
lineas                      db      30 dup (0cd), "$"
universidad                 db      0ba, " Universidad de San Carlos de Guatemala         ", 0ba, 0a, "$"
facultad                    db      0ba, " Facultad de Ingenieria                         ", 0ba, 0a, "$"
curso                       db      0ba, " Arquitectura de Computadoras y Ensambladores 1 ", 0ba, 0a, "$"
seccion                     db      0ba, " Seccion A                                      ", 0ba, 0a, "$"
semestre                    db      0ba, " Segundo Semestre 2023                          ", 0ba, 0a, "$"
nombre                      db      0ba, " Nombre: Brandon Andy Jefferson Tejaxun Pichiya ", 0ba, 0a, "$"
carnet                      db      0ba, " Carne: 202112030                               ", 0ba, 0a, "$"
menu0                       db      "  Elija una opcion:",0a, "  1. Jugar",0a, "  2. Cargar",0a, "  3. Salir",0a,"$"
mensaje_nombre_a            db      "  Escriba el nombre del jugador 1: $"
mensaje_nombre_b            db      "  Escriba el nombre del jugador 2: $"
nl                          db      0a,"$"
mensaje_jugar               db      "  Ingrese la columna: $"
mensaje_ganador1            db      "  ", 0ad, "FELICIDADES!", 0a, "$"
mensaje_ganador2            db      "  ", 0ad, "GANA", "$"
mensaje_otra_vez_columna    db      "  ", 0ad, "INTENTA CON OTRA COLUMNA!", 0a, "$"
mensaje_fin_sin_ganador     db      "  ", 0ad, "PARTIDA TERMINADA SIN GANADOR!", 0a, "$"
presionar_enter             db      "  Presione 'Enter' para continuar...$"
buffer_nombre               db      20,00
                            db      20 dup (00)
nombre_a                    db      00
                            db      20 dup (00)
nombre_b                    db      00
                            db      20 dup (00)
dirs                        db      0a, 0b, 0b, 0a, 0b, 0b, 0b, 09
tablero                     db      2a dup (00)
encabezado_tablero          db      "    A   S   D   F   J   K   L  ",0a
                            db      "  ", 0c9, 03 dup(0cd), 0cb, 03 dup(0cd), 0cb, 03 dup(0cd), 0cb, 03 dup(0cd), 0cb, 03 dup(0cd), 0cb, 03 dup(0cd), 0cb, 03 dup(0cd), 0bb, 0a,"$"
antes_de_fila  	            db      "  ", 0ba," $"
entre_columnas 	            db      " ", 0ba, " $"
entre_filas                 db      "  ", 0cc, 03 dup(0cd), 0ce, 03 dup(0cd), 0ce, 03 dup(0cd), 0ce, 03 dup(0cd), 0ce, 03 dup(0cd), 0ce, 03 dup(0cd), 0ce, 03 dup(0cd), 0b9, 0a,"$"
pie_de_tablero              db      "  ", 0c8, 03 dup(0cd), 0ca, 03 dup(0cd), 0ca, 03 dup(0cd), 0ca, 03 dup(0cd), 0ca, 03 dup(0cd), 0ca, 03 dup(0cd), 0ca, 03 dup(0cd), 0bc, 0a,"$"
ficha_actual                db      ficha_a
c_numero                    db      03 dup (30)
.CODE
.STARTUP
print macro texto
	mov DX, offset texto
	mov AH, 09
	int 21
endm

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
		print presionar_enter
pedir_presionar_enter:
		mov AH, 00
		int 16
		cmp AL, 0d
		je menuPrincipal
		jmp pedir_presionar_enter
menuPrincipal:
		;;
		print nl
		print menu0
		;;
pedir_entrada:
		mov AH, 08
		int 21
		;;
		cmp AL, '1'
		je jugar
		cmp AL, '3'
		je fin
		jmp pedir_entrada
		;; - Pedir nombres [OK]
jugar:
		print nl

		print mensaje_nombre_a
		print offset buffer_nombre
		;; leímos la cadena
		mov DI, offset nombre_a
		call copiar_cadena
		;;
		print nl
		;;
		print offset mensaje_nombre_b
		print offset buffer_nombre
		mov AH, 0a
		int 21
		;;
		mov DI, offset nombre_b
		call copiar_cadena
		;;
		print nl

		print nl

		call imprimir_tablero

		print nl
		;;; imprimir el primer nombre
		;
		;
		;mov BX, 0001
		;mov CX, 0000
		;mov CL, [nombre_a]
		;mov DI, offset nombre_a
		;inc DI
		;mov DX, DI
		;mov AH, 40
		;int 21
		;mov DX, offset nl
		;mov AH, 09
		;int 21
		;;; imprimir el segundo nombre
		;mov BX, 0001
		;mov CX, 0000
		;mov CL, [nombre_b]
		;mov DI, offset nombre_b
		;inc DI
		;mov DX, DI
		;mov AH, 40
		;int 21
		;mov DX, offset nl
		;mov AH, 09
		;int 21
		;
		;
		;; - Poner en columna [OK]
pedir_columna:
		print mensaje_jugar
pedir_entrada_columna:
		mov AH, 01
		int 21
		;; AL -> columna
		call pasar_de_id_a_numero
		;; AL -> número de columna
		call buscar_vacio_en_columna
		;; DL -> 00 si se logró encontrar un espacio
		cmp DL, 00
		je continuar_jugada
mensaje_otravez:
		print nl
		print nl
		print mensaje_otra_vez_columna
		print nl
		call imprimir_tablero
		print nl
		jmp pedir_columna
continuar_jugada:
		;; DI -> dirección de la celda disponible
		;; Se coloca ficha
		mov AL, ficha_actual
		mov [DI], AL
		;;
		print nl
		;; - Imprimir tablero [OK]
		print nl
		call imprimir_tablero
		print nl
		;; VALIDAR TABLERO LLENO
		call validar_tablero_lleno
		cmp AL, 01
		je continuar_despues_validacion
final_partida_sin_ganador:
		print mensaje_fin_sin_ganador
		print nl
		call limpiar_tablero
		jmp menuPrincipal
		;;
continuar_despues_validacion:
		call validar_4_en_linea
		cmp AL, 00
		je continuar_jugando
		print mensaje_ganador1
		print ficha_actual
		mov DL, '!'
		mov AH, 02
		int 21
		print nl
		jmp menuPrincipal
continuar_jugando:
		;; - Cambiar turno
		mov AL, [ficha_actual]
		cmp AL, ficha_a
		je cambiar_a_por_b
		;;
		mov AL, ficha_a
		mov [ficha_actual], AL
		jmp pedir_columna
cambiar_a_por_b:
		mov AL, ficha_b
		mov [ficha_actual], AL
		jmp pedir_columna
		;; - Guardar tablero
		;; - Cargar tablero
		jmp fin
;;
;; copiar_cadena - copia una cadena
;;    ENTRADAS: DI -> dirección hacia donde guardar
copiar_cadena:
		;; DI tengo ^
		mov SI, offset buffer_nombre
		inc SI
		mov AL, [SI]
		mov [DI], AL
		inc SI   ;; moverme a los bytes de la cadena
		inc DI   ;; para guardar esos bytes en el lugar correcto
		;;
		mov CX, 0000  ;; limpiando CX
		mov CL, AL
ciclo_copiar_cadena:
		mov AL, [SI]
		mov [DI], AL
		inc SI
		inc DI
		loop ciclo_copiar_cadena
		ret
;;
;; pasar_de_id_a_numero - pasa de un id de columna a un número
;;
;; SALIDA:  AL -> número de columna o coordenada X
pasar_de_id_a_numero:
		cmp AL, 'a'
		je retornar_num0
		cmp AL, 'A'
		je retornar_num0
		cmp AL, 's'
		je retornar_num1
		cmp AL, 'S'
		je retornar_num1
		cmp AL, 'd'
		je retornar_num2
		cmp AL, 'D'
		je retornar_num2
		cmp AL, 'f'
		je retornar_num3
		cmp AL, 'F'
		je retornar_num3
		cmp AL, 'j'
		je retornar_num4
		cmp AL, 'J'
		je retornar_num4
		cmp AL, 'k'
		je retornar_num5
		cmp AL, 'K'
		je retornar_num5
		cmp AL, 'l'
		je retornar_num6
		cmp AL, 'L'
		je retornar_num6
		jmp pedir_entrada_columna
retornar_num0:
		mov AL, 00
		ret
retornar_num1:
		mov AL, 01
		ret
retornar_num2:
		mov AL, 02
		ret
retornar_num3:
		mov AL, 03
		ret
retornar_num4:
		mov AL, 04
		ret
retornar_num5:
		mov AL, 05
		ret
retornar_num6:
		mov AL, 06
		ret

;; LIMPIAR TABLERO
limpiar_tablero:
		mov SI, offset tablero
		mov CX, 2a
		mov AL, 00
bucle_limpiar_tablero:
		mov [SI], AL
		inc SI
		dec CX
		jnz bucle_limpiar_tablero
		ret

;; VALIDACIÓN DE TABLERO LLENO
validar_tablero_lleno:
		mov SI, offset tablero
		mov CX, 2a
bucle_validar_tablero_lleno:
		mov AL, [SI]
		cmp AL, 00
		je validar_tablero_true
		inc SI
		dec CX
		jnz bucle_validar_tablero_lleno
		mov AL, 00
		ret
validar_tablero_true:
		mov AL, 01
		ret

;; VALIDAR 4 FICHAS
validar_4_en_linea:
		;; CL FILAS
		;; SI COLUMNAS
		mov CL, 00
bucle_fila_validar:
		mov SI, 00
bucle_columna_validar:
		mov BL, CL
		mov BH, [SI]
		mov DH, 00
		mov DL, 01
		call validar_conexion_4

		cmp AL, 01
		je validar_4_en_linea_true

		mov BL, CL
		mov BH, [SI]
		mov DH, 01
		mov DL, 00
		call validar_conexion_4

		cmp AL, 01
		je validar_4_en_linea_true

		mov BL, CL
		mov BH, [SI]
		mov DH, 01
		mov DL, 01
		call validar_conexion_4

		cmp AL, 01
		je validar_4_en_linea_true

		mov BL, CL
		mov BH, [SI]
		mov DH, 01
		mov DL, -01
		call validar_conexion_4

		cmp AL, 01
		je validar_4_en_linea_true

		;; incrementa columnas
		inc SI

		cmp SI, 07
		jl bucle_columna_validar

		;; incrementa filas
		inc CL

		cmp CL, 06
		jl bucle_fila_validar
		mov AL, 00
		ret
validar_4_en_linea_true:
		mov AL, 01
		ret

;; VALIDACION EN UNA DIRECCION
;; ENTRADA:	BL -> FILA              (row)
;;			BH -> COLUMNA           (col)
;;			DH -> VARIACION FILA    (dr)
;;			DL -> VARIACION COLUMNA (dc)
validar_conexion_4:
		mov CH, 00 ;; i
bucle_validar_conexion_4:
		;; AL = dr * i
		mov AL, DH
		mul CH
		;; AL = AL + row
		add AL, BL

		cmp AL, 00
		jl validacion_conexion_4_false

		cmp AL, 06
		jge validacion_conexion_4_false

		;; guardar AH (r)
		mov AH, AL

		;; AL = dc * i
		mov AL, DL
		mul CH
		;; AL = AL + col
		add AL, BH

		cmp AL, 00
		jl validacion_conexion_4_false

		cmp AL, 07
		jge validacion_conexion_4_false

		;; DH (c)
		mov DH, AL

		;; rowmajor
		;; indice = fila + columna * filas
		;; indice = AH + DH * 07
		;; DH * 07 + AH
		mov DL, DH
		mov AL, 07
		mul DL
		;; AL + AH
		add AL, AH

		mov DI, offset tablero
		add DI, AX

		mov AL, [DI]
		cmp AL, [ficha_actual]
		jne validacion_conexion_4_false

		inc CH
		cmp CH, 04
		jl bucle_validar_conexion_4
		mov AL, 01
		ret
validacion_conexion_4_false:
		mov AL, 00
		ret

;;
;; buscar_vacio_en_columna - busca un espacio vacío en la columna indicada
;;
;; ENTRADA: AL -> número de columna o X
;; SALIDA:  DI -> número de fila con espacio disponible
;;          DL -> 00 si se obtuvo un espacio disponible
;;               0ff si no se econtró espacio
buscar_vacio_en_columna:
		;; X en AL , Y en DL -> (AL, DL)
		mov DL, 05
ciclo_buscar_vacio:
		;; índice = 7*DL + AL
		mov DH, AL
		;; 7*DL = AX
		mov AL, 07
		mul DL
		;; 7*DL + DH
		;;  AL  + DH
		add AL, DH
		;; AX -> índice
		mov DI, offset tablero
		add DI, AX
		;; verifico el contenido
		mov AL, [DI]
		cmp AL, 00  ;; verificar si está vacío
		je retorno_buscar_vacio
		dec DL
		mov AL, DH
		cmp DL, 00
		jge ciclo_buscar_vacio
retorno_fallido_buscar_vacio:
		mov DL, 0ff
		ret
retorno_buscar_vacio:
		mov DL, 00
		ret
;;
;; obtener_valor_de_casilla - obtiene el valor de una casilla del tablero
;;
;; ENTRADA: BH -> X
;;          BL -> Y
;; SALIDA:  DL -> valor
obtener_valor_de_casilla:
		;; índice = 7*BL + BH
		;; 7*BL = AX
		mov AL, 07
		mul BL
		;; 7*BL + BH
		;;  AL  + BH
		add AL, BH
		;; AX -> índice
		mov DI, offset tablero
		add DI, AX
		;; obtengo el contenido
		mov DL, [DI]
		ret
;;
;; imprimir_tablero - imprime el tablero del juego
;;
imprimir_tablero:
		mov DX, offset encabezado_tablero
		mov AH, 09
		int 21
		;;
		mov BX,0000
		;; inicialización de contadores
		mov SI, 0006
		xchg SI, CX
ciclo_columnas:
		xchg SI, CX
		mov CX, 0007
		;;
		mov DX, offset antes_de_fila
		mov AH, 09
		int 21
		;;
ciclo_fila:
		call obtener_valor_de_casilla
		cmp DL, 00
		je imprimir_vacia
		cmp DL, ficha_a
		je imprimir_ficha_a
		cmp DL, ficha_b
		je imprimir_ficha_b
imprimir_vacia:
		mov DL, ' '
		mov AH, 02
		int 21
		mov DX, offset entre_columnas
		mov AH, 09
		int 21
		jmp avanzar_en_fila
imprimir_ficha_a:
		mov DL, ficha_a
		mov AH, 02
		int 21
		mov DX, offset entre_columnas
		mov AH, 09
		int 21
		jmp avanzar_en_fila
imprimir_ficha_b:
		mov DL, ficha_b
		mov AH, 02
		int 21
		mov DX, offset entre_columnas
		mov AH, 09
		int 21
		jmp avanzar_en_fila
avanzar_en_fila:
		inc BH
		loop ciclo_fila
		;;
		mov DL, 0a
		mov AH, 02
		int 21
		;;
		mov BH, 00
		inc BL
		xchg SI, CX
		loop ciclo_columnas
		;;
		mov DX, offset pie_de_tablero
		mov AH, 09
		int 21
		ret
fin:
.EXIT
END
