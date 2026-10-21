INCLUDE Irvine32.inc
.data
mensajeEntrada BYTE "Escribe tu nombre: ",0
mensajeLongitud BYTE "Caracteres capturados:" , 0

nombre BYTE 30 DUP (0)
longitud DWORD ?

.code 
main PROC
    mov edx, OFFSET mensajeEntrada
    call WriteString

    mov edx, OFFSET nombre 
    mov edc, SIZEOF nombre
    call ReadString
    call Crlf

    mov longitud eax
    call Crlf

    nov edx, OFFSET nombre
    call ReadString
    call Crlf

    mov edx, OFFSET mensajeLongitud 
    call WriteString

    mov eax, longitud
    call WriteString
    call Crlf
    exit
main ENDP
END main