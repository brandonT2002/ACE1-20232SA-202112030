NADA        equ      00
JUGADOR     equ      01
JUGADORA    equ      02
ACERA       equ      03
CARRIL      equ      04
CARRO1      equ      05
CARRO2      equ      06
CARRO3      equ      07
OBJETIVO    equ      08

USUARIO_NORMAL         equ 01
USUARIO_ADMIN          equ 02
USUARIO_ADMIN_ORIGINAL equ 03

TAM_NOMBRE equ 14
TAM_CONTRA equ 19

NO_BLOQUEADO equ 00
BLOQUEADO    equ 01
.MODEL SMALL
.RADIX 16
.STACK
.DATA
dim_sprite_jug      db   08, 08
data_sprite_jug     db   13, 13, 13, 05, 05, 13, 13, 13
                    db   13, 13, 13, 05, 05, 13, 13, 05
                    db   13, 05, 05, 05, 05, 05, 05, 13
                    db   05, 13, 13, 05, 05, 13, 13, 13
                    db   13, 13, 13, 05, 05, 13, 13, 13
                    db   13, 13, 05, 05, 05, 05, 13, 13
                    db   13, 13, 05, 13, 13, 05, 13, 13
                    db   1f, 05, 05, 13, 1f, 05, 05, 13
dim_sprite_jug2     db   08, 08
data_sprite_jug2    db   17, 17, 17, 05, 05, 17, 17, 17
                    db   17, 17, 17, 05, 05, 17, 17, 05
                    db   17, 05, 05, 05, 05, 05, 05, 17
                    db   05, 17, 17, 05, 05, 17, 17, 17
                    db   17, 17, 17, 05, 05, 17, 17, 17
                    db   17, 17, 05, 05, 05, 05, 17, 17
                    db   17, 17, 05, 1a, 17, 05, 17, 17
                    db   17, 05, 05, 17, 17, 05, 05, 17
dim_sprite_vacio    db   08, 08
data_sprite_vacio   db   00, 00, 00, 00, 00, 00, 00, 00
                    db   00, 00, 00, 00, 00, 00, 00, 00
                    db   00, 00, 00, 00, 00, 00, 00, 00
                    db   00, 00, 00, 00, 00, 00, 00, 00
                    db   00, 00, 00, 00, 00, 00, 00, 00
                    db   00, 00, 00, 00, 00, 00, 00, 00
                    db   00, 00, 00, 00, 00, 00, 00, 00
                    db   00, 00, 00, 00, 00, 00, 00, 00
dim_sprite_carril   db   08, 08
data_sprite_carril  db   13, 13, 13, 13, 13, 13, 13, 13
                    db   13, 13, 13, 13, 13, 13, 13, 13
                    db   13, 13, 13, 13, 13, 13, 13, 13
                    db   13, 13, 13, 13, 13, 13, 13, 13
                    db   13, 13, 13, 13, 13, 13, 13, 13
                    db   13, 13, 13, 13, 13, 13, 13, 13
                    db   13, 13, 13, 13, 13, 13, 13, 13
                    db   1f, 1f, 13, 13, 1f, 1f, 13, 13
dim_sprite_acera    db   08, 08
data_sprite_acera   db   17, 17, 17, 17, 17, 17, 17, 17
                    db   17, 17, 17, 1a, 17, 17, 17, 17
                    db   17, 17, 17, 1a, 17, 17, 17, 17
                    db   17, 17, 17, 1a, 17, 17, 17, 17
                    db   17, 17, 17, 1a, 17, 17, 17, 17
                    db   17, 17, 17, 1a, 17, 17, 17, 17
                    db   17, 17, 17, 1a, 17, 17, 17, 17
                    db   17, 17, 17, 17, 17, 17, 17, 17
dim_sprite_carro1   db   08, 08
data_sprite_carro1  db   13, 00, 00, 13, 13, 00, 00, 13
                    db   02, 02, 02, 02, 02, 02, 02, 02
                    db   02, 4e, 4e, 02, 02, 02, 4e, 02
                    db   02, 4e, 4e, 02, 02, 02, 4e, 02
                    db   02, 4e, 4e, 02, 02, 02, 4e, 02
                    db   02, 4e, 4e, 02, 02, 02, 4e, 02
                    db   02, 02, 02, 02, 02, 02, 02, 02
                    db   1f, 00, 00, 13, 1f, 00, 00, 13
dim_sprite_carro2   db   08, 08
data_sprite_carro2  db   13, 00, 00, 13, 13, 00, 00, 13
                    db   36, 36, 36, 36, 36, 36, 36, 36
                    db   36, 4e, 4e, 36, 36, 36, 4e, 36
                    db   36, 4e, 4e, 36, 36, 36, 4e, 36
                    db   36, 4e, 4e, 36, 36, 36, 4e, 36
                    db   36, 4e, 4e, 36, 36, 36, 4e, 36
                    db   36, 36, 36, 36, 36, 36, 36, 36
                    db   1f, 00, 00, 13, 1f, 00, 00, 13
dim_sprite_carro3   db   08, 08
data_sprite_carro3  db   13, 00, 00, 13, 13, 00, 00, 13
                    db   2a, 2a, 2a, 2a, 2a, 2a, 2a, 2a
                    db   2a, 4e, 4e, 2a, 2a, 2a, 4e, 2a
                    db   2a, 4e, 4e, 2a, 2a, 2a, 4e, 2a
                    db   2a, 4e, 4e, 2a, 2a, 2a, 4e, 2a
                    db   2a, 4e, 4e, 2a, 2a, 2a, 4e, 2a
                    db   2a, 2a, 2a, 2a, 2a, 2a, 2a, 2a
                    db   1f, 00, 00, 13, 1f, 00, 00, 13
dim_sprite_obj      db   08, 08
data_sprite_obj     db   17, 17, 17, 17, 17, 17, 17, 17
                    db   17, 17, 17, 1a, 17, 17, 17, 17
                    db   17, 17, 17, 1a, 17, 17, 17, 17
                    db   17, 17, 17, 1a, 17, 17, 17, 17
                    db   17, 17, 17, 1a, 17, 17, 17, 17
                    db   17, 17, 17, 1a, 17, 17, 17, 17
                    db   17, 17, 17, 1a, 17, 17, 17, 17
                    db   17, 17, 17, 17, 17, 17, 17, 17
mapa                db   400 dup (0)
tag                 db   "$"
;; 
esquina1            db      0c9, "$"
esquina2            db      0bb, "$"
esquina3            db      0c8, "$"
esquina4            db      0bc, "$"
lateral1            db      0cc, "$"
lateral2            db      0b9, "$"
lineas              db      26 dup (0cd), "$"
universidad         db      0ba, " Universidad de San Carlos de         ", 0ba
					db      0ba, " Guatemala                            ", 0ba, "$"
facultad            db      0ba, " Facultad de Ingenieria               ", 0ba, "$"
curso               db      0ba, " Arquitectura de Computadoras y       ", 0ba
					db      0ba, " Ensambladores 1                      ", 0ba, "$"
seccion             db      0ba, " Seccion A                            ", 0ba, "$"
semestre            db      0ba, " Segundo Semestre 2023                ", 0ba, "$"
nombre              db      0ba, " Nombre: Brandon Andy Jefferson       ", 0ba
					db      0ba, "         Tejaxun Pichiya              ", 0ba, "$"
