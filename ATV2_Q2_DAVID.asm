; ATIVIDADE PRÁTICA 2 - QUESTÃO 2
; DAVID FERRARI - 217115868

section .data
    age_msg db "Insira sua idade na ordem 1:${numero-anos} 2:${numero-meses} 3:${numero-dias} ", 10, 0
    input_prompt db "%d", 0
    age_answer_in_days db "%d dias de vida", 10, 0
    one_year_in_days equ 365
    one_month_in_day equ 30

section .bss
    years resq 1
    months resq 1
    days resq 1

section .text
    global main
    extern printf
    extern scanf

main:
    ;imprime a mensagem solicitando a idade
    push rbp
    mov rbp, rsp
    mov rdi, age_msg
    call printf

    ;lê a idade do usuário
    mov rsi, years ; primeiro argumento
    mov rdi, input_prompt
    call scanf
    
    mov rsi, months ; segundo argumento
    mov rdi, input_prompt
    call scanf
    
    mov rsi, days ; terceiro argumento
    mov rdi, input_prompt
    call scanf

    ;calcula a quantidade de dias
    mov rsi, [days] ; move os dias para o RSI
    mov rax, [years] ; move a quantidade de anos para o RAX
    mov rbx, one_year_in_days ; move o valor constante 365 para o RBX
    mul rbx ; multiplica o valor em RBX pelo valor em RAX e aramazena o resultado em RAX
    add rsi, rax ; adiciona o valor em RSI ao valor em RAX e aramazena em RSI
    mov rax, [months] ; move o valor dos meses inputados para o RAX
    mov rbx, one_month_in_day ; move o valor constante 30 para o RBX
    mul rbx ; multiplica o valor em RAX por RBX e aramazena o resultado em RAX
    add rsi, rax ; adicionar o valor em RSI a RAX e aramazena em RSI para ser usado como argumento
    ; no printf
    mov rdi, age_answer_in_days ; move a mensagem formata de resposta para o RDI
    call printf ; printa no terminal o resultado
    
    ;terminar o programa
    leave
    ret
