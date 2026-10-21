INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez

.data
mensaje BYTE "Escribe tu nombre: ",0

nombre Byte 15 DUP(0)   ; se reservan 15 bytes para el nombre a escribir

.code 
main PROC
    ;   se muestra el mensaje en pantalla, offset mensaje es la dirección de memoria donde se encuentra el mensaje
    mov edx, OFFSET mensaje
    call WriteString

    ;   se lee el nombre del usuario y se almacena en la variable nombre
    mov edx, OFFSET nombre
    ;   con el sizeoff se saca el tamaño de nombre y se le pasa a la función ReadString para que no se desborde el buffer
    mov ecx, SIZEOF nombre 
    ;    readstring lee la cadena de caracteres y la almacena en la variable nombre
    call ReadString
    call Crlf
    ;   se muestra el mensaje en pantalla, offset nombre es la dirección de memoria donde se encuentra el nombre
    mov edx, OFFSET nombre
    call WriteString
    call Crlf
    exit

main ENDP
END main