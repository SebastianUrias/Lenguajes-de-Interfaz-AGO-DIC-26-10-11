; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez

INCLUDE Irvine32.inc
.data
.code
main PROC

    mov eax, 0

; 1 - SHL: Desplazamieto de un bit hacia a la izquierda
    mov al, 10000010b
    shl al, 1

    ;call DumpRegs
    ;call WriteBin
    ;call Crlf

    
; 2 - SHR: Desplazamiento de un bit hacia la derecha
    mov al, 00001001b
    shr al, 2
    ;shl al, 2

    ;call DumpRegs
    ;call WriteBin
    ;call Crlf


; 3 - Desplazamiento con signo
    mov al, -8
    sar al, 1

    ;call DumpRegs
    ;call WriteBin

; 4 - Desplazamiento con constante
    ;mov al, 00001100b
    ;shl, 2

; 5 - Desplazamiento con cl
    ;mov al, 00010100b
    ;mov cl, 2
    ;shr, cl    

; ROL, ROR, RCL, RCR
;10000001b
; clc limpia los flags
; 6 - Rotacion a la izquierda
    mov al, 10000001b
    rol al, 1
    call DumpRegs
    call WriteBin
    call Crlf

; 7 - Rotacion a la derecha


    exit
main ENDP
END main