; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 - 11
; Docente: J\ose Luis Medina Jimenez
; Descripcion: Esta practica nos muestra como usar comparaciones y saltos a la vez

INCLUDE Irvine32.inc
.data
;Mensajes para pedir la entrada de datos
msgIngresar1 BYTE "Ingresa el primer valor: ", 0
msgIngresar2 BYTE "Ingresa el segundo valor: ", 0
;Mensajes para mostrar el resultado de la comparación
msgMayor   BYTE "El primer numero es mayor.", 0
msgMenor   BYTE "El primer numero es menor.", 0
msgIguales BYTE "Los numeros son iguales.", 0

.code
main PROC

    mov edx, OFFSET msgIngresar1 
    call WriteString
    ;   ReadInt lee un valor entero y lo almacena en EAX 
    call ReadInt 
    ;   Se guarda el valor en ecx porque se volverá a usar ReadInt y se sobreescribirá el valor en EAX
    mov ecx, eax
    ;   Se despliega el mensaje para ingresar el segundo valor
    mov edx, OFFSET msgIngresar2 
    call WriteString 
    call ReadInt 
    mov ebx, eax 
    mov eax, ecx 
    cmp eax, ebx 
    jg mayor
    jl menor
    ;   en caso de que la comparación de mayor o menor no se cumpla, se va directamente al mensaje de iguales
    mov edx, OFFSET msgIguales
    call WriteString
    jmp fin ;   salta a la etiqueta fin para terminar el programa

    mayor:
        mov edx, OFFSET msgMayor ;  muestra el mensaje de que el primer número es mayor
        call WriteString 
        jmp fin
    
    menor:
        mov edx, OFFSET msgMenor ;  muestra el mensaje de que el primer número es menor
        call WriteString 

    fin: 
        call Crlf
        exit

main ENDP
END main