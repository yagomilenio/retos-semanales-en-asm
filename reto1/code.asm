section .bss
    buffer resb 30
    outbuffer resb 60 ;es necesario debido a las letras dobles

section .text
global _start


translate:
    mov ebx, 0
    mov ecx, buffer
    mov edx, outbuffer

    bucle:
    
    mov al, byte [ecx]  ; movemos los valores de la direccion de memoria
    ;logica de cambios

    cmp al, 'A'
    jne skip_a
    mov byte  [edx], '4'
    jmp final
    skip_a:

    cmp al, 'B'
    jne skip_b
    mov byte [edx], '8'
    jmp final
    skip_b:

    cmp al, 'C'
    jne skip_c
    mov byte [edx], '['
    jmp final 
    skip_c:

    cmp al, 'D'
    jne skip_d
    mov byte [edx], ')'
    jmp final 
    skip_d:

    cmp al, 'E'
    jne skip_e
    mov byte [edx], '3'
    jmp final 
    skip_e:

    cmp al, 'F'
    jne skip_f
    mov byte [edx], 'v'
    jmp final 
    skip_f:

    cmp al, 'G'
    jne skip_g
    mov byte [edx], '&'
    jmp final 
    skip_g:

    cmp al, 'H'
    jne skip_h
    mov byte [edx], '#'
    jmp final 
    skip_h:

    cmp al, 'I'
    jne skip_i
    mov byte [edx], '1'
    jmp final 
    skip_i:


    cmp al, 'J'
    jne skip_j
    mov byte [edx], ']'
    jmp final 
    skip_j:

    cmp al, 'K'
    jne skip_k
    mov byte [edx], '>'
    mov byte [edx+1], '|'
    inc edx
    jmp final 
    skip_k:


    cmp al, 'L'
    jne skip_l
    mov byte [edx], '1'
    jmp final 
    skip_l:


    cmp al, 'M'
    jne skip_m
    mov byte [edx], '^'
    mov byte [edx+1], '^'
    inc edx
    jmp final 
    skip_m:


    cmp al, 'N'
    jne skip_n
    mov byte [edx], '^'
    jmp final 
    skip_n:

    cmp al, 'O'
    jne skip_o
    mov byte [edx], '0'
    jmp final 
    skip_o:


    cmp al, 'P'
    jne skip_p
    mov byte [edx], '?'
    jmp final 
    skip_p:


    cmp al, 'Q'
    jne skip_q
    mov byte [edx], '9'
    jmp final 
    skip_q:


    cmp al, 'R'
    jne skip_r
    mov byte [edx], '2'
    jmp final 
    skip_r:


    cmp al, 'S'
    jne skip_s
    mov byte [edx], '5'
    jmp final 
    skip_s:


    cmp al, 'T'
    jne skip_t
    mov byte [edx], '7'
    jmp final 
    skip_t:


    cmp al, 'U'
    jne skip_u
    mov byte [edx], 'v'
    jmp final 
    skip_u:



    cmp al, 'V'
    jne skip_v
    mov byte [edx], '\'
    mov byte [edx+1], '/'
    inc edx
    jmp final 
    skip_v:


    cmp al, 'W'
    jne skip_w
    mov byte [edx], 'u'
    mov byte [edx+1], 'u'
    inc edx
    jmp final 
    skip_w:



    cmp al, 'X'
    jne skip_x
    mov byte [edx], ')'
    mov byte [edx+1], '('
    inc edx
    jmp final 
    skip_x:


    cmp al, 'Y'
    jne skip_y
    mov byte [edx], 'j'
    jmp final 
    skip_y:

    cmp al, 'Z'
    jne skip_z
    mov byte [edx], '%'
    jmp final 
    skip_z:
    

    mov byte [edx], al



    final:
    
    inc ecx ; incrementamos la direccion de memoria
    inc ebx
    inc edx ; incrementamos puntero de buffer salida
    cmp ebx, 30
    jne bucle
    ret




_start:

    mov eax, 3
    mov edx, 30
    mov ecx, buffer
    mov ebx, 0 ; fd =0 stdin
    int 0x80

    call translate


    mov eax, 4
    mov edx, 60
    mov ecx, outbuffer
    mov ebx, 1
    int 0x80




    
    mov eax, 1
    xor ebx, ebx
    int 0x80