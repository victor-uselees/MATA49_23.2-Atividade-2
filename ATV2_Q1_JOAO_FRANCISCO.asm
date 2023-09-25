; ATIVIDADE PRÁTICA 2 - QUESTÃO 1
; JOÃO FRANCISCO IORIS DEAR - 222215080

global main
extern scanf
extern printf

section .data

FIRST_FORMAT db "primeira letra: %c",10,"segunda letra: %c",10,0
FOUND_FORMAT db "'%c' encontrado em '%s'",10,0
NOT_FOUND_FORMAT db "'%c' não encontrado em '%s'",10,0
READ_FORMAT db "%s",10,"%c",0
ASK_FOR_INPUT db "digite um nome, enter, e depois digite uma letra",10,0

section .bss
name_buf resb 256
character_buf resb 1

section .text

main:
	push rbp
	mov rbp,rsp

  mov rdi,ASK_FOR_INPUT
  call printf
  mov rdi, READ_FORMAT
  mov rsi,name_buf
  mov rdx,character_buf
  call scanf
  mov rsi,[name_buf]
  mov rax,name_buf
  ;mov r8,[character_buf]
  find_end:
  inc rax
  cmp byte [rax],0x0
  jne find_end
  mov rdx,[rax-1]
  mov rdi,FIRST_FORMAT
  call printf
  
  mov rax,name_buf-1
  mov bl,byte [character_buf]
  find_char:
  inc rax
  cmp byte [rax],0x0
  je notfound
  cmp byte [rax],bl
  jne find_char
  
  found:
	  mov rdi,qword FOUND_FORMAT
    mov rsi,[character_buf]
    mov rdx,name_buf
	  call printf
    jmp return

  notfound:
	  mov rdi,qword NOT_FOUND_FORMAT
    mov rsi,[character_buf]
    mov rdx,name_buf
	  call printf
    jmp return

  return:
	pop rbp
	mov eax,0
	ret
