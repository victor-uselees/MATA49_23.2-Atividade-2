; ATIVIDADE PRATICA 2 - QUESTAO 2
; Joao victor Luz Oliveira


section .note.GNU-stack
;utilizar toda vez que uma pilha nao for usada

section .data
  msg db 'Insira sua idade: ',10,0
  tam_msg equ $ - msg
  msg2 db 'Insira quantos meses tem desde o seu aniversario: ',10,0
  tam_msg2 equ $ - msg2
  msg3 db 'Insira o dia do mes atual: ',10, 0
  tam_msg3 equ $ - msg3
  fmt db "%d", 0


section .bss
  anos resb 16
  meses resb 16
  dias resb 16

section .text
  global main
  extern printf
  extern scanf

main:
  push rbp
  mov rbp, rsp

  mov rdi, msg
  call printf
  ; o printf printa o que está em rdi

  mov rdi, fmt
  mov rsi, anos
  call scanf

  mov rdi, msg2
  call printf

  mov rdi, fmt
  mov rsi, meses
  call scanf

  mov rdi, msg3
  call printf

  mov rdi, fmt
  mov rsi, dias
  call scanf
  ; O scanf vai mandar a informacao para rsi e o formato para receber deve estar em rdi 

  mov r8, [anos]
  imul r8, 365 ; o imul pode ser utilizado com qualquer registrador
  add [dias], r8

  mov r9, [meses]
  imul r9, 30
  add [dias], r9

  mov rdi, fmt
  mov rsi, [dias]
  call printf
  ;para printar um numero, e preciso armazenar o formato em rdi, e armazenar a informacao em rsi 

  leave 
  ret
  
  
  