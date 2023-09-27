; ATIVIDADE PRÁTICA 2 - QUESTÃO 2
; PEDRO MIRANDA - 222216223

        global  main
        extern  scanf
        extern  printf
        extern  fflush
        extern  stdout

        section .data
rfmt:   db      "%u", 0
wfmt:   db      "%u", 10, 0
msgy:   db      "Anos: ", 0
msgm:   db      "Meses: ", 0
msgd:   db      "Dias: ", 0

        section .bss
y:      resq    1
m:      resq    1
d:      resq    1

        section .text
main:   push    rbp
        mov     rbp, rsp
        
        mov     rdi, msgy       ; print "Anos: "
        call    printf          ;
        mov     rdi, [stdout]   ;
        call    fflush          ;
        
        mov     rdi, rfmt       ; read y
        mov     rsi, y          ;
        call    scanf           ;
        
        mov     rdi, msgm       ; print "Meses: "
        call    printf          ;
        mov     rdi, [stdout]   ;
        call    fflush          ;
        
        mov     rdi, rfmt       ; read m
        mov     rsi, m          ;
        call    scanf           ;
        
        mov     rdi, msgd       ; print "Dias: "
        call    printf          ;
        mov     rdi, [stdout]   ;
        call    fflush          ;
        
        mov     rdi, rfmt       ; read d
        mov     rsi, d          ;
        call    scanf           ;
        
        mov     rax, [y]        ; calculate answer
        mov     rbx, 365        ;
        mul     rbx             ;
        push    rax             ;
        mov     rax, [m]        ;
        mov     rbx, 30         ;
        mul     rbx             ;
        push    rax             ;
        mov     rax, [d]        ;
        pop     rbx             ;
        add     rax, rbx        ;
        pop     rbx             ;
        add     rax, rbx        ;
        
        mov     rdi, wfmt       ; print answer
        mov     rsi, rax        ;
        xor     rax, rax        ;
        call    printf          ;
        
        mov     rsp, rbp
        pop     rbp
        
        mov     rax, 60
        xor     rdi, rdi
        syscall
