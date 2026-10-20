INCLUDE Irvine32.inc
.code
main PROC
    mov eax, 12AB34CDh
    mov ecx, 8

ciclo:
    mov edx, eax
    shr edx, 28     ; lleva el nibble más significativo a los 4 bits bajos
    and edx, 0Fh    ; conserva solo ese nibble
    cmp edx, 9
    jbe esDigito
    add edx, 'A' - 10   ; 10–15
    jmp mostrar

esDigito:
    add edx, '0'    ; 0–9

mostrar:
    push eax ; 
    push ecx    ; ecx y eax se usan en WriteChar
    mov al, dl
    call WriteChar ; lee el dl
    pop ecx
    pop eax
    shl eax, 4      ; siguiente nibble
    loop ciclo

    call Crlf
    exit
main ENDP
END main