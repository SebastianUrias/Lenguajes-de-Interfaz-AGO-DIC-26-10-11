; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Esta practica nos muestra como aumentar o disminuir el valor de una variable con los comandos INC y DEC y como esto afecta el flujo del programa.

INCLUDE Irvine32.inc

.data 
    msgPIN BYTE "Ingrese la clave: ",0
    msgError BYTE "Clave Incorrecta.",0
    msgAcceso BYTE "Acceso permitido",0
    msgBloqueo BYTE "Sistema Bloqueado",0
    msgIntentos BYTE "Intentos restantes: ",0

    claveCorrecta = 1234

.code
main PROC
    ;   ebx se usa como contador para los intentos de acceso
    mov ebx, 3 
    ;   etiqueta para intentar acceso
    intentar:
    ;   se imprime el mensaje para ingresar la clave
    mov edx, OFFSET msgPIN
    call WriteString 
    ;   se lee el valor ingresado por el usuario
    call ReadInt 

    ;   se compara el valor ingresado con la clave correcta
    cmp eax, claveCorrecta

    ;   si es igual, se salta a la e    tiqueta de acceso permitido
    je acceso 

    ;   si no es igual, se imprime el mensaje de error y se decrementa el contador de intentos
    mov edx, OFFSET msgError 
    call WriteString
    call crlf

    ;   se decrementa el contador de intentos
    dec ebx 

    ;   se va a la etiqueta de bloqueado si el contador llega a cero
    jz bloqueado

    ;   se imprime el mensaje de intentos restantes
    mov edx, OFFSET msgIntentos
    call WriteString


    mov eax, ebx
    call WriteDec
    call crlf

    ;   se regresa a la etiqueta de intentar para permitir otro intento
    jmp intentar
acceso:
    ;  se imprime el mensaje de acceso permitido
    mov edx, OFFSET msgAcceso
    call WriteString
    ;  se termina el programa
    jmp fin

bloqueado:
    ;  se imprime el mensaje de sistema bloqueado
    mov edx, OFFSET msgBloqueo
    call WriteString
    jmp fin
fin:
    exit 
main ENDP

END main