carnet              db      0ba, " Carne: 202112030                     ", 0ba, "$"
;; PANTALLA MENÚ INICIAL
iniciar_sesion      db   "F1  INICIAR SESION$"
registros           db   "F2  REGISTRO$"
salir               db   "F3  SALIR$"
;; PANTALLA MENÚ PRINCIPAL
iniciar_juego       db   "F1 JUGAR$"
generar_puntajes    db   "F2 GENERAR PUNTAJE$"
ordenar_puntajes_o  db   "F3 ORDENAR PUNTAJES$"
salir_al_inicio     db   "F4 SALIR$"
;; PANTALLA PAUSA
continuar_partida   db   "F1 CONTINUAR PARTIDA$"
salir_al_menu       db   "F2 SALIR AL MENU$"
;; REGISTRO
cadena_pedir_nombre db   "NOMBRE: $"
cadena_pedir_contra db   "CLAVE:  $"
;; PANTALLA JUEGO
iniciales           db   "brandon$"
conteo_vidas3       db   "O  O  O$"
conteo_vidas2       db   "X  O  O$"
conteo_vidas1       db   "X  X  O$"
conteo_vidas0       db   "X  X  X$"
game_over_msg       db   "GAME OVER$"
nl                  db   0a, "$"
;; JUEGO
xJugador            db   14
yJugador            db   17
xContador           db   00
yContador           db   00
vidas               db   03
puntos              dw   00
transcurrido        dw   00
velocidad           dw   1000
;; MENÚS
opcion              db   00
;; CONTROLES
control_arriba      db   47
control_abajo       db   4f
control_izquierda   db   53
control_derecha     db   51
;; NIVELES
linea               db   100 dup (0)
xElemento           db   00
yElemento           db   00
numeroNivel         db   01
;; LOCALIZADORES
hay_objetivo_act    db   00
posicion_actual     db   ACERA
posicion_siguiente  db   ACERA
;; LOCALIZADORES CARROS/CAMIONES
loc1                db   2f
loc2                db   -0b
loc3                db   -7
loc4                db   2e
loc5                db   -15
loc6                db   -20
loc7                db   30
loc8                db   -9
loc9                db   -15
loc10               db   29
loc11               db   30
loc12               db   3f
loc13               db   -5
loc14               db   -0a
loc15               db   3a
loc16               db   -20
loc17               db   -10
loc18               db   31
loc19               db   -5
loc20               db   -10
loc21               db   -3
;; DIRECCIONALES CARROS/CAMIONES
dir1                db   'L'
dir2                db   'R'
dir3                db   'R'
dir4                db   'L'
dir5                db   'R'
dir6                db   'R'
dir7                db   'L'
dir8                db   'R'
dir9                db   'R'
dir10               db   'L'
dir11               db   'L'
dir12               db   'L'
dir13               db   'R'
dir14               db   'L'
dir15               db   'R'
dir16               db   'L'
dir17               db   'L'
dir18               db   'R'
dir19               db   'L'
dir20               db   'L'
dir21               db   'L'
;; ESTRUCTURA USUARIO -> 2f bytes
usuario_nombre      db   14 dup (00)
usuario_contra      db   19 dup (00)
usuario_tipo        db           00
usuario_bloqueado   db           00
;; ESTRUCTURA JUEGO   -> 06 bytes
juego_cod_usuario   dw   0000
juego_tiempo        dw   0000
juego_puntos        dw   0000
;; COPIA ESTRUCTURA
juego_tmp_cod_usuario dw 0000
juego_tmp_tiempo      dw 0000
juego_tmp_puntos      dw 0000
;; BUFFER
buffer_entrada      db   0ff,00
                    db   0ff dup (00)
;;
usuarios_archivo    db   "USRS.ACE", 00
juegos_archivo      db   "PUNTOS.ACE", 00
;;
handle_a            dw   0000
handle_b            dw   0000
tam_archivo_origen  dw   0000
un_byte             db   00
copia_puntos        db   "PUNTOS02.ACE", 00
;;
indice_burbuja      dw   0000
cantidad_registros  dw   0000
hubo_intercambio    db   00
numero_a            dw   0000
numero_b            dw   0000
;;
numero              db  "000000",'$'
;;
cadena_mostrar_cod_usuario db "CODIGO DE USUARIO:   $"
cadena_mostrar_cod_puntos  db "PUNTOS OBTENIDOS:    $"
cadena_mostrar_cod_tiempo  db "TIEMPO TRANSCURRIDO: $"
cadena_separador           db 26 dup (0cd), "$"
cadena_ayuda               db 06 dup (0cd), " PRESIONA CUALQUIER TECLA ", 06 dup (0cd), "$"
cadena_ayuda_fin           db 03 dup (0cd), " FIN, PRESIONA CUALQUIER TECLA ", 04 dup (0cd), "$"
;; CARGA DE NIVEL
nombre_archivo_nvl  db   "NOMBRE DEL ARCHIVO$"
de_nivel            db   " DE NIVEL: $"
;; PANTALLA INICIAL
movimientosM        db   01 dup (30), "$"
movimientosC        db   01 dup (30), "$"
movimientosD        db   01 dup (30), "$"
movimientosU        db   01 dup (30), "$"
tiempoUS            db   01 dup(30), "$"
tiempoDS            db   01 dup(30), "$"
dospuntos           db   ":$"
tiempoUM            db   01 dup(30), "$"
tiempoDM            db   01 dup(30), "$"
retardoTiempo       dw   00
errorAbrirArchivo   db   "Error Al Abrir El Archivo$"
fila_texto          db   00
.CODE
.STARTUP
inicio:

mover_carroN macro loc, row, dir, sprite
        local validar_izquierda, validar_derecha, continuar_mover_carroN, inc_movN, actualizar_primera_posicion, actualizar_ultima_posicion, actualizar_posicion_previa, fin_mover_carroN
        cmp dir, 'L'
        jle validar_izquierda
        jmp validar_derecha
validar_izquierda:
        cmp loc, 27
        jle continuar_mover_carroN
        jmp fin_mover_carroN
validar_derecha:
        cmp loc, 00
        jge continuar_mover_carroN
        jmp fin_mover_carroN
continuar_mover_carroN:
        mov AH, loc  ;; X
		mov AL, row  ;; Y
		mov DL, sprite
		push AX
		call colocar_en_mapa
		pop AX
		call pintar_posicion
        cmp dir, 'L'
        je inc_movN
        cmp AH, 00
        je actualizar_ultima_posicion
        dec AH
        jmp actualizar_posicion_previa
inc_movN:
        cmp AH, 27
        je actualizar_primera_posicion
        inc AH
        jmp actualizar_posicion_previa
actualizar_primera_posicion:
        mov AH, 00
        jmp actualizar_posicion_previa
actualizar_ultima_posicion:
        mov AH, 27
        jmp actualizar_posicion_previa
actualizar_posicion_previa:
		mov DL, CARRIL
		push AX
		call colocar_en_mapa
		pop AX
		call pintar_posicion
        jmp fin_mover_carroN
fin_mover_carroN:
endm

actualizar_posicion_carroN macro dir, loc
        local reset_x_izquierda, dec_dirN, reset_x_derecha, fin_actualizar_posicion_carroN
        cmp dir, 'L'
        je dec_dirN
        cmp loc, 27
        je reset_x_izquierda
        inc loc
        jmp fin_actualizar_posicion_carroN
reset_x_izquierda:
        mov [loc], 00
        jmp fin_actualizar_posicion_carroN
dec_dirN:
        cmp loc, 00
        je reset_x_derecha
        dec loc
        jmp fin_actualizar_posicion_carroN
reset_x_derecha:
        mov [loc], 27
fin_actualizar_posicion_carroN:
endm

print macro texto
        mov DX, offset texto
        mov AH, 09
        int 21
endm

		;; MODO VIDEO ;;
		mov AH, 00
		mov AL, 13
		int 10
		;;;;;;;;;;;;;;;;
		;; PANTALLA DE PRESENTACIÓN
		mov DH, 06
		mov DL, 00
		mov BH, 00
		mov AH, 02
		int 10
		;;
		print esquina1
        print lineas
        print esquina2
        print universidad
        print facultad
        print curso
        print seccion
        print semestre
        print lateral1
        print lineas
        print lateral2
        print nombre
        print carnet
        print esquina3
        print lineas
        print esquina4
		

menu_inicial:
        call menu_inicial_opciones
        mov AL, [opcion]
        ;; > INICIAR SESION
		cmp AL, 00
		je login
		;; > REGISTRO
		cmp AL, 01
        je signin
		;; > SALIR
		cmp AL, 02
        je fin
        jmp menu_inicial

login:
        jmp menu

signin:
        call limpiar_pantalla
		mov DH, 08
		mov DL, 04
		mov BH, 00
		mov AH, 02
		int 10
		mov DX, offset cadena_pedir_nombre
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		mov AL, TAM_NOMBRE
		mov DI, offset usuario_nombre
		call copiar_dato
		;;
		mov DH, 0a
		mov DL, 04
		mov BH, 00
		mov AH, 02
		int 10
		mov DX, offset cadena_pedir_contra
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		mov AL, TAM_CONTRA
		mov DI, offset usuario_contra
		call copiar_dato
		;;
		mov AL, USUARIO_NORMAL
		mov [usuario_tipo], AL
		;;
		mov AL, NO_BLOQUEADO
		mov [usuario_bloqueado], AL
		;;
		call escribir_usuario
		call limpiar_pantalla
		jmp menu_principal

menu:
		mov [numeroNivel], 01
        mov [vidas], 03
		call menu_principal
		mov AL, [opcion]
		;; > JUGAR
		cmp AL, 00
		je jugar
		;; > GENERAR PUNTAJE
		cmp AL, 01
        je generar_puntaje
		;; > ORDENAR PUNTAJES
		cmp AL, 02
        je ordenar_puntajes
		;; > SALIR
		cmp AL, 03
		je menu_inicial
		jmp menu
		;;;;;;;;;;;;;;;;

jugar:
        call reiniciarPunteo
modo_juego:
		call limpiarTiempo
        cmp [numeroNivel], 01
        je cargar_carros1
        cmp [numeroNivel], 02
        je cargar_carros2
        cmp [numeroNivel], 03
        je cargar_carros3
		jmp juego_ganado

juego_ganado:
        call imprimirPuntos
        call delay
        call delay
        call delay
        call delay
        call delay
        call delay
        call delay
		jmp menu

