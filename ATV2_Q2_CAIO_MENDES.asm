;ATIVIDADE PRATICA 2
;CAIO SOUSA MENDES - 218218399

section .data
    mensagemAno db "Anos: ", 0
    mensagemMeses db "Meses: ", 0
    mensagemDias db "Dias: ", 0
    mensagemResposta db "A idade em dias: %d dias", 10 ,0

    diasPorAno dd 365
    diasPorMes dd 30
    
    fmt db "%d", 0

section .bss
    anos resq 1
    meses resq 1
    dias resq 1
    resultado resq 1
section .text

    global main
    extern scanf 
    extern printf 
    
main:   

    push rbp
    mov rbp, rsp 

    mov rdi, mensagemAno
    call printf 

    mov rdi, fmt
    lea rsi, [anos]
    call scanf

    mov rdi, mensagemMeses
    call printf 

    mov rdi, fmt
    lea rsi, [meses]
    call scanf

    mov rdi, mensagemDias
    call printf 

    mov rdi, fmt
    lea rsi, [dias]
    call scanf

    mov rax, [anos]
    mov rbx, [meses]
    imul rax, [diasPorAno]
    imul rbx, [diasPorMes]

    add rax, rbx
    add rax, [dias]
    
    mov [resultado], rax

    mov rdi, mensagemResposta
    mov rsi, [resultado]
    call printf

    
    leave 
    ret

