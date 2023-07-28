;
; Conteo 09.asm
;
; Created: 16/05/2023 21:07:20
; Author : varga
;


; Replace with your application code
.include "m328pdef.inc"  ; Archivo de definiciones del ATmega328p

.def temp = R16   ; Registro temporal para almacenar el valor del contador

.cseg
.org 0x0000  ; Dirección de inicio del programa

RESET:
    ldi temp, low(RAMEND)   ; Configura el registro SP para la memoria RAM
    out SPL, temp
    ldi temp, high(RAMEND)
    out SPH, temp

    ldi temp, 0xFF   ; Configura el puerto B como salida para el display
    out DDRB, temp

    ldi temp, 0   ; Inicializa el contador en 0
    out PORTB, temp   ; Muestra el valor inicial en el display

MAIN:
    ; Mostrar el valor del contador en el display
    out PORTB, temp   ; Muestra el valor en el puerto B

    ; Incrementar el contador
    subi temp, 1   ; Incrementa el valor en el registro temp

    ; Comprueba si el contador ha alcanzado 10 (valor máximo)
    cpi temp, 10
    breq RESET   ; Reinicia el contador si es igual a 10

    rjmp MAIN   ; Vuelve al bucle principal
