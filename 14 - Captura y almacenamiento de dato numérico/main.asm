; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez

INCLUDE Irvine32.inc
.data
    mensajeEntrada BYTE "Cuantas unidades llegaron (1-99): ", 0
    mensajeError BYTE "Entrada invalida. Escribe solo digitos, de 1 a 99.", 13, 10, 0
    mensajeResultado BYTE "Existencia actual: ", 0
    mensajeUnidades BYTE " unidades", 13, 10, 0

    ; ReadString necesita espacio para los caracteres y el terminador cero.
    entrada BYTE 16 DUP(0)
    salida BYTE 11 DUP(0)

    cantidadRecibida DWORD ?
    existenciaActual DWORD 25

.code
main PROC

solicitarEntrada:
    mov edx, OFFSET mensajeEntrada
    call WriteString

    ; ReadString deja en EAX el numero de caracteres leidos.
    mov edx, OFFSET entrada
    mov ecx, SIZEOF entrada
    call ReadString

    ; La cantidad debe tener uno o dos caracteres.
    cmp eax, 1
    jb entradaInvalida
    cmp eax, 2
    ja entradaInvalida

    ; Convertir cada digito ASCII a su valor numerico.
    mov esi, OFFSET entrada
    mov ecx, eax
    xor ebx, ebx

convertirDigitos:
    movzx eax, BYTE PTR [esi]
    cmp al, '0'
    jb entradaInvalida
    cmp al, '9'
    ja entradaInvalida

    sub eax, '0'
    imul ebx, ebx, 10
    add ebx, eax

    inc esi
    loop convertirDigitos

    ; Esto tambien rechaza el valor cero, incluyendo "00".
    cmp ebx, 1
    jb entradaInvalida
    cmp ebx, 99
    ja entradaInvalida

    mov cantidadRecibida, ebx

    ; Actualizar la existencia sumando las unidades recibidas.
    mov eax, existenciaActual
    add eax, cantidadRecibida
    mov existenciaActual, eax

    ; Convertir el DWORD a texto para poder mostrarlo con WriteString.
    mov eax, existenciaActual
    mov edi, OFFSET salida
    call DwordToString

    mov edx, OFFSET mensajeResultado
    call WriteString
    mov edx, OFFSET salida
    call WriteString
    mov edx, OFFSET mensajeUnidades
    call WriteString

    exit

entradaInvalida:
    mov edx, OFFSET mensajeError
    call WriteString
    jmp solicitarEntrada

main ENDP

; Entrada: EAX = DWORD sin signo, EDI = direccion del buffer de salida.
; Salida: el numero en decimal terminado en cero en el buffer.
DwordToString PROC USES eax ebx ecx edx edi
    mov ebx, 10
    xor ecx, ecx

    ; El bucle de divisiones no produce digitos cuando el valor es cero.
    cmp eax, 0
    jne dividirNumero
    mov BYTE PTR [edi], '0'
    inc edi
    jmp terminarCadena

dividirNumero:
    xor edx, edx
    div ebx
    push edx
    inc ecx
    test eax, eax
    jnz dividirNumero

    ; Los restos salen al reves; desapilarlos los escribe en orden correcto.
escribirDigitos:
    pop edx
    add dl, '0'
    mov BYTE PTR [edi], dl
    inc edi
    loop escribirDigitos

terminarCadena:
    mov BYTE PTR [edi], 0
    ret
DwordToString ENDP

END main