; ATIVIDADE PRÁTICA 2 - QUESTÃO 2
; JOÃO FRANCISCO IORIS DEAR - 222215080

global main
extern scanf
extern printf

section .data

ASK_FOR_INPUT db "escreva sua idade no formato '<numero> anos <numero> meses <numero> dias'",10,0
READ_FORMAT db "%lu anos %lu meses %lu dias\n",0
WRITE_FORMAT db "você tem %lu dias",10,0

section .bss
years resq 1
months resq 1
days resq 1

section .text

main:
	push rbp
	mov rbp,rsp

  mov rdi,ASK_FOR_INPUT
  call printf
  
  mov rdi, READ_FORMAT
  mov rsi,years
  mov rdx,months
  mov rcx,days
  call scanf

  mov rsi,[days]
  mov rax,qword [years]
  mov rbx,365
  mul rbx
  add rsi,rax
  mov rax,qword [months]
  mov rbx,30
  mul rbx
  add rsi,rax
  mov rdi,WRITE_FORMAT
  call printf
  
	pop rbp
	mov eax,0
	ret

