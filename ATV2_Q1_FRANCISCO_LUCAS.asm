;ATIVIDADE PRÁTICA 2 - QUESTÃO 1
;FRANCISCO SILVA SANTANA - MATRÍCULA 222216228
;LUCAS SAMPAIO SOUZA ANDRADE - MATRÍCULA 220115578


bits 64

section .data
  texto db 10, "Achei a letra!"
  tamTexto equ $ - texto

  texto2 db 10, "Não achei a letra!"
  tamTexto2 equ $ - texto2
  
section .bss
  nome resb 32
  tamNome equ $ - nome
  letra resb 1
  tamLetra equ $ - letra
  nome2 resb 32
  
section .text
  global  _start
  _start:     
    mov       rax, 0           ;recebe nome
    mov       rdi, 0
    mov       rsi, nome
    mov       rdx, 32           ; Lê até 32 caracteres
    syscall

    mov       rax, 0           ;recebe letra
    mov       rdi, 0
    mov       rsi, letra
    mov       rdx, 1
    syscall

    ; Imprimir o primeiro caractere
    mov       rax, 1
    mov       rdi, 1
    mov       rsi, nome
    mov       rdx, 1
    syscall

    ; Imprimir o último caractere
    mov r11, nome
    acha_ultima_letra:
    inc       r11
    cmp       byte [r11], 0
    jne       acha_ultima_letra
    sub       r11, 2            ;acha a verdadeira ultima letra
    mov       rax, 1
    mov       rdi, 1
    mov       rsi, r11
    mov       rdx, 1
    syscall
    
    mov       r10, 0
    mov       r8b, [letra]
    
    loopChar:
    mov       al, [nome + r10]
    cmp       al, 0
    je        endLoop
    cmp       al, r8b
    je        encontrou
    inc       r10
    jmp       loopChar
        
    endLoop:
    ; Imprimir mensagem de não encontrou
    mov       rax, 1
    mov       rdi, 1
    mov       rsi, texto2
    mov       rdx, tamTexto2
    syscall

    jmp       end

encontrou:
    ; Imprimir mensagem de encontrou a letra
    mov       rax, 1
    mov       rdi, 1
    mov       rsi, texto
    mov       rdx, tamTexto
    syscall

end:
    mov       rax, 60
    xor       rdi, rdi
    syscall
