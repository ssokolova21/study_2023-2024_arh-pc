%include 'in_out.asm'

section .data
    msg db "Наименьшее число: ", 0
    a dd 32
    b dd 6
    c dd 54
    smallest dd 0

section .bss
    min resd 1

section .text
global _start

_start:
    ; Сравниваем a и b
    mov eax, [a]
    cmp eax, [b]
    jle _compare_c

    ; Если a > b, то b становится наименьшим
    mov eax, [b]
    mov [min], eax
    jmp _compare_c

_compare_c:
    ; Сравниваем наименьшее значение с c
    mov eax, [c]
    cmp eax, [min]
    jge _end

    ; Если c < наименьшего значения, то c становится новым наименьшим
    mov [min], eax

_end:
    ; Выводим наименьшее значение
    mov eax, msg
    call sprint ; Вывод сообщения ‘Наименьшее число:’
    mov eax, [min]
    call iprintLF ; Вывод ‘min(A,B,C)’
    call quit
