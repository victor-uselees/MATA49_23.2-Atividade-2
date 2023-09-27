; ATIVIDADE PRÁTICA 2 - QUESTÃO 1
; PEDRO MIRANDA - 222216223

        global  main
        extern  scanf
        extern  printf
        extern  fflush
        extern  stdout

        section .data
rfmt:   db      "%s", 0
pptn:   db      "Insira um nome: ", 0
pptl:   db      "Insira uma letra: ", 0
msgf:   db      "Primeira letra: %c", 10, "Última letra: %c", 10, 0
mfnd:   db      "Letra encontrada", 10, 0
mnfd:   db      "Letra não encontrada", 10, 0

        section .bss
name:   resb    128
lett:   resb    1

        section .text
main:   push    rbp
        mov     rbp, rsp
        
        mov     rdi, pptn       ; prompt 1
        call    printf          ;
        mov     rdi, [stdout]   ;
        call    fflush          ;
        
        mov     rdi, rfmt       ; read name
        mov     rsi, name       ;
        call    scanf           ;
        
        mov     rdi, pptl       ; prompt 2
        call    printf          ;
        mov     rdi, [stdout]   ;
        call    fflush          ;
        
        mov     rdi, rfmt       ; read lett
        mov     rsi, lett       ;
        call    scanf           ;
        
        mov     rax, name       ; get last char
.lastc:	inc     rax             ;
        cmp     byte [rax], 0   ;
        jne     .lastc          ;
        
        mov     rdi, msgf       ; print msgf
        mov     rsi, [name]     ;
        mov     rdx, [rax-1]    ;
        xor     rax, rax        ;
        call    printf          ;
        
        mov     rax, name-1     ; find occurrence of lett in name
        mov     bl, [lett]      ;
.find:	inc     rax             ;
        cmp     byte [rax], 0   ;
        je      .notfd          ;
        cmp     byte [rax], bl  ;
        jne     .find           ;
        mov     rdi, mfnd       ;
        jmp     .end            ;
.notfd: mov     rdi, mnfd       ;
	    
.end:   xor     rax, rax        ; print result
        call    printf          ;
        
        mov     rsp, rbp
        pop     rbp
        
        mov     rax, 60
        xor     rdi, rdi
        syscall
