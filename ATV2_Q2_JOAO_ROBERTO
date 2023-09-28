; ATIVIDADE PRATICA 2 - QUESTÂO 2 
; JOÃO ROBERTO DA SILVA PORTO - 222217111
global main

extern scanf
extern printf
extern stdout
extern fflush

section .data
  prompt_for_year db "Quantos anos você tem: ", 0
  prompt_for_months db "Quantos meses se passaram desde o seu aniversário: ", 0
  prompt_for_days db "Qual dia do mês é hoje?: ", 0
  output_format db "%d", 10
  input_format db "%d", 0
  total dq 0

section .bss 
  years resq 1
  months resq 1
  days resq 1

section .text
  main:
    push rbp
    mov rbp, rsp
  
    mov rdi, prompt_for_year
    call printf
    mov rdi, [stdout]
    call fflush

    mov rdi, input_format
    mov rsi, years
    call scanf

    mov rdi, prompt_for_months
    call printf
    mov rdi, [stdout]
    call fflush

    mov rdi, input_format
    mov rsi, months
    call scanf

    mov rdi, prompt_for_days
    call printf
    mov rdi, [stdout]
    call fflush

    mov rdi, input_format
    mov rsi, days
    call scanf

    xor rax, rax
    mov rbx, 365
    mov rax, qword[years]
    mul rbx

    mov rbx, qword[days]
    add rbx, rax

    mov rax, 30
    mov rsi, qword[months]
    mul rsi

    add rbx, rsi

    mov rdi, output_format
    mov rsi, rbx
    call printf
    mov rdi, [stdout]
    call fflush

    mov rax, 60
    mov rdi, 0
    syscall
