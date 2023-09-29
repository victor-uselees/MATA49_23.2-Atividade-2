;ATIVIDADE PRATICA 2
;CAIO SOUSA MENDES - 218218399

bits 64
global  _start

section .data
    perguntaAluno db "Digite um nome: "
    tamanhoPerguntaAluno equ $ - perguntaAluno
    mensagemBemVindo db "Digite uma letra: "
    tamanhoMensagemBemVindo equ $ - mensagemBemVindo
    mensagemAchouLetra db "Achou a letra! "
    tamanhoMensagemAchouLetra equ $ - mensagemAchouLetra
    mensagemNaoAchouLetra db "Nao achou a letra! "
    tamanhoMensagemNaoAchouLetra equ $ - mensagemNaoAchouLetra

section .bss
    nome resb 64
    letra resb 1
    ultimaLetra resb 1
    
section .text
    global main

_start:

    mov rax, 1         
    mov rdi, 1         
    mov rsi, perguntaAluno      
    mov rdx, tamanhoPerguntaAluno      
    syscall


    mov rax, 0        
    mov rdi, 0         
    mov rsi, nome      
    mov rdx, 64        
    syscall

 
    mov rax, 1          
    mov rdi, 1        
    mov rsi, nome      
    mov rdx, tamanhoMensagemBemVindo      
    syscall

    mov rax, 1       
    mov rdi, 1        
    mov rsi, mensagemBemVindo      
    mov rdx, tamanhoMensagemBemVindo       
    syscall

    mov rax, 0        
    mov rdi, 0         
    mov rsi, letra      
    mov rdx, 1     
    syscall
    

    mov ecx, -1
    
.procuraLetra:

    cmp al, 0 
    je .naoAchou
    
    inc ecx
    mov al, [nome + ecx]
    mov bl, [letra]
    cmp  al, bl
    jne  .procuraLetra
    je .achouLetra      

.naoAchou:
    mov rax, 1       
    mov rdi, 1        
    mov rsi, mensagemNaoAchouLetra     
    mov rdx, tamanhoMensagemNaoAchouLetra       
    syscall

    mov ecx, -1
    jmp .imprimeLetra

.achouLetra:
    mov rax, 1       
    mov rdi, 1        
    mov rsi, mensagemAchouLetra     
    mov rdx, tamanhoMensagemAchouLetra       
    syscall

    mov rcx, -1
    mov rdi,nome
    
    jmp .imprimeLetra

.calculaTamanhoNome:

    mov al, [rdi + rcx]
    cmp     al, 0
    je .chegouFinalNome
    inc rcx
    jmp .calculaTamanhoNome
    
.chegouFinalNome:

    dec  rcx
    add rdi, rcx
    mov al, [rdi]
    mov  [ultimaLetra], al

    jmp .imprimeLetra
    
.imprimeLetra:

   

    mov rax, 1       
    mov rdi, 1        
    mov rsi, nome     
    mov rdx, 1     
    syscall

    mov rax, 1       
    mov rdi, 1        
    mov rsi, [ultimaLetra]
    mov rdx, 2     
    syscall
   
   jmp .finaliza
    
.finaliza:
    mov rax, 60        
    mov rdi, 0      
    syscall
