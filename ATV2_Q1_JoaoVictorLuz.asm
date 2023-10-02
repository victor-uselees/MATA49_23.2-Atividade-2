; ATIVIDADE PRATICA 2 - QUESTAO 1
; Joao victor Luz Oliveira
; o programa pede para inserir o nome duas vezes(propositalmente)

section .data
  msg db 'Insira um nome: ',0
  tam_msg equ $ - msg
  msg2 db '   Insira uma letra: ',0
  tam_msg2 equ $ - msg2
  msg3 db 'Nao encontrou', 0
  tam_msg3 equ $ - msg3
  msg4 db 'Encontrou', 0
  tam_msg4 equ $ - msg4
  msg5 db 'Insira o mesmo nome: ', 0
  tam_msg5 equ $ - msg5

section .bss
  ultima_letra resb 1
  input_nome resb 36
  input_letra resb 1
  input_nome2 resb 36

section .text
  global _start

_start:
  mov rax, 1 ;printa primeira msg
  mov rdi, 1
  mov rsi, msg
  mov rdx, tam_msg
  syscall

  mov rax, 0 ;recebe o nome
  mov rdi, 0
  mov rsi, input_nome 
  syscall

  mov rax, 1
  mov rdi, 1
  mov rsi, input_nome
  mov rdx, 1
  syscall
  
  xor rcx, rcx
  
contador_de_letras:
  mov al, byte[input_nome + rcx]  
  cmp al, 0
  je resto

  inc rcx
  jmp contador_de_letras
  
resto:
  mov r8, [input_nome + rcx -2]
  mov [ultima_letra], r8
  
  mov rax, 1
  mov rdi, 1
  mov rsi, ultima_letra
  mov rdx, 1
  syscall

  mov rax, 1
  mov rdi, 1
  mov rsi, msg2
  mov rdx, tam_msg2
  syscall

  mov rax, 0
  mov rdi, 0
  mov rsi, input_letra
  syscall

  mov rax, 1
  mov rdi, 1
  mov rsi, msg5
  mov rdx, tam_msg5
  syscall

  ; Quebrei muito a cabeca para resolver o problema em imput nome, e não encontrei outra solucao além de ter que digitar novamente
  mov rax, 0
  mov rdi, 0
  mov rsi, input_nome
  syscall
  
  xor rcx, rcx
  xor al, al
  
procura_letras:
  mov al, byte[input_nome + rcx]
  
  cmp al, [input_letra]
  je achou
  cmp al, 0
  je nao_achou

  inc rcx
  jmp procura_letras

achou:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg4
  mov rdx, tam_msg4
  syscall
  jmp final

nao_achou:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg3
  mov rdx, tam_msg3
  syscall
  jmp final
  
final:
  mov rax, 60
  xor rdi, rdi
  syscall
  
  
  