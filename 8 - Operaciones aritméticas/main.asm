; Materia: Lenguajes de Interfaz
; Nombre: Sebastian Urias Hernandez
; Horario: 10 - 11
; Docente: Jose Luis Medina Jimenez

INCLUDE Irvine32.inc
.data
.code
main PROC
; 1. ADD y SUB: Operaciones de suma y resta

mov eax, 50
mov ebx, 20

;   ADD es la funcion para sumar y sub para restar
add eax, ebx
sub eax, 15

nop

;2. CF: ACARREO EN UNA SUMA SIN SIGNO
mov eax, 0
mov al, 255

;   Al superar la capacidad se activa el cf
add al,1

call dumpRegs

nop

;3. OF: DESCBORDAMIENTO EN SUMA CON SIGNO

mov eax, 0
mov al, 127
add al, 1

nop

;4. MUL: PRODUCTO DE VALORES DENTRO DE 32 BITS SIN SIGNO

mov eax, 25
mov ebx, 3

mul ebx

nop

; 5. IMUL: PRODUCTO DE VALORES CON SIGNO DENTRO DE 32 BITS

mov eax, -5
imul eax, eax,3

; 6. MUL: PRODUCTO DE VALORES QUE EXCEDEN 32 BITS

mov eax, 65537
mov ebx, 65537

mul ebx

nop

exit

main ENDP
END main