cargar_carros1:
        mov dir1 , 'L'
        mov dir2 , 'R'
        mov dir3 , 'R'
        mov dir4 , 'L'
        mov dir5 , 'R'
        mov dir6 , 'R'
        mov dir7 , 'L'
        mov dir8 , 'R'
        mov dir9 , 'R'
        mov dir10, 'L'
        mov dir11, 'L'
        mov dir12, 'L'
        mov dir13, 'R'
        mov dir14, 'L'
        mov dir15, 'R'
        mov dir16, 'L'
        mov dir17, 'L'
        mov dir18, 'R'
        mov dir19, 'L'
        mov dir20, 'R'
        mov dir21, 'L'
        mov loc1 , 2f
        mov loc2 , -0b
        mov loc3 , -1c
        mov loc4 , 34
        mov loc5 , -15
        mov loc6 , -20
        mov loc7 , 30
        mov loc8 , -09
        mov loc9 , -19
        mov loc10, 37
        mov loc11, 40
        mov loc12, 3f
        mov loc13, -05
        mov loc14, 2f
        mov loc15, -0a
        mov loc16, 3c
        mov loc17, 2d
        mov loc18, -09
        mov loc19, 32
        mov loc20, -01
        mov loc21, 28
        mov [velocidad], 1000
        jmp cargar_un_nivel

cargar_carros2:
        mov dir1 , 'R'
        mov dir2 , 'R'
        mov dir3 , 'L'
        mov dir4 , 'R'
        mov dir5 , 'R'
        mov dir6 , 'L'
        mov dir7 , 'L'
        mov dir8 , 'L'
        mov dir9 , 'R'
        mov dir10, 'R'
        mov dir11, 'L'
        mov dir12, 'R'
        mov dir13, 'L'
        mov dir14, 'R'
        mov dir15, 'L'
        mov dir16, 'R'
        mov dir17, 'R'
        mov dir18, 'R'
        mov dir19, 'L'
        mov dir20, 'L'
        mov dir21, 'R'
        mov loc1 , -10
        mov loc2 , -05
        mov loc3 , 2f
        mov loc4 , -19
        mov loc5 , -1d
        mov loc6 , 30
        mov loc7 , 35
        mov loc8 , 2c
        mov loc9 , -15
        mov loc10, -08
        mov loc11, 29
        mov loc12, -14
        mov loc13, 36
        mov loc14, -16
        mov loc15, 33
        mov loc16, -13
        mov loc17, -20
        mov loc18, -01
        mov loc19, 34
        mov loc20, 31
        mov loc21, -8
        mov [velocidad], 750
        jmp cargar_un_nivel

cargar_carros3:
        mov dir1 , 'R'
        mov dir2 , 'L'
        mov dir3 , 'L'
        mov dir4 , 'R'
        mov dir5 , 'L'
        mov dir6 , 'R'
        mov dir7 , 'R'
        mov dir8 , 'L'
        mov dir9 , 'L'
        mov dir10, 'R'
        mov dir11, 'R'
        mov dir12, 'R'
        mov dir13, 'L'
        mov dir14, 'L'
        mov dir15, 'L'
        mov dir16, 'R'
        mov dir17, 'R'
        mov dir18, 'L'
        mov dir19, 'R'
        mov dir20, 'R'
        mov dir21, 'L'
        mov loc1 , -15
        mov loc2 , 3a
        mov loc3 , 33
        mov loc4 , -2a
        mov loc5 , 30
        mov loc6 , -09
        mov loc7 , -20
        mov loc8 , 40
        mov loc9 , 2f
        mov loc10, -08
        mov loc11, -02
        mov loc12, -16
        mov loc13, 32
        mov loc14, 29
        mov loc15, 38
        mov loc16, -06
        mov loc17, -04
        mov loc18, 43
        mov loc19, -1f
        mov loc20, -10
        mov loc21, 29
        mov [velocidad], 400
        jmp cargar_un_nivel

ciclo_juego:
		call pintar_mapa
		call imprimirIniciales
		call imprimirPuntos
        call imprimirVidas
ciclo_juego1:
        ;; VALIDAR SI LLEGÓ AL OTRO LADO
        cmp [hay_objetivo_act], 01
        je subir_nivel
        cmp [vidas], 00
        je game_over
		call imprimirTiempo
		call incrementarTiempo
		call entrada_juego
		inc retardoTiempo
        mov BX, [velocidad]
        cmp [transcurrido], BX
        je ir_a_mover_carros
        jmp continuar_ciclo_juego1
ir_a_mover_carros:
        mov [transcurrido], 00
        call mover_carros
continuar_ciclo_juego1:
        inc transcurrido
		jmp ciclo_juego1

game_over:
		call limpiar_pantalla
        call imprimirPuntosGameOver
        jmp menu

imprimirPuntosGameOver:
		call imprimirPuntos_GameOver
        call delay
        call delay
        call delay
        call delay
        call delay
        call delay
        call delay
        call delay
        call delay
        call delay
		ret

mover_carros:
        ;; carro fila 1
        mover_carroN loc1, 02, dir1, CARRO1
        actualizar_posicion_carroN dir1, loc1
        ;; carro fila 2
        mover_carroN loc2, 03, dir2, CARRO2
        actualizar_posicion_carroN dir2, loc2
        ;; carro fila 3
        mover_carroN loc3, 04, dir3, CARRO3
        actualizar_posicion_carroN dir3, loc3
        ;; carro fila 4
        mover_carroN loc4, 05, dir4, CARRO1
        actualizar_posicion_carroN dir4, loc4
        ;; carro fila 5
        mover_carroN loc5, 06, dir5, CARRO2
        actualizar_posicion_carroN dir5, loc5
        ;; carro fila 6
        mover_carroN loc6, 07, dir6, CARRO3
        actualizar_posicion_carroN dir6, loc6
        ;; carro fila 7
        mover_carroN loc7, 08, dir7, CARRO1
        actualizar_posicion_carroN dir7, loc7
        ;; carro fila 8
        mover_carroN loc8, 09, dir8, CARRO2
        actualizar_posicion_carroN dir8, loc8
        ;; carro fila 9
        mover_carroN loc9, 0a, dir9, CARRO3
        actualizar_posicion_carroN dir9, loc9
        ;; carro fila 10
        mover_carroN loc10, 0b, dir10, CARRO1
        actualizar_posicion_carroN dir10, loc10
        ;; carro fila 11
        mover_carroN loc11, 0c, dir11, CARRO2
        actualizar_posicion_carroN dir11, loc11
        ;; carro fila 12
        mover_carroN loc12, 0d, dir12, CARRO3
        actualizar_posicion_carroN dir12, loc12
        ;; carro fila 13
        mover_carroN loc13, 0e, dir13, CARRO1
        actualizar_posicion_carroN dir13, loc13
        ;; carro fila 14
        mover_carroN loc14, 0f, dir14, CARRO2
        actualizar_posicion_carroN dir14, loc14
        ;; carro fila 15
        mover_carroN loc15, 10, dir15, CARRO3
        actualizar_posicion_carroN dir15, loc15
        ;; carro fila 16
        mover_carroN loc16, 11, dir16, CARRO1
        actualizar_posicion_carroN dir16, loc16
        ;; carro fila 17
        mover_carroN loc17, 12, dir17, CARRO2
        actualizar_posicion_carroN dir17, loc17
        ;; carro fila 18
        mover_carroN loc18, 13, dir18, CARRO3
        actualizar_posicion_carroN dir18, loc18
        ;; carro fila 19
        mover_carroN loc19, 14, dir19, CARRO1
        actualizar_posicion_carroN dir19, loc19
        ;; carro fila 20
        mover_carroN loc20, 15, dir20, CARRO2
        actualizar_posicion_carroN dir20, loc20
        ;; carro fila 21
        mover_carroN loc21, 16, dir21, CARRO3
        actualizar_posicion_carroN dir21, loc21
        ret

subir_nivel:
        cmp [numeroNivel], 00
        je menu
        inc [numeroNivel]
        call sumador_punteo
        jmp modo_juego

cargar_un_nivel:
        call limpiar_pantalla
        ;; ===================== ACERA OBJETIVO =====================
		mov DL, OBJETIVO
        mov [xContador], 00
bucle_acera1:
		mov AH, [xContador]  ;; X
		mov AL, 01           ;; Y
        call colocar_en_mapa
        inc [xContador]
        cmp [xContador], 27
        jle bucle_acera1
        ;; ======================== CARRILES ========================
		mov DL, CARRIL
        mov [yContador], 02
bucle_carrilesY:
        mov [xContador], 00
bucle_carrilesX:
		mov AH, [xContador] ;; X
		mov AL, [yContador] ;; Y
		call colocar_en_mapa
        inc [xContador]
        cmp [xContador], 27
        jle bucle_carrilesX
        inc [yContador]
        cmp [yContador], 16
        jle bucle_carrilesY
        ;; ===================== ACERA INICIAL ======================
        mov [xContador], 00
		mov DL, ACERA
bucle_acera2:
		mov AH, [xContador]  ;; X
		mov AL, 17           ;; Y
        call colocar_en_mapa
        inc [xContador]
        cmp [xContador], 27
        jle bucle_acera2
        ;; ======================== JUGADOR =========================
        mov xJugador, 14
        mov yJugador, 17
        ;;
		mov AH, [xJugador]
		mov AL, [yJugador]
		mov DL, JUGADORA
		call colocar_en_mapa
        ;;
        mov posicion_actual, ACERA
        mov [hay_objetivo_act], 00
		jmp ciclo_juego

