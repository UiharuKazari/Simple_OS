endline:
pusha
;get cursor position (x, y)
;set cursor position (0, y+1)

mov ah, 0x03
mov bh, 0x00
int 0x10

mov ah, 0x02
mov bh, 0x00
add dh, 1
mov dl, 0x00
int 0x10
popa
ret
