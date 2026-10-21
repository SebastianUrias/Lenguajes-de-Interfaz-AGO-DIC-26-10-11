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


    entrada BYTE 16 DUP(0)
    salida BYTE 11 DUP(0)

    cantidadRecibida DWORD ?
    existenciaActual DWORD 25

.code
main PROC

solicitarEntrada:
    mov edx, OFFSET mensajeEntrada
    call WriteString

   
    mov edx, OFFSET entrada
    mov ecx, SIZEOF entrada
    call ReadString

   
    cmp eax, 1
    jb entradaInvalida
    cmp eax, 2
    ja entradaInvalida

    
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

    
    cmp ebx, 1
    jb entradaInvalida
    cmp ebx, 99
    ja entradaInvalida

    mov cantidadRecibida, ebx

    mov eax, existenciaActual
    add eax, cantidadRecibida
    mov existenciaActual, eax

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

DwordToString PROC USES eax ebx ecx edx edi
    mov ebx, 10
    xor ecx, ecx

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