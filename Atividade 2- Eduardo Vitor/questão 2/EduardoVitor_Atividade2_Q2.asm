; ATIVIDADE PRÁTICA 2 - QUESTÃO 1
; EDUARDO VITOR - 221215231

; As mensagens que irão aparecer no terminal e os valores para fazer as operação
section .data
Titulo: db "Digite abaixo a sua idade de expressa em anos,meses e dias",10,0
Anos: db "Quantos anos:",0
meses: db "Quantos meses:",0
dias: db "Quantos dias:",0
scan_anos: db "%d",0
scan_meses: db "%d",0
scan_dias: db "%d",0
Resposta: db "Está pessoa possui %d dias de vida",10, 0
year dd 365
month db 30

; As variaveis para salvar os dados do usuario
section .bss
ano resd 1
mes resd 1
dia resd 1

section .text
global main
extern scanf
extern printf

main:
; imprimi no terminal como inserir os dados
    push rbp
    mov rbp, rsp
    
    mov rdi, Titulo
    call printf 
    
; imprimi e ler os dados relacionado ao ano, mes e dia 
    mov rdi, Anos
    call printf 
  
    mov rdi, scan_anos
    mov rsi, ano
    call scanf
    
    mov rdi, meses
    call printf 
  
    mov rdi, scan_meses
    mov rsi, mes
    call scanf

    mov rdi, dias
    call printf 
  
    mov rdi, scan_dias
    mov rsi, dia
    call scanf
; onde ocorre os calculos para saber a quantidade de dias
    mov rax, [ano] ; passa o ano que o usuario digitou para o rax
    mov rdx,[year] ; move 365 para rdx
    mul rdx ; multiplica rax por rdx para transformar anos em dias
    add rax ,[dia] ; soma com o rax quantidade de dias que o usuario digitou
    mov rsi,rax ;salvo o total no rsi
    mov rax , [mes] ;movo a quantidade de mes que usuario digitou para rax
    mov rdx,[month]; movo 30 para rdx
    mul rdx ; multiplico rax por rdx para transformar meses em dias
    add rsi,rax ; somo rsi com rax para achar a quantidade de dias ao todo
    
    ; imprimi a resposta final de quantos dias a pessoa tem de vida
    mov rdi,Resposta
    call printf
    
    ; finaliza o programa
    leave
    ret

;nasm -felf64 EduardoVitor_Atividade2_Q2.asm && gcc EduardoVitor_Atividade2_Q2.o && ./a.out