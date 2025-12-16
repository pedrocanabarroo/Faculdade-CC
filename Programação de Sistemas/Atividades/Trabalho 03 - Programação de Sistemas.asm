org 100h       ; programa .COM inicia no offset 100h

inicio:
    mov ah, 08h    ; ler caractere sem eco
    int 21h
    cmp al, 13     ; verificar se foi ENTER (CR = 13)
    je fim         ; se sim, termina

    ; verificar se esta entre 'a' e 'z'
    cmp al, 'a'
    jl imprime     ; se menor que 'a', nao altera
    cmp al, 'z'
    jg imprime     ; se maior que 'z', nao altera
    sub al, 32     ; converte para maiusculo (a->A, b->B, etc.)

imprime:
    mov dl, al     ; colocar caractere em DL para imprimir
    mov ah, 02h
    int 21h
    jmp inicio     ; volta para ler outro caractere

fim:
    mov ah, 4Ch    ; encerrar programa
    int 21h
