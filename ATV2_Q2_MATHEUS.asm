;MATA49	- PROGRAMAÇÃO DE SOFTWARE BÁSICO - T01
;ATIVIDADE PRÁTICA 2 - QUESTÃO 2
;MATHEUS MONTEIRO SOUTO - 223215395

SYS_READ equ 0
SYS_WRITE equ 1
SYS_EXIT equ 60

STDIN      equ   0
STDOUT     equ   1

global main
extern scanf
extern printf
;------------------------------------

section .data ; Dados inicializados
  format_read db "%d", 0 
  format_write db "%d dias.", 10, 0 
  dias_total equ 365 
  meses_total equ 30

section .bss ; Dados não inicializados
  anos resq 1
  meses  resq 1 
  dias resq 1 

;------------------------------------

section .text
main:
push rbp
mov rbp, rsp

mov rsi, anos 
mov rdi, format_read
call scanf

mov rsi, meses 
mov rdi, format_read
call scanf

mov rsi, dias
mov rdi, format_read
call scanf

jmp .calcular_dias

  .calcular_dias:
    mov rsi, [dias]
    mov rax, [anos] 
    mov rbx, dias_total 
    mul rbx 
    add rsi, rax 
    mov rax, [meses] 
    mov rbx, meses_total 
    mul rbx
    add rsi, rax
    mov rdi, format_write
    call printf 
    jmp .exit
  
  .exit:
    mov rax, SYS_EXIT
    mov rdi, 0
    syscall 