;; pintar_pixel - pintar un pixel
;; ENTRADA:
;;     AX --> x pixel
;;     BX --> y pixel
;;     CL --> color
;; SALIDA: pintar pixel
;;     AX + 320*BX
pintar_pixel:
		push AX
		push BX
		push CX
		push DX
		push DI
		push SI
		push DS
		mov DX, 0a000
		mov DS, DX
		;; (
		;; 	posicionarse en X
		mov SI, AX
		mov AX, 140
		mul BX
		add AX, SI
		mov DI, AX
		;;
		mov [DI], CL  ;; pintar
		;; )
		pop DS
		pop SI
		pop DI
		pop DX
		pop CX
		pop BX
		pop AX
		ret

;; pintar_sprite - pinta un sprite
;; Entrada:
;;    - DI: offset del sprite
;;    - SI: offset de las dimensiones
;;    - AX: x sprite 320x200
;;    - BX: y sprite 320x200
pintar_sprite:
		push DI
		push SI
		push AX
		push BX
		push CX
		inc SI
		mov DH, [SI]  ;; vertical
		dec SI        ;; dirección de tam horizontal
		;;
inicio_pintar_fila:
		cmp DH, 00
		je fin_pintar_sprite
		push AX
		mov DL, [SI]
pintar_fila:
		cmp DL, 00
		je pintar_siguiente_fila
		mov CL, [DI]
		call pintar_pixel
		inc AX
		inc DI
		dec DL
		jmp pintar_fila
pintar_siguiente_fila:
		pop AX
		inc BX
		dec DH
		jmp inicio_pintar_fila
fin_pintar_sprite:
		pop CX
		pop BX
		pop AX
		pop SI
		pop DI
		ret

;; delay - subrutina de retardo
delay:
		push SI
		push DI
		mov SI, 0200
cicloA:
		mov DI, 0130
		dec SI
		cmp SI, 0000
		je fin_delay
cicloB:
		dec DI
		cmp DI, 0000
		je cicloA
		jmp cicloB
fin_delay:
		pop DI
		pop SI
		ret
		

;; limpiar_pantalla - limpia la pantalla
;; ..
;; ..
limpiar_pantalla:
		mov CX, 19  ;; 25
		mov BX, 00
clear_v:
		push CX
		mov CX, 28  ;; 40
		mov AX, 00
clear_h:
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		add AX, 08
		loop clear_h
		add BX, 08
		pop CX
		loop clear_v
		ret

;; menu_inicial_opciones - menu principal
;; ..
;; SALIDA
;;    - [opcion] -> código numérico de la opción elegida
menu_inicial_opciones:
		call limpiar_pantalla
		;; IMPRIMIR OPCIONES ;;
		;; <<-- posicionar el cursor
		mov DL, 0a
		mov DH, 09
		mov BH, 00
		mov AH, 02
		int 10
		;;;; INICIAR SESION
		push DX
		mov DX, offset iniciar_sesion
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; REGISTROS
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset registros
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; SALIR
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset salir
		mov AH, 09
		int 21
		pop DX
		;;
		;; LEER TECLA
		;;;;
entrada_menu_inicial:
		mov AH, 00
		int 16
		cmp AH, 3b ;; F1
        je opcion_iniciar
		cmp AH, 3c ;; F2
        je opcion_registrar
		cmp AH, 3d ;; F3
        je opcion_cerrar
		je fin_menu_inicial
		jmp entrada_menu_inicial
opcion_iniciar:
        mov [opcion], 00
        jmp fin_menu_inicial
opcion_registrar:
        mov [opcion], 01
        jmp fin_menu_inicial
opcion_cerrar:
        mov [opcion], 02
        jmp fin_menu_inicial
fin_menu_inicial:
		ret
;; menu_principal - menu principal
;; ..
;; SALIDA
;;    - [opcion] -> código numérico de la opción elegida
menu_principal:
		call limpiar_pantalla
		;; IMPRIMIR OPCIONES ;;
		;; <<-- posicionar el cursor
		mov DL, 0a
		mov DH, 09
		mov BH, 00
		mov AH, 02
		int 10
		;;;; JUGAR
		push DX
		mov DX, offset iniciar_juego
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; GENERAR PUNTAJE
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset generar_puntajes
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; ORDENAR PUNTAJES
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset ordenar_puntajes_o
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; SALIR
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset salir_al_inicio
		mov AH, 09
		int 21
		pop DX
		;;
		;; LEER TECLA
		;;;;
entrada_menu_principal:
		mov AH, 00
		int 16
		cmp AH, 3b ;; F1
        je opcion_jugar
		cmp AH, 3c ;; F2
        je opcion_generar
		cmp AH, 3d ;; F3
        je opcion_ordenar
		cmp AH, 3E ;; F4
        je opcion_salir
		je fin_menu_principal
		jmp entrada_menu_principal
opcion_jugar:
        mov [opcion], 00
        jmp fin_menu_principal
opcion_generar:
        mov [opcion], 01
        jmp fin_menu_principal
opcion_ordenar:
        mov [opcion], 02
        jmp fin_menu_principal
opcion_salir:
        mov [opcion], 03
        jmp fin_menu_principal
fin_menu_principal:
		ret

;; adaptar_coordenada - 40x25->320x200
;; ENTRADA:
;;    AH -> x 40x25
;;    AL -> y 40x25
;; SALIDA:
;;    AX -> x 320x200
;;    BX -> y 320x200
adaptar_coordenada:
		mov DL, 08
		mov CX, AX
		mul DL
		mov BX, AX
		;;
		mov AL, CH
		mul DL
		ret
		
;; colocar_en_mapa - coloca un elemento en el mapa
;; ENTRADA:
;;    - DL -> código numérico del elemento
;;    - AH -> x
;;    - AL -> y
;; ...
colocar_en_mapa:
		mov CX, AX     ;;;   AH -> x -> CH
		mov BL, 28
		mul BL   ;; AL * BL  = AX
		mov CL, CH
		mov CH, 00     ;;; CX el valor de X completo
		add AX, CX
		mov DI, offset mapa
		add DI, AX
		mov [DI], DL
		ret


;; obtener_de_mapa - obtiene un elemento en el mapa
;; ENTRADA:
;;    - AH -> x
;;    - AL -> y
;; SALIDA:
;;    - DL -> código numérico del elemento
obtener_de_mapa:
		mov CX, AX
		mov BL, 28
		mul BL
		mov CL, CH
		mov CH, 00
		add AX, CX
		mov DI, offset mapa
		add DI, AX
		mov DL, [DI]
		ret


;; pintar_mapa - pinta los elementos del mapa
;; ENTRADA:
;; SALIDA:
pintar_mapa:
		mov AL, 00   ;; fila
		;;
ciclo_v:
		cmp AL, 19
		je fin_pintar_mapa
		mov AH, 00   ;; columna
		;;
ciclo_h:
		cmp AH, 28
		je continuar_v
		push AX
		call obtener_de_mapa
		pop AX
		;;
		cmp DL, NADA
		je pintar_vacio_mapa
		;;
		cmp DL, JUGADOR
		je pintar_jugador_mapa
		;;
		cmp DL, JUGADORA
		je pintar_jugadora_mapa
		;;
		cmp DL, ACERA
		je pintar_acera_mapa
		;;
		cmp DL, CARRO1
		je pintar_carro1_mapa
		;;
		cmp DL, CARRO2
		je pintar_carro2_mapa
		;;
		cmp DL, CARRO3
		je pintar_carro3_mapa
		;;
		cmp DL, OBJETIVO
		je pintar_objetivo_mapa
		;;
		cmp DL, CARRIL
		je pintar_carril_mapa
		;;
		jmp continuar_h
pintar_vacio_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_vacio
		mov DI, offset data_sprite_vacio
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_carril_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_carril
		mov DI, offset data_sprite_carril
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_jugador_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_jug
		mov DI, offset data_sprite_jug
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_jugadora_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_jug2
		mov DI, offset data_sprite_jug2
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_acera_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_acera
		mov DI, offset data_sprite_acera
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_carro1_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_carro1
		mov DI, offset data_sprite_carro1
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_carro2_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_carro2
		mov DI, offset data_sprite_carro2
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_carro3_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_carro3
		mov DI, offset data_sprite_carro3
		call pintar_sprite
		pop AX
		jmp continuar_h
pintar_objetivo_mapa:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_obj
		mov DI, offset data_sprite_obj
		call pintar_sprite
		pop AX
		jmp continuar_h
continuar_h:
		inc AH
		jmp ciclo_h
continuar_v:
		inc AL
		jmp ciclo_v
fin_pintar_mapa:
		ret

;; pintar_carro - pinta los elementos del mapa
;; ENTRADA:
;; SALIDA:
pintar_carro_actual:
		push AX
		call obtener_de_mapa
		pop AX
		call pintar_posicion
		ret
