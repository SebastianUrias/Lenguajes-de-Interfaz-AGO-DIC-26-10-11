; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez

INCLUDE Irvine32.inc
.code
main PROC
    ;   asignamos el valor a eax
    mov eax, 5
    ;   jmp es la instrucción de salto incondicional, que nos permite saltar a otra parte del código, continuar es el nombre de la funcion
    jmp continuar
    ;   asignamos el valor a eax
    mov eax, 10

    continuar: 
    ;   vamos mostrando el cambio de eax mediante la funcion DumpRegs
    call DumpRegs
    exit 
main ENDP

END main