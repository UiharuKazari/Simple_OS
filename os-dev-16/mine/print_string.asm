print_string:
push ax
mov ah, 0x0e

.repeat:
mov al, [bx]
cmp al, 0
je .return
cmp al, 0x0a
jne .not_enter
call endline
.not_enter:
int 0x10
add bx, 1
jmp .repeat

.return:
pop ax
ret

