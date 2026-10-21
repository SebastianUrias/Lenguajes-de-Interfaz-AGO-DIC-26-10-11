; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez

INCLUDE Irvine32.inc
.data
.code
main PROC
    ; le damos el valor de 20 a eax y lo guardamos en la pila
    mov eax, 20

    push eax

    nop
    ; se le pone 0 a ebx
    mov ebx, 0

    ; se saca el valor de la pila y se guarda en ebx
    pop ebx

    nop


    ; BLOQUE 2: LIFO

    mov eax, 10 ; ESP + 8
    push eax

    mov eax, 20 ; ESP + 4
    push eax

    mov eax, 30 ; ESP
    push eax

    nop
    ;   los valors se sacan de la pila en orden inverso al que se pusieron, ya que la pila es LIFO (Last In First Out)
    ;   se saca el valor de la pila y se guarda en eax
    pop eax
    ;   se saca el valor de la pila y se guarda en ebx
    pop ebx
    ;   se saca el valor de la pila y se guarda en ecx
    pop ecx

    ; BLOQUE 3: CONSERVAR REGISTROS
    ; se guardan los valores de eax y ebx en la pila para conservarlos
    mov eax, 100
    mov ebx, 200

    push eax
    push ebx

    mov eax, 999
    mov ebx, 666

    pop ebx
    pop eax

    ; BLOQUE 4: CALL Y RET

    mov eax, 111
    mov ebx, 222
    ;   
    call aumentarDiez



    nop

    exit
main ENDP

aumentarDiez PROC
    push ebx

    mov ebx, 10
    add eax, ebx

    pop ebx

    ret
aumentarDiez ENDP

END main