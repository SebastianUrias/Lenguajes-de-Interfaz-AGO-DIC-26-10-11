; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez
; Descripcion: Esta practica nos enseña como crear, leer y manipular archivos para guardar o recuperar datos.

INCLUDE Irvine32.inc
.data
    nombreArchivo BYTE "Inventario.txt", 0 ; nombre del archivo
    texto BYTE "125",  0 ; la info que se pone en el archivo
    archivoHandle DWORD ? ; el handle del archivo sirve para identificar el archivo

    mensajeExito BYTE "Positivo", 0 ; mensaje de exito
    mensajeError BYTE "Negativo", 0 ; mensaje de error

.code
main PROC
    ; 1- Crear Archivo txt
    mov edx, OFFSET nombreArchivo  ; cargar la dirección del nombre del archivo
    call CreateOutputFile   ; funcion de irvine para crear un archivo de salida

    cmp eax, INVALID_HANDLE_VALUE  ; comparar el valor de retorno con INVALID_HANDLE_VALUE
    je error ; si es igual, saltar a la etiqueta error

    mov archivoHandle, eax ; guardar el handle del archivo en la variable archivoHandle

    ; 2- Escribir caracteres en archivo txt.
    mov eax, archivoHandle ;    por si eax se ah usado en otra cosa, se vuelve a cargar el handle del archivo
    mov edx, OFFSET texto   ; cargar la dirección del texto a escribir
    mov ecx, SIZEOF texto - 1   ; cargar el tamaño del texto a escribir (sin contar el terminador nulo)
    call WriteToFile    ;   funcion de irvine para escribir en un archivo

    jc errorEscritura ; jc es con el  carrrie flag, la del acarreo

    cmp eax, SIZEOF texto - 1   ; comparar el valor de retorno con el tamaño del texto a escribir
    jne errorEscritura  ;   si no es igual, saltar a la etiqueta errorEscritura


    ; 3- Cerrar archivo txt
    mov eax, archivoHandle  ; cargar el handle del archivo
    call CloseFile  ; funcion de irvine para cerrar un archivo

    test eax, eax   ; probar el valor de retorno de CloseFile
    jz error    ;  si es cero, saltar a la etiqueta error

    mov edx, OFFSET mensajeExito    ; cargar la dirección del mensaje de exito
    call WriteString
    jmp fin

   errorEscritura:
    mov eax, archivoHandle
    call CloseFile
    mov edx , OFFSET mensajeError
    call WriteString
   error:
    mov edx , OFFSET mensajeError
    call WriteString
   fin: 
    exit
main ENDP
END main