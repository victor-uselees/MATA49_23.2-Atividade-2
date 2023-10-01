; ATIVIDADE PRÁTICA 2 - QUESTÃO 2
; NOME BRUNA ANUNCIACAO DE SANTANA - 221216927
; NOME VICTORIA BEATRIZ SILVA DE AZEVEDO REIS - 221216928

section .data
    msg_ano db "Digite a idade em anos: ", 0
    msg_mes db "Digite a idade em meses: ", 0
    msg_dia db "Digite a idade em dias: ", 0
    msg_result db "A idade em dias: %d", 10, 0

    diasAno dd 365
    diasMes dd 30

    temp db "%d", 0

section .bss
    anos resq 1
    meses resq 1
    dias resq 1
    idade_dias resq 1

section .text 
  global main
  extern scanf, printf 

main:
    ; Pede a idade em anos
    push rbp
    mov rbp, rsp
    mov rdi, msg_ano
    call printf

    ; Lê a idade em anos
    mov rdi, temp
    lea rsi, [anos]
    call scanf

    ; Pede a idade em meses
    mov rdi, msg_mes
    call printf

    ; Lê a idade em meses
    mov rdi, temp
    lea rsi, [meses]
    call scanf

    ; Pede a idade em dias
    mov rdi, msg_dia
    call printf

    ; Lê a idade em dias
    mov rdi, temp
    lea rsi, [dias]
    call scanf

    ; Calcula a idade em dias
    mov rax, [anos]
    mov rbx, [meses]
    imul rax, [diasAno]
    imul rbx, [diasMes]

    add rax, rbx
    add rax, [dias]

    mov [idade_dias], rax

    mov rdi, msg_result
    mov rsi, [idade_dias]
    call printf

    ; Retorna
    leave
    ret
