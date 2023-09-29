; ATIVIDADE PRÁTICA 2 - QUESTÃO 1
; NOME Estácio Gonçalves - 222216227
; NOME Fábio César Tosta - 222217108

bits 64

section .bss
    nome resb 64
    letra resb 1
    ultima resb 1
section .data
    solicita_nome: db "Qual o seu nome?", 10
    solicita_letra: db 10,"Digite uma letra: ", 10
    encontrou_letra: db "O seu nome contém a letra", 10 ;26
    nao_encontrou_letra: db "O seu nome não contém a letra", 10 ;30
    primeira_letra: db "A primeira letra do seu nome é: ", 10 ;32
    ultima_letra: db "A ultima letra do seu nome é: ", 10; 30
section .text

imprime_ultima_letra:
    mov rax, 1
    mov rdi, 1
    mov rsi, ultima_letra
    mov rdx, 31
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, ultima
    mov rdx, 1
    syscall
    ret

find_ultima_letra:
    mov r11, 0
    .loop:
      cmp byte [r8+r11], 10
      je .end
      mov rax, [r8+r11]
      mov [ultima], rax
      inc r11
      jmp .loop      
    .end:
      call imprime_ultima_letra
      ret

imprime_nao_tem_letra:
    mov rax, 1
    mov rdi, 1
    mov rsi, nao_encontrou_letra
    mov rdx, 32
    syscall
    ret
    
imprime_tem_letra:
    mov rax, 1
    mov rdi, 1
    mov rsi, encontrou_letra
    mov rdx, 27
    syscall
    ret
    
tem_letra:
    mov r11, 0
    .loop:
      cmp byte [r8+r11], r9b
      je .imprime_tem_letra
      cmp byte [r8+r11], 10
      je .end
      inc r11
      jmp .loop
    .imprime_tem_letra:
      call imprime_tem_letra
      ret      
    .end:
      call imprime_nao_tem_letra
      ret
      
global _start
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, solicita_nome
    mov rdx, 17
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, nome
    mov rdx, 64
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, primeira_letra
    mov rdx, 33
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, nome
    mov rdx, 1
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, solicita_letra
    mov rdx, 20
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, letra
    mov rdx, 1
    syscall
    
    mov r8, nome
    movzx r9, byte [letra]
    call tem_letra

    call find_ultima_letra
    
    mov rax, 60
    xor rdi, rdi
    syscall