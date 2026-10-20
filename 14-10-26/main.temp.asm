INCLUDE c:\Users\sebas\.vscode\extensions\istareatscreens.masm-runner-0.9.1\native\irvine\Irvine32.inc
.data
.code
main PROC

    mov eax, 0

; SHL: Desplazamieto de un bit hacia a la izquierda
    mov al, 00000110b
    shl al, 1

    call WriteBin
    call Crlf

exit
main ENDP
END main