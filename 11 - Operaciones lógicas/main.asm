; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 -11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Esta practica nos enseña como realizar operaciones logicas con bits y como estas afectan el valor de las variables.

INCLUDE Irvine32.inc

.data
msg1 BYTE "Alarma Apagada", 0
msg2 BYTE "Alarma Encendida", 0
; Estados de Computadora
; 0 - compu encendida o apagada
; 1 - alarma
; 2 - conectada a inter
; Estados 0: apagado, 1: Encendido

; Estado inicial:
; 0000 0101
.code

main PROC

; 1 - Operacion AND: Evaluacion de estado de alarma

    mov eax, 0
    mov al, 00000101b
    and al ,00000010b
    
    call WriteBin ; Imprime los 32 BIts
    call Crlf
    nop

; 2 - Operacion OR: Enceder Alarma
    mov eax, 0
    mov al, 00000101b
    or al, 00000010b

    call WriteBin
    call Crlf
    nop

; 3 - Operacion XOR: Apagar y encender la computadora
    mov eax, 0
    mov al, 00000101b
    xor al, 00000001b

    call WriteBin
    call Crlf

    mov eax, 0
    mov al, 00000101b
    xor al, 00000001b

    call WriteBin
    call Crlf
    nop

; 4 - Operacion TEST: Evaluar la alarma encendida y apagada
; Mandar mensaje de alarma encendida o alarma apagada

    test al, 00000010b
    ;   si test fue cero salta a la alarmaApagada, si no a alarmaEncendida
    jz alarmaApagada
    jmp alarmaEncendida

alarmaApagada:
    mov edx, OFFSET msg1
    call WriteString
    call Crlf
    jmp fin

alarmaEncendida:
    mov edx, OFFSET msg2
    call WriteString
    call Crlf

fin:
    exit

main ENDP
END main