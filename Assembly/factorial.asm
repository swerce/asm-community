; github -- https://github.com/swerce/asm-community
; FFactorial Program: A program that calculates the factorial of a number entered by the user.

section .data
    message db "Enter a number: ", 0
    result db "Factorial is: ", 0
    newline db 10, 0

section .bss
    input resb 2

section .text
    global _start

_start:
    ; Display message to enter number
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 16
    int 0x80
    
    ; Read input from user
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 2
    int 0x80
    
    ; Convert input to integer
    xor ebx, ebx
    mov bl, [input]
    sub bl, '0'
    
    ; Calculate factorial
    mov ecx, ebx
    mov eax, 1
factorial_loop:
    mul ecx
    dec ecx
    jnz factorial_loop
    
    ; Convert result to string
    mov ebx, eax
    mov ecx, result
    call itoa
    
    ; Display result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 14
    int 0x80
    
    ; Display newline character
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 2
    int 0x80
    
    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

itoa:
    push ecx
    mov ecx, 10
    xor edx, edx
itoa_loop:
    div ecx
    push dx
    test eax, eax
    jnz itoa_loop
itoa_convert:
    pop edx
    add dl, '0'
    mov [ecx], dl
    inc ecx
    cmp esp, ecx
    jb itoa_convert
    pop ecx
    ret
