; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez

INCLUDE Irvine32.inc

.data
    prompt BYTE "Ingresa el codigo (ej. TEC-123): ", 0
    msg_valido BYTE "Formato valido. La cadena cumple todas las reglas.", 13, 10, 0
    
    err_longitud BYTE "Formato invalido: La longitud no es igual a 7.", 13, 10, 0
    err_letras   BYTE "Formato invalido: Las posiciones 0-2 no son letras mayusculas (A-Z).", 13, 10, 0
    err_guion    BYTE "Formato invalido: Falta el separador '-' en la posicion 3.", 13, 10, 0
    err_digitos  BYTE "Formato invalido: Las posiciones 4-6 no son digitos (0-9).", 13, 10, 0
    
    buffer BYTE 20 DUP(0)
    bytesLeidos DWORD ?

.code
main PROC
    ;   Leer la cadena del usuario
    mov edx, OFFSET prompt
    call WriteString
    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer
    call ReadString
    mov bytesLeidos, eax

    ;   PASO 1: Validar Longitud = 7
    cmp eax, 7       
    ;   Si no es 7, salta al error de longitud      
    jne error_longitud    
    ;   Apuntar al inicio de la cadena
    mov esi, OFFSET buffer
    ;   PASO 2: Validar Letras A-Z (Posiciones 0-2)
    mov ecx, 3             
	validar_letras:
    mov al, [esi]          
    cmp al, 'A'
    ;    Si es menor a 'A', salta al error de letras
    jb error_letras        
    cmp al, 'Z'
    ;    Si es mayor a 'Z', salta al error de letras
    ja error_letras        
    inc esi                
    loop validar_letras    

    ;   PASO 3: Validar Separador '-' (Posición 3)
    mov al, [esi]          
    cmp al, '-'
    ;   Si no es '-', salta al error del separador
    jne error_guion        
    inc esi                
    ;   PASO 4: Validar Dígitos 0-9 (Posiciones 4-6)
    mov ecx, 3             
	validar_digitos:
    mov al, [esi]          
    cmp al, '0'
    jb error_digitos      
    ;   Si es menor a '0', salta al error de dígitos
    cmp al, '9'
    ;   Si es mayor a '9', salta al error de dígitos
    ja error_digitos       
    inc esi                
    loop validar_digitos   
    ;   ÉXITO: Supera todas las comprobaciones
    mov edx, OFFSET msg_valido
    call WriteString
    jmp fin                
    ;   BLOQUE DE ERRORES: Rutas de "No cumple"
    error_longitud:
    mov edx, OFFSET err_longitud
    call WriteString
    jmp fin
	error_letras:
    mov edx, OFFSET err_letras
    call WriteString
    jmp fin
	error_guion:
    mov edx, OFFSET err_guion
    call WriteString
    jmp fin
	error_digitos:
    mov edx, OFFSET err_digitos
    call WriteString
	fin:
    exit
main ENDP
END main