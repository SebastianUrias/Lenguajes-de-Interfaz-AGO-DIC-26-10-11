INCLUDE Irvine32.inc

.data
mensaje BYTE "Escribe tu nombre: ",0

nombre Byte 15 DUP(0)

.code 
main PROC
    mov edx, OFFSET mensaje
    call WriteString


    mov edx, OFFSET nombre
    mov ecx, SIZEOF nombre 

    call ReadString
    call Crlf

    mov edx, OFFSET nombre
    call WriteString
    call Crlf
    exit

main ENDP
END main