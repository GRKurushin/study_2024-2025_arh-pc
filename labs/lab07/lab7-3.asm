%include 'in_out.asm'

SECTION .data
    msg_x: DB 'Введите переменную x: ', 0
    msg_a: DB 'Введите переменную a: ', 0
    res: DB 'Результат: ', 0

SECTION .bss
    x: RESB 80
    a: RESB 80

SECTION .text
    GLOBAL _start

_start:
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    mov edi, eax

    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 80
    call sread
    mov eax, a
    call atoi
    mov esi, eax 

    cmp edi, 4
    jl less_than_4 

    ; Ветка x >= 4
    mov eax, edi
    imul eax, esi
    jmp print_result

less_than_4:
    mov eax, edi
    add eax, 4

print_result:
    mov edi, eax
    mov eax, res
    call sprint
    mov eax, edi
    call iprintLF
    call quit
