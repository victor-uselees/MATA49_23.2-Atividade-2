; ATIVIDADE PRÁTICA 2 - QUESTÃO 1
; NOME Estácio Gonçalves - 222216227
; NOME Fábio César Tosta - 222217108

section .data
    solicita_idade db "Digite sua idade no formato [anos] [meses] [dias]: ", 10, 0
    idade_em_dias db "Sua idade em dias é igual a: ", 10, 0
    formato1 db "%s", 0
    formato2 db "%d %d %d",0
    formato3 db "%d", 10,0
    anos dd 0
    meses dd 0
    dias dd 0

section .text
global main
extern printf, scanf

main:
    push rbp
    mov rbp, rsp
    
    mov rdi, formato1
    mov rsi, solicita_idade
    call printf

    mov rdi, formato2
    mov rsi, anos
    mov rdx, meses
    mov rcx, dias
    call scanf

    mov r10, 365
    mov rax, [anos]
    mul r10
    add [dias], rax

    mov r10, 30
    mov rax, [meses]
    mul r10
    add [dias], rax

    mov rdi, formato1
    mov rsi, idade_em_dias
    call printf

    mov rdi, formato3
    mov rsi, [dias]
    call printf
    
    leave
    ret