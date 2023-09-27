;MATA49 - PROGRAMAÇÃO DE SOFTWARE BÁSICO - T01
;ATIVIDADE PRÁTICA 2 - QUESTÃO 1
;DAVID OLIVEIRA SILVA - 220119510
;ANDRÉ COSTA LINO ALMEIDA - 220115815

global main
extern scanf
extern printf

section .data
PERGUNTAR_NOME db "Informe um nome: ", 0
PERGUNTAR_LETRA db "Qual letra você está buscando: ", 0
LER_NOME db "%s", 0
LER_LETRA db " %c", 0
POSICAO_LETRAS db "Primeira Letra: %c",10,"Última letra: %c",10,0
ENCONTRADO db "Encontramos '%c' em '%s'!",10,0
NAO_FOI_ENCONTRADO db "Não encontramos '%c' em '%s'!",10,0

section .bss
name_buf resb 256
character_buf resb 1

section .text

main:
    push rbp
    mov rbp, rsp

    mov rdi, PERGUNTAR_NOME
    call printf

    mov rdi, LER_NOME
    mov rsi, name_buf
    call scanf

    mov rdi, PERGUNTAR_LETRA
    call printf

    mov rdi, LER_LETRA
    mov rsi, character_buf
    call scanf

    mov rsi, [name_buf]
    mov rax, name_buf

ultima_letra:
    inc rax
    cmp byte [rax], 0x0
    jne ultima_letra
    mov rdx, [rax-1]
    mov rdi, POSICAO_LETRAS
    call printf

    mov rax, name_buf-1
    mov bl, byte [character_buf]

buscar_letra:
    inc rax
    cmp byte [rax], 0x0
    je nao_encontrado
    cmp byte [rax], bl
    jne buscar_letra

achei:
    mov rdi, qword ENCONTRADO
    mov rsi, [character_buf]
    mov rdx, name_buf
    call printf
    jmp return

nao_encontrado:
    mov rdi, qword NAO_FOI_ENCONTRADO
    mov rsi, [character_buf]
    mov rdx, name_buf
    call printf

return:
    pop rbp
    mov eax, 0
    ret
