%include 'in_out.asm'
section .data
    vvodx: db "Введите x: ", 0
    vvoda: db "Введите а: ", 0
    vivod: db "Результат: ", 0
section .bss
    x: resb 80
    a: resb 80
section .text
global _start
_start:
    mov eax, vvoda
    call sprint
    mov ecx, a
    mov edx, 80
    call sread
    mov eax, a
    call atoi
    mov ebx, eax
    mov eax, vvodx
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    cmp eax, ebx
    jl _functiona
    jmp _functionx

_functiona:
    add eax, 10
    jmp _end

_functionx:
    add eax, 10
    jmp _end

_end:
    mov ecx, eax
    mov eax, vivod
    call sprint
    mov eax, ecx
    call iprintLF
    call quit
