; github -- https://github.com/swerce/asm-community
; Adding Two numbers in Assembly x86

section .data
    prompt1 db "Enter the first number: ",0
    prompt2 db "Enter the second number: ",0
    summsg db "The sum is: ",0
    num1 dd 0
    num2 dd 0
    sum dd 0

section .text
    global _start
    
_start:
    ; print the first prompt and read the first number
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt1
    mov edx, 21
    int 0x80
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 4
    int 0x80
    
    ; print the second prompt and read the second number
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, 22
    int 0x80
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 4
    int 0x80
    
    ; add the two numbers
    mov eax, [num1]
    add eax, [num2]
    mov [sum], eax
    
    ; print the sum
    mov eax, 4
    mov ebx, 1
    mov ecx, summsg
    mov edx, 12
    int 0x80
    mov eax, 4
    mov ebx, 1
    mov ecx, [sum]
    mov edx, 4
    int 0x80
    
    ; exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
