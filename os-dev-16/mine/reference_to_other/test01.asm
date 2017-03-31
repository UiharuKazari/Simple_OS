[org 0x7c00]
mov bx, MSG
start:
mov ah, 0x0e
mov al, [bx]
cmp al, 0
je end
int 0x10
add bx, 1
jmp start
end:

MSG:
	db 'zhangfx', 0
times 510-($-$$) db 0
dw 0xaa55
