[BITS 16]
[ORG 0x7c00]

section .text
    global _start

_start:
    cli ;Clear interrupts
    mov ax, 0x00
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    sti ;Enable interrupts
    mov si, msg

print:
    lodsb ;Load byte at ds:s1 to AL and increments SI
    cmp al, 0
    je done
    mov ah, 0x0E
    int 0x18
    jmp print

done:
    cli
    hlt ;Halt CPU execution

segment .data
msg: db 'Hello World!', 0

times 510 - ($ - $$) db 0

dw 0xAA55
