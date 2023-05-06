# asm-community
building a community of low level programmer those who love assembly and c (low level languages) to help each other just like github.


here's the code for the first program:

# Hello world in Assembly x86

```assembly
; Hello World Program

section .data
    message db 'Hello, World!', 0

section .text
    global _start

_start:
    ; write the message to stdout
    mov eax, 4          ; system call for write
    mov ebx, 1          ; file descriptor for stdout
    mov ecx, message    ; pointer to message to write
    mov edx, 13         ; message length
    int 0x80            ; call kernel

    ; exit program
    mov eax, 1          ; system call for exit
    xor ebx, ebx        ; exit status code
    int 0x80            ; call kernel
```

Let's go through the code step by step:

1. We define two sections: `.data` and `.text`. The `.data` section is used for declaring variables and constants, while the `.text` section is used for writing the actual program code.

2. In the `.data` section, we declare a string variable named `message` and initialize it with the text "Hello, World!". The `db` directive is used to declare a byte (8-bit) variable, and the `0` at the end is used to terminate the string with a null character.

3. In the `.text` section, we define the entry point of the program using the `_start` label. This is the first instruction that will be executed when the program is run.

4. The first system call we make is to write the `message` to stdout. We load the system call number for `write` into the `eax` register, the file descriptor for stdout (1) into the `ebx` register, a pointer to the `message` variable into the `ecx` register, and the length of the message (13) into the `edx` register. We then make the system call using the `int 0x80` instruction.

5. After the message has been printed, we exit the program. We load the system call number for `exit` into the `eax` register, set the exit status code to 0 by XORing `ebx` with itself, and make the system call using `int 0x80`.

This program demonstrates the basic structure of an assembly program and shows how to print a message to the console.

# Input Output in Assembly x86

here is an example program in assembly language that takes input from the user and displays it on the console:

```assembly
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
```

Let's go over this program step by step:

1. The `.data` section contains the messages that will be displayed on the console, as well as the buffer that will store the user input.

2. The `.text` section contains the main code of the program.

3. The `_start` label is the entry point of the program.

4. The first system call `mov eax, 4` displays the message "Enter a number: " on the console using the write syscall with file descriptor 1 (stdout). The length of the message is 15 characters and it is stored in the `message` variable.

5. The second system call `mov eax, 3` reads the input from the user using the read syscall with file descriptor 0 (stdin). The input is stored in the `buffer` variable and the maximum length of input is 10 characters.

6. The third system call `mov eax, 4` displays the message "You entered: " on the console using the write syscall with file descriptor 1 (stdout). The length of the message is 14 characters and it is stored in the `output` variable.

7. The fourth system call `mov eax, 4` displays the user input stored in the `buffer` variable on the console using the write syscall with file descriptor 1 (stdout).

8. The final system call `mov eax, 1` exits the program with a return value of 0.

# Add Two Numbers in Assembly x86 

Here's the code for the Add Two Numbers Program in x86 assembly language:

```assembly
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
```

This program uses the `int 0x80` instruction to interact with the Linux kernel and perform input and output operations. The program first prompts the user to enter two numbers and then reads them from the console using the `read` system call. The two numbers are then added together and the sum is printed to the console using the `write` system call.

Note that this program assumes that the two numbers entered by the user are valid integers and does not perform any error checking. In a real-world application, you would want to add error handling code to ensure that the program does not crash if the user enters invalid input.

# Factorial program in Assembly x86

Here is an code for the Factorial program:

```assembly
section .data
    msg db "Enter a number: "
    len equ $-msg
    res db "Factorial = "
    res_len equ $-res
    
section .bss
    num resw 1
    
section .text
    global _start
    
_start:
    ; print message to console
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 80h
    
    ; read input from user
    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 2
    int 80h
    
    ; calculate factorial
    mov eax, [num]
    mov ebx, eax
    mov ecx, eax
    dec ecx
    
    .loop:
        mul ecx
        loop .loop
    
    ; print result to console
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, res_len
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 2
    int 80h
    
    ; exit program
    mov eax, 1
    xor ebx, ebx
    int 80h
```

The program starts with defining some data sections. The `.data` section contains two strings - `msg` and `res`. `msg` is used to prompt the user to enter a number, while `res` is used to display the factorial result. The `.bss` section reserves memory for the `num` variable, which will be used to store the user input.

The `.text` section contains the actual program code. The `_start` label indicates the beginning of the program. 

The first instruction in the program prints the `msg` string to the console using the `write` system call. The `mov` instructions set the appropriate values in the registers, and the `int 80h` instruction invokes the system call.

Next, the program reads input from the user using the `read` system call. The `mov` instructions set the appropriate values in the registers - `eax` is set to 3 (the `read` system call), `ebx` is set to 2 (the file descriptor for standard input), `ecx` is set to `num` (the memory location where the input will be stored), and `edx` is set to 2 (the number of bytes to read).

After reading the user input, the program calculates the factorial using a loop. The loop starts by setting `eax` and `ebx` to the value of `num`. `ecx` is then set to `num - 1`. The loop multiplies `eax` by `ecx`, decrements `ecx`, and continues until `ecx` is zero. At this point, the factorial is stored in `eax`.

Finally, the program prints the `res` string followed by the factorial result to the console using the `write` system call. The `mov` instructions set the appropriate values in the registers, and the `int 80h` instruction invokes the system call.

The last few instructions in the program print the value of `num` to the console and exit the program.
