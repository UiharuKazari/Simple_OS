[org 0x7c00]
mov ah, 0x02

mov dl, 0
mov ch, 0
mov dh, 0
mov cl, 1
mov al, 1

mov bx, 0xa000
mov es, bx
mov bx, 0x1234

int 0x13

jc disk_error

disk_error:
mov bx, DISK_ERROR_MSG
call print_string
jmp $

%include "print_string.asm"

DISK_ERROR_MSG db "Disk read error", 0

times 510-($-$$) db 0
dw 0xaa55
