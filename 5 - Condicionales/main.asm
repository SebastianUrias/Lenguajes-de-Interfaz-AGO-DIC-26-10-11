; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Esta practica nos enseña el uso de condiciones para los ciclos
; y como el utilizar condiciones basadas en valores cambia el bucle

INCLUDE Irvine32.inc
.data
.code
main PROC
    ;   ebx se usa como contador para los ciclos while y do while
    mov ebx, 1

cicloWhile:
    ;   esta es la condicion del ciclo while, si ebx es mayor a 100 se sale del ciclo
    cmp ebx, 100 
    jg fin 
    ;   si ebx es menor o igual a 100 se imprime el valor de ebx
    mov eax, ebx
    call WriteDec 
    call Crlf 

    ;   se incrementa ebx en 1
    inc ebx 
    ;   se regresa al inicio del ciclo while
    jmp cicloWhile 

fin:
    call Crlf 
    ;   empieza el ciclo do while, se imprime el valor de ebx y luego se incrementa en 1
    mov ebx, 1 
cicloDoWhile:
    ;   se imprime el valor de ebx
    mov eax, ebx 
    call WriteDec 
    call Crlf 
    ;   se incrementa ebx en 1
    inc ebx
    ;   se compara ebx con 100, si es menor o igual a 100 se regresa al inicio del ciclo do while
    cmp ebx, 100 
    ;   si ebx es menor o igual a 100 se regresa al inicio del ciclo do while
    jle cicloDoWhile 
    exit 
main ENDP

END main