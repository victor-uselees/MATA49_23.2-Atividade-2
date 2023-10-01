;MATA49	- PROGRAMAÇÃO DE SOFTWARE BÁSICO - T01
;ATIVIDADE PRÁTICA 2 - QUESTÃO 1
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
  format_nome db "%s", 0
  format_letra db " %c", 0
  str1 db "Primeira Letra: %c",10,"Última letra: %c",10,0
  str2 db "Letra '%c' encontrada!",10,0
  str3 db "Letra '%c' não encontrada!",10,0

section .bss ; Dados não inicializados
  nome resb 10
  letra resb 1

;------------------------------------

section .text 
main:
  push rbp
  mov rbp, rsp

  mov rsi, nome
  mov rdi, format_nome
  call scanf

  mov rsi, letra
  mov rdi, format_letra
  call scanf

  mov rsi, [nome]
  mov rax, nome

  .loop:
    inc rax
    cmp byte [rax], 0x0
    jne .loop
    mov rdx, [rax-1]
    mov rdi, str1
    call printf
  
    mov rax, nome-1
    mov bl, byte [letra]
  
    jmp .buscar_letra
  
    .buscar_letra:
      inc rax
      cmp byte [rax], 0x0
      je .nfound
      cmp byte [rax], bl
      jne .buscar_letra
  
    .found:
      mov rsi, [letra]
      mov rdi, qword str2
      mov rdx, nome
      call printf
      jmp .exit
  
    .nfound:
      mov rsi, [letra]
      mov rdi, qword str3
      mov rdx, nome
      call printf

    .exit:
      mov rax, SYS_EXIT
      mov rdi, 0
      syscall 
