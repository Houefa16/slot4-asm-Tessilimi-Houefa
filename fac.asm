    global my_func
_start:

my_func:
    xor rax, rax
    cmp byte[rdx], 'A'
    jl out
    cmp byte[rdx], 'a'
    jl out
    cmp byte[rdx], 'Z'
    jg out
    cmp byte[rdx], 'z'
    jg out
    jmp search
    
search:
    mov r11b, byte[rdx]
    mov r12b, byte[rdi + rax]
    cmp r11b, r12b
    je find
    cmp r11b, 0
    je out
    inc rax
    jmp search

find:
    ret
    
out:
    mov rax, -84
    ret
