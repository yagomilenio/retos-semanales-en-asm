section .data
    nl db 10 ; salto de linea
    fizz db 'fizz'
    buzz db 'buzz'
    fizzbuzz db 'fizzbuzz'
section .bss ; seccion de memoria para variables sin valor definido
    count resw 1   ;reserva un word unico.... es decir 2bytes
    array resb 3    ; este reserva 3 items cada uno d un byte es decir un array de 1 byte cada uno
    boolm3 resb 1
    boolm5 resb 1
section .text
global _start

print: 

    mov bl, byte [boolm3]
    mov bh, byte [boolm5]
    mov al, bl
    add al, bh
    
    cmp al, 2
    jne noalosdos
    mov edx, 8
    mov ecx, fizzbuzz
    jmp fuera
    noalosdos:
    
    cmp bl, 1
    jne noalde3
    mov edx, 4
    mov ecx, fizz
    jmp fuera
    noalde3:
    
    cmp bh, 1
    jne noalde5
    mov edx, 4
    mov ecx, buzz
    jmp fuera
    noalde5:
      
    mov bx, 10
    mov ax, [count]
    xor dx, dx
    div bx
    add dl, '0'
    mov byte [array+2], dl
    xor dx, dx
    div bx
    add dl, '0'
    mov byte [array+1], dl
    xor dx, dx
    div bx
    add dl, '0'
    mov byte [array], dl
    
    
    mov ecx, array
    mov edx, 3  ; tamaño a imprimir
    fuera:
        mov eax, 4
        mov ebx, 1  ; stdout
        
        int 0x80
        
        
        
        mov eax, 4
        mov ecx, nl
        mov edx, 1
        int 0x80
        ret
        
comprobar
    mov byte  [boolm3], 0
    mov byte [boolm5], 0
    mov bx, ax
    
    mov cx, 3
    xor dx, dx
    div cx
    cmp dx, 0
    jne skipm3
    mov byte [boolm3], 1
    
    skipm3:
        
        mov ax, bx
        
        mov cx, 5
        xor dx, dx
        div cx
        cmp dx, 0
        jne skipm5
        mov byte [boolm5], 1
    skipm5:
        ret
    
_start:
    mov ebp, esp; for correct debugging
    mov word [count], 1
    
    bucle:
        
        
        mov ax, [count]
        call comprobar
        call print
        mov ax, [count]
        inc ax
        mov word [count], ax
        
        cmp ax, 101
        jne bucle
    
  
  
  
      end:
        
        mov eax, 1 
        xor ebx, ebx
        int 0x80