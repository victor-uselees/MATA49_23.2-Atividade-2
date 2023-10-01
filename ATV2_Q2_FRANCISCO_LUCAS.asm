;ATIVIDADE PRÁTICA 2 - QUESTÃO 2
;FRANCISCO SILVA SANTANA - MATRÍCULA 222216228
;LUCAS SAMPAIO SOUZA ANDRADE - MATRÍCULA 220115578


section .data
    prompt1 db "Tem quantos anos? ", 0
    tamPrompt equ $ - prompt1
    prompt2 db "Tem quantos meses? ", 0
    tamPrompt2 equ $ - prompt2
    prompt3 db "Tem quantos dias? ", 0
    tamPrompt3 equ $ - prompt3
    output db "Sua idade em dias é: %d ", 0

    fmt db "%d", 0

    anos dd 0
    meses dd 0
    dias dd 0
    idade_dias dd 0

section .text
    global main
    extern scanf
    extern printf

main:
    ;Pedir anos
    push rbp
    mov rbp, rsp
    mov rdi, prompt1
    call printf
    
    ; Grava resultado em anos
    mov rdi, fmt
    lea rsi, [anos]
    call scanf

    ;Pedir meses
    mov rdi, prompt2
    call printf
    
    ; Grava resultado em meses
    mov rdi, fmt
    lea rsi, [meses]
    call scanf

    ;Pedir dias
    mov rdi, prompt3
    call printf
    
    ; Grava resultado em dias
    mov rdi, fmt
    lea rsi, [dias]
    call scanf

    ;Armazena anos e meses e multiplica por seus respectivos dias
    mov rax, [anos]
    imul rax, 365
    mov rbx, [meses]
    imul rbx, 30

    ;Soma os dias dos anos e dos meses e adiciona a contagem de dias
    add rax, rbx
    add rax, [dias]
    mov [idade_dias], rax

    ;Envia a mensagem de dias e manda para o rsi a quantidade total
    mov rdi, output
    mov rsi, [idade_dias]
    call printf

    ;Sai do programa
    leave
    ret
