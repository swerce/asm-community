; github -- https://github.com/swerce/asm-community
;  Input Output in assembly x86


section .data
    message db 'Enter a number: '
    output db 'You entered: '
    input db 10
    buffer resb 10

section .text
    global _start

_start:
    ; Display the message on the console
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 15
    int 0x80

    ; Read input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 10
    int 0x80

    ; Display the output on the console
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, 14
    int 0x80

    ; Display the input on the console
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 10
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
