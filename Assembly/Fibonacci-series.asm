; github -- https://github.com/swerce/asm-community
; Fibonacci Series program in x86 Assembly


.model small
.stack 100h

.data
    msg db 10,13,"Enter the limit of the Fibonacci series : $"
    num1 db 0
    num2 db 1
    temp db ?
    limit dw ?
    fibo db 1000 dup('$')

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h  ; display the message to enter limit
    lea dx, msg
    int 21h
    
    mov ah, 01h  ; read limit from user
    int 21h
    sub al, 30h  ; convert ASCII to decimal
    mov limit, ax
    
    mov bx, 0    ; initialize loop counter
    mov cx, 2    ; initialize counter for fibo array
    
    mov ah, 02h  ; display 0th and 1st term of fibo series
    mov dl, num1
    int 21h
    
    mov ah, 02h
    mov dl, num2
    int 21h
    
    add dl, num1 ; calculate 2nd term
    mov temp, dl ; store result in temporary variable
    
    mov ah, 02h  ; display 2nd term of fibo series
    mov dl, temp
    int 21h
    
next:   
    cmp cx, limit ; check if limit reached
    jge exit
    
    mov num1, num2   ; swap the numbers
    mov num2, temp   ; swap the numbers
    add num2, num1   ; calculate next term
    mov temp, num2   ; store result in temporary variable
    
    mov ah, 02h      ; display the next term
    mov dl, num2
    int 21h
    
    inc cx           ; increment the counter
    jmp next

exit:
    mov ah, 4ch
    int 21h
main endp
end main
