print_string:
push ax
mov ah, 0x0e

.repeat:
mov al, [bx]
int 0x10
add bx, 1
cmp al, 0
je .return
jmp .repeat

.return:
pop ax
ret

