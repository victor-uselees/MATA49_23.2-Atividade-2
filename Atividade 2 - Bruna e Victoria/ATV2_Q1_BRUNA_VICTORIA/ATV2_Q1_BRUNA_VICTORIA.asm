; ATIVIDADE PRÁTICA 2 - QUESTÃO 2
; NOME BRUNA ANUNCIACAO DE SANTANA - 221216927
; NOME VICTORIA BEATRIZ SILVA DE AZEVEDO REIS - 221216928

section .bss
  frase resb 64
  letra resb 1
  ultLetra resb 8
  cade resb 1

global _start

section .text
  _start:
    ;mensagem na tela
    mov rax, 1
    mov rdi, 1
    mov rsi, frase_tela
    mov rdx, frase_tela_len
    syscall

    ;ler frase
    mov rax, 0
    mov rdi, 0
    mov rsi, frase
    mov rdx, 64
    syscall

 	;mensagem na tela
    mov rax, 1
    mov rdi, 1
    mov rsi, frase_tela2
    mov rdx, frase_tela2_len
    syscall

   ;ler letra
    mov rax, 0
    mov rdi, 0
    mov rsi, letra
    mov rdx, 1
    syscall

    ;imprime letra inicial
    mov rax, 1
    mov rdi, 1
    mov rsi, frase
    mov rdx, 1
    syscall

 	;comparação com a letra
  	xor rcx, rcx
    quantidade_de_caracter:
        mov al, byte [rsi + rcx]
        cmp al, 10
		lea rbx, [rsi + rcx - 1]
        je termino_da_contagem
		cmp al, byte [letra]
  		je letra_igual
        inc rcx
        jmp quantidade_de_caracter

	letra_igual:
 	mov byte [achou], 0
  	inc rcx
  	jmp quantidade_de_caracter
   
    termino_da_contagem:
	; imprime ultima letra
	mov rax, 1
    mov rdi, 1
	mov rsi, "/n"
    mov rdx, 2
 
 	mov rax, 1
    mov rdi, 1
	mov rsi, rbx
    mov rdx, 1
    syscall

 	cmp byte [achou], 0
  	je print_achou

   	print_não_achou:
	mov rax, 1
    mov rdi, 1
    mov rsi, nao_achou
    mov rdx, nao_achou_len
    syscall
	jmp fim

 	print_achou:
  	mov rax, 1
    mov rdi, 1
    mov rsi, achou
    mov rdx, achou_len
    syscall 	

    ;finaliza o programa
	fim:
    mov rax, 60
    xor rdi, rdi
    syscall

section .data
    frase_tela: db "Escreva um nome qualquer "
    frase_tela_len equ $ - frase_tela
    frase_tela2: db "Escreva uma letra qualquer "
    frase_tela2_len equ $ - frase_tela2
    achou: db "  Achei a letra escrita no nome. "
    achou_len equ $ - achou
    nao_achou: db " Não achei a letra escrita no nome."
    nao_achou_len equ $ - nao_achou