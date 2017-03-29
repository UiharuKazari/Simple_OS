[org 0x7c00]
mov ah, 0x0e
mov al, 'A'
int 0x10

mov ah, 0x02		;read function
mov al, 0x01		;read 1 sector
mov cx, 0x0002		;sector 2, track 0 (second 512)
mov dx, 0x0080 		;how can i know dl 80 is my disk!!!!!!!!!!
mov bx, 0x1000
mov es, bx
mov bx, 0x0000		;read to 0xa0000
int 0x13

jmp 0x1000:0		;STEAL2

MSG:
	db 'something',0

times 510-($-$$) db 0
dw 0xaa55

mov ah, 0x0e
mov al, 'B'
int 0x10

mov bx, MSG
call print_string
;mov ah, 0x0e

;repeat:
;mov al, [bx]
;int 0x10
;add bx, 1
;cmp al, 0
;je return
;jmp repeat
;return:


jmp $

%include "../print_string.asm"
