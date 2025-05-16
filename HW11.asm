section .data
inputBuf: db 0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A
inputLen: equ $ - inputBuf
hexChars: db "0123456789ABCDEF"
newline:  db 0x0A

section .bss
outputBuf: resb 80

section .text
global _start

_start:
    mov rsi, inputBuf     ; pointer to input data
    mov rdi, outputBuf    ; pointer to output buffer
    mov rcx, inputLen     ; how many bytes to process

.loop:
    cmp rcx, 0
    je .done

    ; load input byte into AL
    mov al, [rsi]

    ; high nibble (right shift 4)
    mov bl, al
    shr bl, 4
    movzx rbx, bl
    mov dl, [hexChars + rbx]
    mov [rdi], dl
    inc rdi

    ; low nibble
    mov al, [rsi]
    and al, 0x0F
    movzx rbx, al
    mov dl, [hexChars + rbx]
    mov [rdi], dl
    inc rdi

    ; add space
    mov byte [rdi], ' '
    inc rdi

    ; next byte
    inc rsi
    dec rcx
    jmp .loop

.done:
    ; replace last space with newline
    dec rdi
    mov byte [rdi], 0x0A

    ; calculate length
    mov rdx, rdi
    sub rdx, outputBuf

    ; write syscall
    mov rax, 1      ; sys_write
    mov rdi, 1      ; stdout
    mov rsi, outputBuf
    syscall

    ; exit syscall
    mov rax, 60
    xor rdi, rdi
    syscall
