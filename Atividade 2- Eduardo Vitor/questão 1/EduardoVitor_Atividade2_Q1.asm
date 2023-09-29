; ATIVIDADE PRÁTICA 2 - QUESTÃO 1
; EDUARDO VITOR - 221215231

section .data
Pergunta_Nome: db "Digite um Nome com tudo em minusculo: ",0
Pergunta_Letra: db "Digite uma Letra em minusculo: ",0
Letras: db "A primeira letra do nome é : %c",10,"A ultima letra do nome é : %c",10,0
Letra_encontrada: db " Encontrado a letra '%c'em '%s'",10,0
Letra_N_encontrada: db "Não encontrado a letra'%c'em '%s'",10,0
scan_Nome: db "%s",0
scan_letra: db " %c",0

;As variaveis que salvaremos o nome e a letra
section .bss
nome resb 255
letra resb 1

section .text
global main
extern scanf
extern printf

main:
; imprimi as perguntas para o usuario e ler suas respostas
    push rbp
    mov rbp, rsp
    
    mov rdi, Pergunta_Nome
    call printf 
    
    mov rdi, scan_Nome
    mov rsi, nome
    call scanf

    mov rdi, Pergunta_Letra
    call printf

    mov rdi, scan_letra
    mov rsi, letra
    call scanf
    
    mov rsi, [nome]
    mov rax, nome

; onde pega a ultima letra do nome
ultima_Letra:
    inc rax
    cmp byte [rax], 0x0
    jnz ultima_Letra
    mov rdx, [rax-1]
    mov rdi, Letras
    call printf
    
; coloca a letra no registrado bl de 8 bit
    mov rax, nome-1
    mov bl, byte [letra]
    
; Onde procura para localizar a letra no nome
procura:
    inc rax
    cmp byte [rax], 0x0
    je N_encontrado
    cmp byte [rax], bl
    jne procura
; onde imprimi ao usuario se encontrou ou não a letra no nome
encontrado:
    mov rdi, qword Letra_encontrada
    mov rsi, [letra]
    mov rdx, nome
    call printf
    jmp saida

N_encontrado:
    mov rdi, qword Letra_N_encontrada
    mov rsi,[letra]
    mov rdx,nome
    call printf
; finaliza o programa
saida: 
    leave
    ret
;nasm -felf64 EduardoVitor_Atividade2_Q1.asm && gcc EduardoVitor_Atividade2_Q1.o && ./a.out