;; pintar_jugador - pinta los elementos del mapa
;; ENTRADA:
;; SALIDA:
pintar_jugador_posicion_actual:
        mov AL, [yJugador]   ;; fila
		mov AH, [xJugador]   ;; columna
		push AX
		call obtener_de_mapa
		pop AX
		call pintar_posicion
		ret
;; pintar_jugador_horizontal - pinta los elementos del mapa
;; ENTRADA:
;; SALIDA:
pintar_jugador_perimetro_x_izquierda:
		mov AL, [yJugador]   ;; fila
		mov AH, [xJugador]   ;; columna
		;; PINTAR PERÍMETRO JUGADOR
		;; IZQUIERDA
		dec AH
		push AX
		call obtener_de_mapa
		pop AX
		call pintar_posicion
		ret
pintar_jugador_perimetro_x_derecha:
		mov AL, [yJugador]   ;; fila
		mov AH, [xJugador]   ;; columna
		;; PINTAR PERÍMETRO JUGADOR
		;; DERECHA
		inc AH
		push AX
		call obtener_de_mapa
		pop AX
		call pintar_posicion
		ret
;; pintar_jugador_vertical - pinta los elementos del mapa
;; ENTRADA:
;; SALIDA:
pintar_jugador_perimetro_y_arriba:
		mov AL, [yJugador]   ;; fila
		mov AH, [xJugador]   ;; columna
		;; PINTAR PERÍMETRO JUGADOR
		;; ARRIBA
		dec AL
		push AX
		call obtener_de_mapa
		pop AX
		call pintar_posicion
		ret
pintar_jugador_perimetro_y_abajo:
		mov AL, [yJugador]   ;; fila
		mov AH, [xJugador]   ;; columna
		;; PINTAR PERÍMETRO JUGADOR
		;; ABAJO
		inc AL
		push AX
		call obtener_de_mapa
		pop AX
		call pintar_posicion
		ret
;; PINTAR ELEMENTO
pintar_posicion:
		cmp DL, JUGADOR
		je pintar_jugador_mapa_p
		cmp DL, JUGADORA
		je pintar_jugador_a_mapa_p
		cmp DL, ACERA
		je pintar_acera_mapa_p
		cmp DL, CARRO1
		je pintar_carro1_mapa_p
		cmp DL, CARRO2
		je pintar_carro2_mapa_p
		cmp DL, CARRO3
		je pintar_carro3_mapa_p
		cmp DL, OBJETIVO
		je pintar_objetivo_mapa_p
		cmp DL, CARRIL
		je pintar_carril_mapa_p
pintar_jugador_mapa_p:
        push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_jug
		mov DI, offset data_sprite_jug
		call pintar_sprite
		pop AX
		jmp terminar_perimetro
pintar_jugador_a_mapa_p:
        push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_jug2
		mov DI, offset data_sprite_jug2
		call pintar_sprite
		pop AX
		jmp terminar_perimetro
pintar_carril_mapa_p:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_carril
		mov DI, offset data_sprite_carril
		call pintar_sprite
		pop AX
		jmp terminar_perimetro
pintar_acera_mapa_p:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_acera
		mov DI, offset data_sprite_acera
		call pintar_sprite
		pop AX
		jmp terminar_perimetro
pintar_carro1_mapa_p:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_carro1
		mov DI, offset data_sprite_carro1
		call pintar_sprite
		pop AX
		jmp terminar_perimetro
pintar_carro2_mapa_p:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_carro2
		mov DI, offset data_sprite_carro2
		call pintar_sprite
		pop AX
		jmp terminar_perimetro
pintar_carro3_mapa_p:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_carro3
		mov DI, offset data_sprite_carro3
		call pintar_sprite
		pop AX
		jmp terminar_perimetro
pintar_objetivo_mapa_p:
		push AX
		call adaptar_coordenada
		mov SI, offset dim_sprite_obj
		mov DI, offset data_sprite_obj
		call pintar_sprite
		pop AX
		jmp terminar_perimetro
terminar_perimetro:
		ret

ciclo_pausa:
		call menu_pausa
		cmp [opcion], 00
		je ciclo_juego
		jmp menu

menu_pausa:
		call limpiar_pantalla
		;; IMPRIMIR OPCIONES ;;
		;;;; INICIAR JUEGO
		mov DL, 0a
		mov DH, 09
		mov BH, 00
		mov AH, 02
		int 10
		;; <<-- posicionar el cursor
		push DX
		mov DX, offset continuar_partida
		mov AH, 09
		int 21
		pop DX
		;;
		;;;; CARGAR NIVEL
		add DH, 02
		mov BH, 00
		mov AH, 02
		int 10
		push DX
		mov DX, offset salir_al_menu
		mov AH, 09
		int 21
		pop DX
		;;;;
		;; LEER TECLA
		;;;;
entrada_menu_pausa:
		mov AH, 00
		int 16
		cmp AH, 3b
        je continuar_juego
		cmp AH, 3c
        je salir_de_la_partida
		jmp entrada_menu_pausa
continuar_juego:
        mov AL, 00
        mov [opcion], AL
        jmp fin_menu_pausa
salir_de_la_partida:
        mov AL, 01
        mov [opcion], AL
        jmp fin_menu_pausa
fin_menu_pausa:
		ret

reiniciar_nivel:
		mov [hay_objetivo_act], ACERA
        mov [posicion_actual], 00
        mov [posicion_siguiente], 00
        mov xJugador, 14
        mov yJugador, 17
		jmp modo_juego

;; entrada_juego - manejo de las entradas del juego
entrada_juego:
		mov AH, 01
		int 16
		jz fin_entrada_juego  ;; nada en el buffer de entrada
		mov AH, 00
		int 16
		;; AH <- scan code
		cmp AH, 01
		je ciclo_pausa
		cmp AH, 3d
		je reiniciar_nivel
		cmp AH, [control_arriba]
		je mover_jugador_arriba
		cmp AH, [control_abajo]
		je mover_jugador_abajo
		cmp AH, [control_izquierda]
		je mover_jugador_izquierda
		cmp AH, [control_derecha]
		je mover_jugador_derecha
		ret
mover_jugador_arriba:
        mov AH, [xJugador]
		mov AL, [yJugador]
        ;; YA NO PUEDE MOVERSE
        cmp AL, 01
        je fin_arriba
        ;; CONTINÚA MOVIENDO
		dec AL
		push AX
		call obtener_de_mapa
		pop AX
        ;; GUARDAR SIGUIENTE POSICIÓN
        mov posicion_siguiente, DL
        ;; VALIDAR SI SE LLEGÓ AL OTRO LADO
        cmp DL, CARRO1
        je limpiar_posicion_actual
        cmp DL, CARRO2
        je limpiar_posicion_actual
        cmp DL, CARRO3
        je limpiar_posicion_actual
        cmp DL, OBJETIVO
        je posicionar_jugador_a_1
posicionar_jugador_1:
		mov DL, JUGADOR
        jmp continuar1
posicionar_jugador_a_1:
        mov [hay_objetivo_act], 01
        mov DL, JUGADORA
        jmp continuar1
continuar1:
        ;; POSICIONAR AL JUGADOR EN EL MAPA
        mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX
		;;
		inc AL
        ;; VALIDAR QUÉ OBJETO DEVOLVER
        cmp posicion_actual, CARRIL
        je devolver_carril1
        cmp posicion_actual, ACERA
        je devolver_acera1
devolver_carril1:
		mov DL, CARRIL
        jmp devolver1
devolver_acera1:
		mov DL, ACERA
        jmp devolver1
devolver1:
		call colocar_en_mapa
        call pintar_jugador_posicion_actual
        call pintar_jugador_perimetro_y_abajo
        mov BL, [posicion_siguiente]
        mov [posicion_actual], BL
fin_arriba:
		ret
mover_jugador_abajo:
		mov AH, [xJugador]
		mov AL, [yJugador]
        ;; YA NO PUEDE MOVERSE
        cmp AL, 17
        je fin_abajo
        ;; CONTINÚA MOVIENDO
		inc AL
		push AX
		call obtener_de_mapa
		pop AX
        ;; GUARDAR SIGUIENTE POSICIÓN
        mov posicion_siguiente, DL
        ;; VALIDAR SI VOLVIÓ AL INICIO
        cmp DL, CARRO1
        je limpiar_posicion_actual
        cmp DL, CARRO2
        je limpiar_posicion_actual
        cmp DL, CARRO3
        je limpiar_posicion_actual
        cmp DL, ACERA
        je posicionar_jugador_a_2
posicionar_jugador_2:
		mov DL, JUGADOR
        jmp continuar2
posicionar_jugador_a_2:
        mov DL, JUGADORA
        jmp continuar2
continuar2:
        ;; POSICIONAR AL JUGADOR EN EL MAPA
        mov [yJugador], AL
		push AX
		call colocar_en_mapa
		pop AX
		;;
		dec AL
        ;; VALIDAR QUÉ OBJETO DEVOLVER
        cmp posicion_actual, CARRIL
        je devolver_carril2
        cmp posicion_actual, OBJETIVO
        je devolver_objetivo2
