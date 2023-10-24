# Práctica 2 - ASM
## 1. Manual de Usuario

Se mostrará un menú con las funcionalidades requeridas para la realización de las operaciones

<p align="center">
    <img src="Img/6.png" width="350px">
</p>

1.1. Modo Calculadora

Se debe ingresar un operando seguido del signo de la operación que se desee realizar, se podrán realizar todas las operaciones que sean necesarias y para obtener el resultado final se debe ingresar el signo "="

<p align="center">
    <img src="Img/7.png" width="350px">
</p>

1.2. Factorial

Se debe ingresar el número al cuál se desea calcular el factorial. Se permite calculaar el factorial únicamente de números del rango de 0 a 4

<p align="center">
    <img src="Img/8.png" width="350px">
</p>

## 2. Manual Técnico

### Funcionalidad Principal
A continuación, se describen las principales funcionalidades del programa:

**Menú Principal**

Al inicio del programa, se muestra un menú principal que permite al usuario elegir entre varias opciones, incluyendo cargar un archivo, ingresar al modo calculadora, calcular factoriales, crear un reporte o salir del programa.

**Cargar Archivo**

Si el usuario selecciona la opción "Cargar Archivo", el programa solicita el nombre del archivo a cargar y procede a abrirlo. Sin embargo, en el código proporcionado, la funcionalidad real de carga de archivos no está implementada, por lo que este proceso es un bucle infinito que regresa al menú principal.

**Modo Calculadora**

El modo calculadora permite al usuario realizar operaciones matemáticas simples, como suma, resta, multiplicación y división. El programa solicita dos operandos y un operador (+, -, *, /) para realizar la operación. El resultado se muestra en pantalla.

**Cálculo de Factoriales**

Si el usuario selecciona la opción "Factorial" en el menú principal, el programa solicita un número y calcula su factorial. Los factoriales de números del 0 al 4 se calculan y se muestran en pantalla.