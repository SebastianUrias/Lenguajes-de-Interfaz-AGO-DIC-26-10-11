INCLUDE Irvine32.inc

.data
    msgEntrada BYTE "Ingrese cantidad de autos ",0
    msgOcupados BYTE "Espacios ocupados ",0
    msgDisponibles BYTE "Espacios disponibles ",0
    msgLleno BYTE "Estacionamiento lleno",0
    msgExceso BYTE "No hay suficientes espacios disponibles",0
    msgInvalido BYTE "Cantidad invalida",0

    capacidad = 20
    ocupados DWORD 0

.code

main PROC

ingresar:

    mov edx, OFFSET msgEntrada
    call WriteString

    call ReadInt

    cmp eax, 0
    jle invalido

    mov ebx, eax

    mov eax, ocupados
    add eax, ebx

    cmp eax, capacidad
    jg exceso

    mov ocupados, eax

    mov edx, OFFSET msgOcupados
    call WriteString

    mov eax, ocupados
    call WriteDec
    call Crlf

    mov eax, ocupados
    cmp eax, capacidad
    je lleno

    mov edx, OFFSET msgDisponibles
    call WriteString

    mov eax, capacidad
    sub eax, ocupados
    call WriteDec
    call Crlf
    call Crlf

    jmp ingresar


exceso:

    mov edx, OFFSET msgExceso
    call WriteString
    call Crlf
    call Crlf

    jmp ingresar


invalido:

    mov edx, OFFSET msgInvalido
    call WriteString
    call Crlf
    call Crlf

    jmp ingresar


lleno:

    mov edx, OFFSET msgLleno
    call WriteString
    call Crlf


fin:

    exit

main ENDP

END main