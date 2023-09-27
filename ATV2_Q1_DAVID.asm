; ATIVIDADE PRÁTICA 2 - QUESTÃO 1
; DAVID FERRARI - 217115868
global main
extern scanf
extern printf

section .data

PROMPT_NAME db "Digite um nome: ", 0
PROMPT_LETTER db "Digite a letra a ser procurada no nome: ", 0
READ_NAME db "%s", 0
READ_LETTER db " %c", 0
LETTER_POSITION db "Primeira letra do nome: %c", 10, "Última letra do nome: %c", 10, 0
FOUND_MSG db "Achado '%c' em '%s'!", 10, 0
NOT_FOUND_MSG db "Não foi possível encontrar '%c' em '%s'!", 10, 0

section .bss
name_buffer resb 256
character_buffer resb 1

section .text

main:
    push rbp
    mov rbp, rsp

    mov rdi, PROMPT_NAME
    call printf

    mov rdi, READ_NAME
    mov rsi, name_buffer
    call scanf

    mov rdi, PROMPT_LETTER
    call printf

    mov rdi, READ_LETTER
    mov rsi, character_buffer
    call scanf

    mov rsi, [name_buffer]
    mov rax, name_buffer

last_letter:
    inc rax
    cmp byte [rax], 0x0
    jne last_letter
    mov rdx, [rax-1]
    mov rdi, LETTER_POSITION
    call printf

    mov rax, name_buffer-1
    mov bl, byte [character_buffer]

search_letter:
    inc rax
    cmp byte [rax], 0x0
    je not_found
    cmp byte [rax], bl
    jne search_letter

found:
    mov rdi, qword FOUND_MSG
    mov rsi, [character_buffer]
    mov rdx, name_buffer
    call printf
    jmp return

not_found:
    mov rdi, qword NOT_FOUND_MSG
    mov rsi, [character_buffer]
    mov rdx, name_buffer
    call printf

return:
    leave
    ret

