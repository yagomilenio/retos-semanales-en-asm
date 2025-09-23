section .bss
    time resd 1
    buffer resb 11
    year resd 1
    month resw 1
    day resw 1
    hour resw 1
    minute resw 1
    seconds resw 1

section .text
global _start

_start:


    mov eax, 13
    mov  ebx, time
    int 0x80

    mov byte [buffer+10], 10
    mov ecx, buffer
    add ecx, 9
   
    mov eax, [time]
    quitardias:
    xor edx, edx
    mov ebx, 31536000
    div ebx
    cmp eax, 0
    jne quitardias

    add edx, 1970
    mov [year], edx

    mov eax, edx 
    ;mul 31536000
    ;mov [month], [time]
    ;sub [month], eax 









    mov eax, edx; en eax hay que cargar lo q vaya a imprimir



    bucle:
    xor edx, edx
    mov ebx, 10
    div ebx
    add dl, '0' ; el resto esta siempre en edx 
    mov byte [ecx], dl
    dec ecx
    cmp eax, 0
    jne bucle


    mov eax, 4
    mov ebx, 1
    mov ecx, buffer 
    mov edx, 11
    int 0x80





    mov eax, 1
    xor ebx, ebx
    int 0x80