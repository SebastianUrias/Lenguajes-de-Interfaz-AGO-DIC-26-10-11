; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez


INCLUDE Irvine32.inc
.data
.code
main PROC
    ; ecx es la variable que se usara como contador para el ciclo
    mov ecx, 5
ciclo:
    ; imprime el valor de ecx
    mov eax, ecx
    ; impirme el valor de eax en decimal
    call WriteDec
    call Crlf
    ; decrementa el valor de ecx en 1
    loop ciclo
    exit
main ENDP
END main 