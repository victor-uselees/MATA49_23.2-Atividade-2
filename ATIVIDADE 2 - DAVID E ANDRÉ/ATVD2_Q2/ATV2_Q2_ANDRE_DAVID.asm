;MATA49	- PROGRAMAÇÃO DE SOFTWARE BÁSICO - T01
;ATIVIDADE PRÁTICA 2 - QUESTÃO 2
;DAVID OLIVEIRA SILVA - 220119510
;ANDRÉ COSTA LINO ALMEIDA - 220115815

section .data
    mensagem_entrada db "Insira sua idade (Anos Meses Dias): ", 10, 0 ; Mensagem de solicitação de idade.
    read_format db "%d", 0 ; Formato de leitura para scanf.
    mensagem_saida_in_dias db "%d dias.", 10, 0 ; Formato de resposta com dias, conforme pedido.
    num_dias_no_ano equ 365 
    num_dias_no_mes equ 30 ;

section .bss
    anos resq 1 ; Variável para armazenar anos.
    meses  resq 1 ; Variável para armazenar meses.
    dias resq 1 ; Variável para armazenar dias.

section .text
    global main
    extern printf
    extern scanf

main:
    ; Imprime a mensagem solicitando a idade.
    push rbp
    mov rbp, rsp
    mov rdi, mensagem_entrada
    call printf

    ; Lê a idade do usuário (anos, meses, dias).
    mov rsi, anos ; Primeiro argumento.
    mov rdi, read_format
    call scanf
    
    mov rsi, meses  ; Segundo argumento.
    mov rdi, read_format
    call scanf
    
    mov rsi, dias ; Terceiro argumento.
    mov rdi, read_format
    call scanf

    ; Calcula a quantidade de dias.
    mov rsi, [dias] ; Move os dias para o RSI.
    mov rax, [anos] ; Move a quantidade de anos para o RAX.
    mov rbx, num_dias_no_ano ; Move o valor constante 365 para o RBX.
    mul rbx ; Multiplica o valor em RBX pelo valor em RAX e armazena o resultado em RAX
    add rsi, rax ; Adiciona o valor em RSI ao valor em RAX e armazena em RSI
    mov rax, [meses] ; Move o valor dos meses inputados para o RAX
    mov rbx, num_dias_no_mes ; Move o valor constante 30 para o RBX
    mul rbx ; Multiplica o valor em RAX por RBX e armazena o resultado em RAX
    add rsi, rax ; Adiciona o valor em RSI a RAX e armazena em RSI para ser usado como argumento
    ; no printf
    mov rdi, mensagem_saida_in_dias ; Move a mensagem formatada de resposta para o RDI
    call printf ; Imprime no terminal o resultado
    
    ; Termina o programa
    leave
    ret
