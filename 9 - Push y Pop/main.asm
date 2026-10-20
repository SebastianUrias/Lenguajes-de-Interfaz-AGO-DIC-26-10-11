; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez

INCLUDE Irvine32.inc
; 11 - Push y Pop
.data
.code
main PROC
    mov eax, 20

    push eax

    nop

    mov ebx, 0

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

    pop eax
    pop ebx
    pop ecx

    ; BLOQUE 3: CONSERVAR REGISTROS

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