devolver_carril2:
		mov DL, CARRIL
        jmp devolver2
devolver_objetivo2:
		mov DL, OBJETIVO
        jmp devolver2
devolver2:
		call colocar_en_mapa
        call pintar_jugador_posicion_actual
        call pintar_jugador_perimetro_y_arriba
        mov BL, [posicion_siguiente]
        mov [posicion_actual], BL
fin_abajo:
		ret
mover_jugador_izquierda:
		mov AH, [xJugador]
		mov AL, [yJugador]
        ;; YA NO PUEDE MOVERSE
        cmp AH, 00
        je fin_izquierda
        ;; CONTINÚA MOVIENDO
		dec AH
		push AX
		call obtener_de_mapa
		pop AX
        ;; GUARDAR SIGUIENTE POSICIÓN
        mov posicion_siguiente, DL
        ;; VALIDAR SOBRE QUÉ SUPERFICIE ESTÁ EL JUGADOR
        cmp DL, CARRO1
        je limpiar_posicion_actual
        cmp DL, CARRO2
        je limpiar_posicion_actual
        cmp DL, CARRO3
        je limpiar_posicion_actual
        cmp DL, OBJETIVO
        je posicionar_jugador_a_3
        cmp DL, ACERA
        je posicionar_jugador_a_3
posicionar_jugador_3:
        mov DL, JUGADOR
        jmp continuar3
posicionar_jugador_a_3:
        mov DL, JUGADORA
        jmp continuar3
continuar3:
        ;; POSICIONAR AL JUGADOR EN EL MAPA
        mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX
		;;
		inc AH
        ;; VALIDAR QUÉ OBJETO DEVOLVER
        cmp posicion_actual, OBJETIVO
        je devolver_objetivo3
        cmp posicion_actual, CARRIL
        je devolver_carril3
        cmp posicion_actual, ACERA
        je devolver_acera3
devolver_objetivo3:
		mov DL, OBJETIVO
        jmp devolver3
devolver_carril3:
		mov DL, CARRIL
        jmp devolver3
devolver_acera3:
		mov DL, ACERA
        jmp devolver3
devolver3:
		call colocar_en_mapa
        call pintar_jugador_posicion_actual
        call pintar_jugador_perimetro_x_derecha
        mov BL, [posicion_siguiente]
        mov [posicion_actual], BL
fin_izquierda:
		ret
mover_jugador_derecha:
		mov AH, [xJugador]
		mov AL, [yJugador]
        ;; YA NO PUEDE MOVERSE
        cmp AH, 27
        je fin_derecha
        ;; CONTINÚA MOVIENDO
		inc AH
		push AX
		call obtener_de_mapa
		pop AX
        ;; GUARDAR SIGUIENTE POSICIÓN
        mov posicion_siguiente, DL
        ;; VALIDAR SOBRE QUÉ SUPERFICIE ESTÁ EL JUGADOR
        cmp DL, CARRO1
        je limpiar_posicion_actual
        cmp DL, CARRO2
        je limpiar_posicion_actual
        cmp DL, CARRO3
        je limpiar_posicion_actual
        cmp DL, OBJETIVO
        je posicionar_jugador_a_4
        cmp DL, ACERA
        je posicionar_jugador_a_4
posicionar_jugador_4:
        mov DL, JUGADOR
        jmp continuar4
posicionar_jugador_a_4:
        mov DL, JUGADORA
        jmp continuar4
continuar4:
        ;; POSICIONAR AL JUGADOR EN EL MAPA
        mov [xJugador], AH
		push AX
		call colocar_en_mapa
		pop AX
		;;
		dec AH
        ;; VALIDAR QUÉ OBJETO DEVOLVER
        cmp posicion_actual, OBJETIVO
        je devolver_objetivo4
        cmp posicion_actual, CARRIL
        je devolver_carril4
        cmp posicion_actual, ACERA
        je devolver_acera4
devolver_objetivo4:
		mov DL, OBJETIVO
        jmp devolver4
devolver_carril4:
		mov DL, CARRIL
        jmp devolver4
devolver_acera4:
		mov DL, ACERA
        jmp devolver4
devolver4:
		call colocar_en_mapa
        call pintar_jugador_posicion_actual
        call pintar_jugador_perimetro_x_izquierda
        mov BL, [posicion_siguiente]
        mov [posicion_actual], BL
fin_derecha:
		ret
fin_entrada_juego:
        mov AH, [xJugador]
		mov AL, [yJugador]
        push AX
		call obtener_de_mapa
		pop AX
        cmp DL, CARRO1
        je reiniciar_en_acera
        cmp DL, CARRO2
        je reiniciar_en_acera
        cmp DL, CARRO3
        je reiniciar_en_acera
        jmp fin_fin_entrada_juego
limpiar_posicion_actual:
        mov AH, [xJugador]
		mov AL, [yJugador]
        cmp posicion_actual, CARRIL
        je devolver_carril_salida
        cmp posicion_actual, ACERA
        je devolver_acera_salida
devolver_carril_salida:
		mov DL, CARRIL
        jmp reiniciar_en_acera_salida
devolver_acera_salida:
		mov DL, ACERA
        jmp reiniciar_en_acera_salida
reiniciar_en_acera_salida:
        call colocar_en_mapa
        call pintar_jugador_posicion_actual
reiniciar_en_acera:
        sub [vidas], 01
        call imprimirVidas
        mov [posicion_actual], ACERA
        mov [posicion_siguiente], ACERA
        mov [xJugador], 14
        mov [yJugador], 17
        mov AL, [yJugador]
        mov AH, [xJugador]
        mov DL, JUGADORA
        push AX
		call colocar_en_mapa
		pop AX
        call pintar_jugador_posicion_actual
fin_fin_entrada_juego:
		ret

;; PUNTAJES
generar_puntaje:
		mov AX, 00
		mov [juego_cod_usuario], AX
		mov AH, 2c
		int 21
		mov AX, 0f0f
		and AX, DX
		mov [juego_puntos], AX
		mov AH, 2c
		int 21
		mov AX, 0a0a
		and AX, DX
		mov [juego_tiempo], AX
		;;
		mov AH, 3d
		mov AL, 02
		mov DX, offset juegos_archivo
		int 21
		jc crear_archivo_juegos
		jmp guardar_puntaje
crear_archivo_juegos:
		mov AH, 3c
		mov CX, 00
		mov DX, offset juegos_archivo
		int 21
guardar_puntaje:
		mov BX, AX
		mov AH, 42
		mov AL, 02
		mov CX, 00
		mov DX, 00
		int 21
		mov AH, 40
		mov CX, 0006
		mov DX, offset juego_cod_usuario
		int 21
		mov AH, 3e
		int 21
		jmp menu
;;
;; ORDENAR PUNTAJES
ordenar_puntajes:
		call limpiar_pantalla
		mov SI, offset juegos_archivo
		mov DI, offset copia_puntos
		call copiar_archivo
		;; abrir copia
		mov AH, 3d
		mov AL, 02
		mov DX, offset copia_puntos
		int 21
		mov [handle_a], AX
		call burbuja_archivo
		;; abrir copia de nuevo, 'burbuja_archivo' lo cierra para que se ejecuten los cambios
		mov AH, 3d
		mov AL, 02
		mov DX, offset copia_puntos
		int 21
		mov [handle_a], AX
		call imprimir_juegos_copia
		call limpiar_pantalla
		jmp menu

;; SUMADOR DE PUNTEO
sumador_punteo:
        cmp [vidas], 03
        je sumar100
        cmp [vidas], 02
        je sumar50
        cmp [vidas], 01
        je sumar25
        jmp fin_sumador_punteo
sumar100:
        mov [xContador], 00
bucle_sumar100:
        call incrementarMovs
        inc [xContador]
        cmp [xContador], 64
        jl bucle_sumar100
        jmp fin_sumador_punteo
sumar50:
        mov [xContador], 00
bucle_sumar50:
        call incrementarMovs
        inc [xContador]
        cmp [xContador], 32
        jl bucle_sumar50
        jmp fin_sumador_punteo
sumar25:
        mov [xContador], 00
bucle_sumar25:
        call incrementarMovs
        inc [xContador]
        cmp [xContador], 19
        jl bucle_sumar25
        jmp fin_sumador_punteo
fin_sumador_punteo:
        ret

;; lengthBuffer
;; ENTRADAS
;;    DI -> dirección del buffer
;;;;
lengthBuffer:
		inc DI
		mov AL, [DI]
		ret
;;
imprimirVidas:
		mov DL, 10 ;; X: PANTALLA
        mov DH, 00 ;; Y: PANTALLA
		mov BH, 00
		mov AH, 02
		int 10
        cmp [vidas], 03
        je imprimir3Vidas
        cmp [vidas], 02
        je imprimir2Vidas
        cmp [vidas], 01
        je imprimir1Vidas
        cmp [vidas], 00
        je imprimir0Vidas
		;;
