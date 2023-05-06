# asm-community
building a community of low level programmer those who love assembly and c (low level languages) to help each other just like github.


Sure, here's the code for the first program:

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
