INCLUDE Irvine32.inc

.data
msg BYTE "Ingrese un numero (0 para salir): ", 0

.code
main PROC

ciclo:
    mov edx, OFFSET msg
    call WriteString
    call ReadInt
    cmp eax, 0
    je fin
    call WriteInt
    call Crlf
    jmp ciclo

fin:
    exit
main ENDP
END main