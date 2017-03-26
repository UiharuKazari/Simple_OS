[org 0x7c00]
mov ah, 0x00
mov al, 0x03
int 0x10

mov bx, BOOT_MSG
call print_string

call endline

mov bx, PRESS_MSG
call print_string

call endline
call endline

mov ah, 0x00
int 0x16

mov bx, WELCOME_MSG
call print_string 

call endline
call endline

mov bx, SHELL_HEAD
call print_string

call read_string

;mov ah, 0x0e
;mov al, 'S'
;int 0x10

jmp $

%include "print_string.asm"
%include "endline.asm"
%include "read_string.asm"
%include "print_hex8.asm"
%include "print_hex16.asm"
%include "cmp_string.asm"

BOOT_MSG:
;	db 'Booting Successful..', 0
	db 'B..', 0
PRESS_MSG:
;	db 'Press any key to continue !', 0
	db 'P !', 0
WELCOME_MSG:
;	db 'Welcome ! Type help or about to know more', 0
	db 'W', 0
SHELL_HEAD:
	db '>>', 0
INVALID_MSG:
	db 'File not found !', 0
INPUT_HELP:
	db 'help', 0x0d
INPUT_ECHO:
	db 'echo', 0x0d
;INPUT_REG:
;	db 'reg', 0x0d
;INPUT_VIDMEM:
;	db 'vidmem', 0x0d
;INPUT_EXIT:
;	db 'exit', 0x0d
;INPUT_ABOUT:
;	db 'about', 0x0d		;TODO haha not enough space
INPUT: resb 10		;TODO warning

times 510-($-$$) db 0

dw 0xaa55