imprimir3Vidas:
		mov DX, offset conteo_vidas3
		mov AH, 09
		int 21
        jmp fin_imprimirVidas
imprimir2Vidas:
		mov DX, offset conteo_vidas2
		mov AH, 09
		int 21
        jmp fin_imprimirVidas
imprimir1Vidas:
		mov DX, offset conteo_vidas1
		mov AH, 09
		int 21
        jmp fin_imprimirVidas
imprimir0Vidas:
		mov DX, offset conteo_vidas0
		mov AH, 09
		int 21
        jmp fin_imprimirVidas
fin_imprimirVidas:
        ret
;;
imprimirPuntos:
		;; <<-- POSICIONAR EL CURSOR
		mov DL, 00        ; COLUMNA
		mov DH, 00        ; FILA
		mov BH, 00        ; NÚMERO DE PÁGINA
		mov AH, 02
		int 10
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset movimientosM
		mov AH, 09
		int 21
		pop DX
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset movimientosC
		mov AH, 09
		int 21
		pop DX
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset movimientosD
		mov AH, 09
		int 21
		pop DX
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset movimientosU
		mov AH, 09
		int 21
		pop DX
		ret
;;
imprimirPuntos_GameOver:
		;; <<-- POSICIONAR EL CURSOR
		mov DL, 0f        ; COLUMNA
		mov DH, 09        ; FILA
		mov BH, 00        ; NÚMERO DE PÁGINA
		mov AH, 02
		int 10
		push DX
		mov DX, offset game_over_msg
		mov AH, 09
		int 21
		pop DX
		;; <<-- POSICIONAR EL CURSOR
		mov DL, 11        ; COLUMNA
		mov DH, 10        ; FILA
		mov BH, 00        ; NÚMERO DE PÁGINA
		mov AH, 02
		int 10
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset movimientosM
		mov AH, 09
		int 21
		pop DX
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset movimientosC
		mov AH, 09
		int 21
		pop DX
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset movimientosD
		mov AH, 09
		int 21
		pop DX
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset movimientosU
		mov AH, 09
		int 21
		pop DX
		ret

reiniciarPunteo:
		mov [movimientosM], 30
		mov [movimientosC], 30
		mov [movimientosD], 30
		mov [movimientosU], 30
		ret

incrementarMovs:
		cmp [movimientosU], 39
		je incrementarDecenasUnits
		inc movimientosU
		ret
incrementarDecenasUnits:
		mov [movimientosU], 30
		cmp [movimientosD], 39
		je incrementarCentenasUnits
		inc movimientosD
		ret
incrementarCentenasUnits:
		mov [movimientosD], 30
		cmp [movimientosC], 39
		je incrementarMilesUnits
		inc movimientosC
		ret
incrementarMilesUnits:
		mov [movimientosC], 30
		inc movimientosM
		ret

imprimirIniciales:
		;; <<-- POSICIONAR EL CURSOR
		mov DL, 00        ; COLUMNA
		mov DH, 18        ; FILA
		mov BH, 00        ; NÚMERO DE PÁGINA
		mov AH, 02
		int 10
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset iniciales
		mov AH, 09
		int 21
		pop DX
		ret

imprimirTiempo:
		;; <<-- POSICIONAR EL CURSOR
		mov DL, 23        ; COLUMNA
		mov DH, 00        ; FILA
		mov BH, 00        ; NÚMERO DE PÁGINA
		mov AH, 02
		int 10
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset tiempoDM
		mov AH, 09
		int 21
		pop DX
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset tiempoUM
		mov AH, 09
		int 21
		pop DX
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset dospuntos
		mov AH, 09
		int 21
		pop DX
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset tiempoDS
		mov AH, 09
		int 21
		pop DX
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset tiempoUS
		mov AH, 09
		int 21
		pop DX
		ret

limpiarTiempo:
		mov [tiempoUS], 30
		mov [tiempoDS], 30
		mov [tiempoUM], 30
		mov [tiempoDM], 30
		ret

incrementarTiempo:
		cmp [retardoTiempo], 4000
		je incrementarTiempo1
		ret
incrementarTiempo1:
		mov [retardoTiempo], 00
		cmp [tiempoUS], 39
		je incrementarDecenasSegundos
		inc tiempoUS
		ret
incrementarDecenasSegundos:
		mov [tiempoUS], 30
		cmp [tiempoDS], 35
		je incrementarUnidadesMinutos
		inc tiempoDS
		ret
incrementarUnidadesMinutos:
		mov [tiempoDS], 30
		cmp [tiempoUM], 39
		je incrementarDecenasMinutos
		inc tiempoUM
		ret
incrementarDecenasMinutos:
		mov [tiempoUM], 30
		inc tiempoDM
		ret

errorArchivo:
		;; <<-- POSICIONAR EL CURSOR
		mov DL, 08        ; COLUMNA
		mov DH, 0b        ; FILA
		mov BH, 00        ; NÚMERO DE PÁGINA
		mov AH, 02
		int 10
		;; IMPRESIÓN DEL MENSAJE
		push DX
		mov DX, offset errorAbrirArchivo
		mov AH, 09
		int 21
		pop DX
		ret

;; escribir_usuario - escribe un usuario en el archivo USRS.ACE
;; ENTRADA:
;;   - [usuario_nombre] -> nombre del usuario
;;   - ...
escribir_usuario:
		mov AH, 3d
		mov AL, 02
		mov DX, offset usuarios_archivo
		int 21
		jc crear_archivo
		jmp escribir_estructura_usuario
crear_archivo:
		mov AH, 3c
		mov CX, 0000
		mov DX, offset usuarios_archivo
		int 21
escribir_estructura_usuario:
		;; posicionar en el final del archivo
		mov BX, AX   ; handle
		mov AL, 02
		mov CX, 0000
		mov DX, 0000
		mov AH, 42
		int 21
		;; guardar el usuario
		mov AH, 40
		mov CX, 002f
		mov DX, offset usuario_nombre
		int 21
		;; cerrar archivo
		mov AH, 3e
		int 21
		ret

;; copiar_dato - copia el contenido del buffer en el campo indicado
;; ENTRADA:
;;   - AL -> tamaño del campo
;;   - DI -> direccion del campo
copiar_dato:
		mov CX, 0000
		mov CL, AL
		mov AH, 00
		push DI
ciclo_limpiar_dato:
		mov [DI], AH
		inc DI
		loop ciclo_limpiar_dato
		pop DI
		;;
		mov SI, offset buffer_entrada
		inc SI
		mov AL, [SI]
		mov CX, 0000
		mov CL, AL
		inc SI
ciclo_copiar_dato:
		mov AL, [SI]
		mov [DI], AL
		inc DI
		inc SI
		loop ciclo_copiar_dato
		ret

;; copiar_archivo - copia un archivo
;; ENTRADA:
;;   SI -> nombre del archivo origen
;;   DI -> nombre del archivo destino
;; SALIDA:
copiar_archivo:
		;; abrir archivo origen
		mov AH, 3d
		mov AL, 00
		mov DX, SI
		int 21
		;
		mov BX, AX
		mov [handle_a], BX
		;; obtener tamaño de archivo origen
		mov AH, 42
		mov AL, 02
		mov CX, 00
		mov DX, 00
		int 21
		;; AX -> tamaño del archivo en bytes
		mov [tam_archivo_origen], AX
		;; reestablecer puntero de archivo
		mov AH, 42
		mov AL, 00
		mov CX, 00
		mov DX, 00
		int 21
		;; abrir o crear archivo destino
		mov AH, 3d
		mov AL, 01
		mov DX, DI
		int 21
		jc crear_archivo_para_copiar
		jmp guardar_handle_b
crear_archivo_para_copiar:
		mov AH, 3c
		mov CX, 0000
		mov DX, DI
		int 21
		;
guardar_handle_b:
		mov [handle_b], AX
		;; truncar archivo destino
		mov AH, 40
		mov BX, [handle_b]
		mov CX, 00
		mov DX, offset un_byte
		int 21
		;; inicializar contador
		mov CX, [tam_archivo_origen]
ciclo_copiar_archivo:
		push CX
		;; leer un byte
		mov AH, 3f
		mov BX, [handle_a]
		mov CX, 0001
		mov DX, offset un_byte
		int 21
		;; copiar un byte
		mov AH, 40
		mov BX, [handle_b]
		mov CX, 0001
		mov DX, offset un_byte
		int 21
		;;
		pop CX
		loop ciclo_copiar_archivo
		;; cerrar archivos
		mov AH, 3e
		mov BX, [handle_a]
		int 21
		mov AH, 3e
		mov BX, [handle_b]
		int 21
		ret

;; obtener_cantidad_de_registros
obtener_cantidad_de_registros:
		mov AH, 42
		mov AL, 02
		mov BX, [handle_a]
		mov CX, 00
		mov DX, 00
		int 21
		mov DX, 00
		mov CX, 0006
		div CX
		mov [cantidad_registros], AX
		ret

