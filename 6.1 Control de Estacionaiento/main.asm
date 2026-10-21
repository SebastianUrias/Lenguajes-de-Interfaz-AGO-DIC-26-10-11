INCLUDE Irvine32.inc

.data
    msgEntrada BYTE "Ingrese cantidad de autos ",0
    msgOcupados BYTE "Espacios ocupados ",0
    msgDisponibles BYTE "Espacios disponibles ",0
    msgLleno BYTE "Estacionamiento lleno",0
    msgExceso BYTE "No hay suficientes espacios disponibles",0
    msgInvalido BYTE "Cantidad invalida",0

    ;   la capacidad del estacionamiento es de 20 autos
    capacidad = 20
    ;   variable para almacenar la cantidad de espacios ocupados
    ocupados DWORD 0

.code

main PROC

ingresar:
    ;   mostrar mensaje de entrada
    mov edx, OFFSET msgEntrada
    call WriteString
    ;  leer cantidad de autos
    call ReadInt
    ;   validar cantidad de autos
    cmp eax, 0
    ;   si es menor o igual a 0, mostrar mensaje de cantidad invalida
    jle invalido

    ;   en caso contrario, sumar la cantidad de autos ingresada a la cantidad de espacios ocupados
    mov ebx, eax
    ;   ocupados = ocupados + ebx
    mov eax, ocupados
    ;   sumar ebx a eax
    add eax, ebx

    ;   validar si la cantidad de espacios ocupados es mayor a la capacidad del estacionamiento
    cmp eax, capacidad
    jg exceso
    ;   guardar la nueva cantidad de espacios ocupados
    mov ocupados, eax
    
    ;   mostrar el mensaje de espacios ocupados
    mov edx, OFFSET msgOcupados
    call WriteString

    ;   cargar la cantidad de espacios ocupados para mostrarla
    mov eax, ocupados
    ;   mostrar la cantidad de espacios ocupados
    call WriteDec
    call Crlf

    ;   comparar la cantidad ocupada con la capacidad total
    mov eax, ocupados
    cmp eax, capacidad
    ;   si el estacionamiento esta lleno, saltar a la etiqueta lleno
    je lleno

    ;   mostrar el mensaje de espacios disponibles
    mov edx, OFFSET msgDisponibles
    call WriteString

    ;   cargar la capacidad total del estacionamiento
    mov eax, capacidad
    ;   restar los espacios ocupados para calcular los disponibles
    sub eax, ocupados
    call WriteDec
    call Crlf
    ;   deja una linea en blanco
    call Crlf

    jmp ingresar


exceso:

    ;   mostrar el mensaje de que no hay suficientes espacios
    mov edx, OFFSET msgExceso
    call WriteString
    call Crlf
    call Crlf
    jmp ingresar


invalido:

    ;   mostrar el mensaje de cantidad invalida
    mov edx, OFFSET msgInvalido
    call WriteString
    call Crlf
    call Crlf

    ;   volver a pedir la cantidad de autos
    jmp ingresar


lleno:

    ;   mostrar el mensaje de estacionamiento lleno
    mov edx, OFFSET msgLleno
    call WriteString
    call Crlf


fin:
    exit

main ENDP

END main