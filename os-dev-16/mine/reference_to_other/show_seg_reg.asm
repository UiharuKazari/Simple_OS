[org 0]
jmp 0x7c0:start
start:
mov bx, si
mov cx, 0

loop:
mov ax, bx
and ax, 1
cmp ax, 1
je pone
mov ah, 0x0e
mov al, '0'
int 0x10
add cx, 1
cmp cx, 16
je end
shr bx, 1
jmp loop

pone:
mov ah, 0x0e
mov al, '1'
int 0x10
add cx, 1
cmp cx, 16
je end
shr bx, 1
jmp loop

end:
jmp $

times 510-($-$$) db 0
dw 0xaa55
