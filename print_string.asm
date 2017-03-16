print_string:
;pusha
mov ah, 0x0e
;mov al, [0x7c18]
;mov bx, 0x7c23
.repeat:
mov al, [bx]
int 0x10
add bx, 1
cmp al, 0
je .return
jmp .repeat
;popa
.return:
ret
