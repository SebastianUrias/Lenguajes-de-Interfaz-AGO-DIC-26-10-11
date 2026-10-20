INCLUDE Irvine32.inc

.data
tmArchivo DWORD 100000
NumBloques DWORD 125
tmBloque DWORD 512
tmGrupo DWORD 1024

bytesdec DWORD ?
bytespen DWORD ?
porcentaje DWORD ?
residuo DWORD ?
grupos DWORD ?

msgbytedec BYTE "Bytes descargados: ", 0
msgpen BYTE "Bytes Pendientes"
buffer BYTE 11 DUP(0) ; se reservan 11 espacios? creo
.code
main Proc
; bytes recividos son los bloques por 512
mov eax ,NumBloques
mul tmBloque
mov bytesdec, eax

call WriteDec
call Crlf
; faltantes
mov eax, tmArchivo
sub eax, bytesdec
mov bytespen, eax

call WriteDec
call Crlf

; porcentaje
mov eax, bytesdec
mov ebx, 100
mul ebx
div tmArchivo
mov porcentaje, eax

call WriteDec
call Crlf
exit
main ENDP 
END main