;; inicializar puntero de archivo
inicializar_puntero_de_archivo:
		mov AH, 42
		mov AL, 00
		mov BX, [handle_a]
		mov CX, 00
		mov DX, 00
		int 21
		ret

leer_juego:
		mov AH, 3f
		mov BX, [handle_a]
		mov CX, 0006
		mov DX, offset juego_cod_usuario
		int 21
		ret

;; verificar_intercambio
verificar_intercambio:
		call leer_juego
		mov AX, [juego_puntos]
		mov [numero_a], AX
		call leer_juego
		mov AX, [juego_puntos]
		mov [numero_b], AX
		mov AX, [numero_a]
		cmp AX, [numero_b]
		jbe retornar_no_intercambio
		;;
		mov AL, 01
		mov [hubo_intercambio], AL
		ret
retornar_no_intercambio:
		mov AL, 00
		ret

;; burbuja_archivo - ejecuta el algoritmo burbuja en un archivo abierto
;; ENTRADA:
;;   - [handle_a] -> handle del archivo a ordenar
burbuja_archivo:
		mov AX, 0000
		mov [indice_burbuja], AX
		mov [hubo_intercambio], AL
		;;
		call obtener_cantidad_de_registros
		;;
repetir_burbuja:
		call inicializar_puntero_de_archivo
		mov CX, [cantidad_registros]
		mov AL, 00
		mov [hubo_intercambio], AL
		mov AX, 0000
		mov [indice_burbuja], AX
ciclo_burbuja_archivo:
		push CX
		;; posicionarse en el registro actual dentro del archivo
		mov AX, [indice_burbuja]
		mov DX, 0006
		mul DX
		;;
		mov DX, AX
		mov AH, 42
		mov AL, 00
		mov BX, [handle_a]
		mov CX, 00
		int 21
		;;
		call verificar_intercambio
		cmp AL, 01
		je intercambiar
		jmp siguiente_iteracion
		;;
intercambiar:
		mov AX, [indice_burbuja]
		mov DX, 0006
		mul DX
		;; AX -> posición del registro actual en el archivo
		mov DX, AX
		mov AH, 42
		mov AL, 00
		mov BX, [handle_a]
		mov CX, 00
		int 21
		;;
		call leer_juego
		mov AX, [juego_cod_usuario]
		mov [juego_tmp_cod_usuario], AX
		mov AX, [juego_puntos]
		mov [juego_tmp_puntos], AX
		mov AX, [juego_tiempo]
		mov [juego_tmp_tiempo], AX
		call leer_juego
		;;
		mov AH, 42
		mov AL, 01
		mov BX, [handle_a]
		mov CX, 00
		mov DX, 00
		int 21
		;; DX-AX -> posición actual
		mov CX, 000c
		sub AX, CX
		;;
		mov DX, AX
		mov AH, 42
		mov AL, 00
		mov BX, [handle_a]
		mov CX, 00
		int 21
		;; escribimos el registro siguiente en la posición actual
		mov AH, 40
		mov BX, [handle_a]
		mov CX, 0006
		mov DX, offset juego_cod_usuario
		int 21
		;; escribimos el registro actual en la posición siguiente
		mov AH, 40
		mov BX, [handle_a]
		mov CX, 0006
		mov DX, offset juego_tmp_cod_usuario
		int 21
		;;
siguiente_iteracion:
		inc [indice_burbuja]
		pop CX
		loop hacer_ciclo_burbuja
		jmp no_hacer_ciclo_burbuja
hacer_ciclo_burbuja:
		jmp ciclo_burbuja_archivo
no_hacer_ciclo_burbuja:
		;; verificar si se debe iterar de nuevo
		mov AL, [hubo_intercambio]
		cmp AL, 01
		je repetir_burbuja
		;; cerrar archivo
		mov AH, 3e
		mov BX, [handle_a]
		int 21
		ret

;; numAstr - convierte un número entero en cadena
;;     Entrada: AX -> numero de entrada
;;     Salida:  [numero] -> el número convertido a cadena
numAstr:                                ;;; Limpiar la cadena
                mov CX, 06h
                mov BX, offset numero
                mov DX, 30h
limpiar:        mov [BX], DL
                inc BX
                loop limpiar
                dec BX                   ;;; Posicionarse en el caracter de las unidades
                cmp AX, 0000h            ;;; Si el número es 0 no hacer nada
                je retorno
		jg unidad
		neg AX
		mov DL, 2d
		mov [numero], DL
unidad:         mov DL,[BX]              ;;; Incrementar las unidades
                inc DL
                mov [BX],DL
                dec AX                   ;;; Decrementar el número de entrada
                mov SI, BX               ;;; Guardar el dato de la posición de las unidades en otro registro
revisar_cifra:  mov DX, 3ah              ;;; Si en las unidades está el caracter 3Ah o :
                cmp [BX], DL
                je incrementa_ant        ;;; Saltar a la parte donde se incrementa la cifra anterior
                mov BX, SI               ;;; Restablecer la posición de las unidades en el registro original
                cmp AX, 0000h            ;;; Si el número de entrada no es 0
                jne unidad               ;;; Volver a incrementar unidades
                jmp retorno              ;;; Si no terminar rutina
incrementa_ant: mov DX, 30h              ;;; Se coloca el caracter '0' en la cifra actual
                mov [BX], DL
                dec BX                   ;;; Se mueve el índice a la cifra anterior
                mov DL, [BX]             ;;; Se incrementa la cifra indexada por BX
                inc DL
                mov [BX], DL
                cmp BX, offset numero    ;;; Si el índice actual no es la direccion de la primera cifra
                jne revisar_cifra        ;;; revisar la cifra anterior para ver si nuevamente hay que incrementarla
                mov BX, SI               ;;; Reestablecer la posición de las unidades en el registro original
                cmp AX, 0000h            ;;; Si el número de entrada no es 0
                jne unidad               ;;; Volver a incrementar unidades
retorno:        ret                      ;;; Si no retornar

;; imprimir_juegos_copia - imprime algunos registro de un archivo de juegos
imprimir_juegos_copia:
		mov AL, 00
		mov [fila_texto], AL
		call limpiar_pantalla
		call obtener_cantidad_de_registros
		;;
		mov AH, 42
		mov AL, 00
		mov BX, [handle_a]
		mov CX, 00
		mov DX, 00
		int 21
		;;
		mov CX, [cantidad_registros]
		mov BP, 0005
ciclo_imprimir_juegos_copia:
		push CX
		call leer_juego
		;; codigo
		inc [fila_texto]
		mov DH, [fila_texto]
		mov DL, 01
		mov BH, 00
		mov AH, 02
		int 10
		mov AH, 09
		mov DX, offset cadena_mostrar_cod_usuario
		int 21
		int 03
		mov AX, [juego_cod_usuario]
		call numAstr
		mov AH, 09
		mov DX, offset numero
		int 21
		;; puntos
		inc [fila_texto]
		mov DH, [fila_texto]
		mov DL, 01
		mov BH, 00
		mov AH, 02
		int 10
		mov AH, 09
		mov DX, offset cadena_mostrar_cod_puntos
		int 21
		mov AX, [juego_puntos]
		call numAstr
		mov AH, 09
		mov DX, offset numero
		int 21
		;; tiempo
		inc [fila_texto]
		mov DH, [fila_texto]
		mov DL, 01
		mov BH, 00
		mov AH, 02
		int 10
		mov AH, 09
		mov DX, offset cadena_mostrar_cod_tiempo
		int 21
		mov AX, [juego_tiempo]
		call numAstr
		mov AH, 09
		mov DX, offset numero
		int 21
		;; separador
		inc [fila_texto]
		mov DH, [fila_texto]
		mov DL, 01
		mov BH, 00
		mov AH, 02
		int 10
		mov AH, 09
		mov DX, offset cadena_separador
		int 21
		;;
		;;
		dec BP
		cmp BP, 0000
		jne hacer_ciclo_imprimir_juegos_copia
		;; ayuda
		inc [fila_texto]
		inc [fila_texto]
		mov DH, [fila_texto]
		mov DL, 01
		mov BH, 00
		mov AH, 02
		int 10
		mov AH, 09
		mov DX, offset cadena_ayuda
		int 21
		;;;
		mov AH, 08
		int 21
		;;
		call limpiar_pantalla
		mov AL, 00
		mov [fila_texto], AL
		mov BP, 0005
hacer_ciclo_imprimir_juegos_copia:
		pop CX
		loop otra_iteracion_imprimir
		jmp retorno_imprimir
otra_iteracion_imprimir:
		jmp ciclo_imprimir_juegos_copia
retorno_imprimir:
		;; cerrar archivo
		mov AH, 3e
		mov BX, [handle_a]
		int 21
		;;
		inc [fila_texto]
		mov DH, [fila_texto]
		mov DL, 01
		mov BH, 00
		mov AH, 02
		int 10
		mov AH, 09
		mov DX, offset cadena_ayuda_fin
		int 21
		;;;
		mov AH, 08
		int 21
		;;
		ret

fin:
.EXIT
END