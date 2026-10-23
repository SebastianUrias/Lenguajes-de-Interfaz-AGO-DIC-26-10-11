; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez

INCLUDE Irvine32.inc

.data
msg BYTE "Ingrese un numero (0 para salir): ", 0

.code
main PROC

ciclo:
    ;   Imprimimos el mensaje y leemos nuestro numero
    mov edx, OFFSET msg
    call WriteString
    call ReadInt
    ;   Comparamos con 0 y saltamos a fin si el resultado es igual a 0,
    ;   en caso contrario escribimos el numero damos el salto de linea para continuar con el ciclo
    cmp eax, 0
    je fin
    call WriteInt
    call Crlf
    jmp ciclo

fin:
    exit
main ENDP
END main