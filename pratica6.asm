; Pratica 6 - Sensor de presenca
; Programador: Francisco Edno
;
; Projeto de lampada inteligente. Quando o sensor de presenca reconhece
; uma pessoa, uma lampada e acessa por 3 segundos.
;
; Relay: p2.0
; Sensor: p2.1

; *****************************************************************************
; EQUATES
; *****************************************************************************
RELAY   equ     p2.0
SENSOR  equ     p2.1

; *****************************************************************************
; Main
; *****************************************************************************
Main:   jnb     SENSOR, On  ; sensor = 1 ?
        setb    RELAY       ; nao: desliga o rela
        ajmp    Main        ; Volta para o inicio

On:     clr     RELAY       ; liga o rele
        jnb     SENSOR, $  ; aguarda o sensor mudar o estado
        acall   Time        ; tempo de 3 segundos
        setb    RELAY       ; desliga o rele

        ajmp    Main

; *****************************************************************************
; SUB-ROTINAS
; *****************************************************************************

; -----------------------------------------------------------------------------
; Delay
; -----------------------------------------------------------------------------
; Delay de 0.1s
; Registradores: r4, r5
; -----------------------------------------------------------------------------
Delay:  mov     r4, #200
Back:   mov     r5, #250
        djnz    r5, $
        djnz    r4, Back
        ret

; -----------------------------------------------------------------------------
; Time
; -----------------------------------------------------------------------------
; Tempo de 1s
; Registradores: r3
; -----------------------------------------------------------------------------
Time:   mov     r3, #30
Back2:  acall   Delay
        djnz    r3, Back2
        ret

        end
