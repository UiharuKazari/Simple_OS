[org 0x7c00]

mov ax, 0x0204
mov cx, 0x0002
mov dx, 0x0080
mov bx, 0x1000
mov es, bx
mov bx, 0x0000
int 0x13

jmp 0x1000:0

BOOT_MSG:
	db 'Booting Successful..', 0
PRESS_MSG:
	db 'Press any key to continue !', 0
WELCOME_MSG:
	db 'Welcome ! Type help or about to know more', 0
SHELL_HEAD:
	db '>>', 0
INVALID_MSG:
	db 'File not found !', 0
INPUT_HELP:
	db 'help', 0x0d
INPUT_ECHO:
	db 'echo', 0x0d
INPUT_REG:
	db 'reg', 0x0d
INPUT_VIDMEM:
	db 'vidmem', 0x0d
INPUT_EXIT:
	db 'exit', 0x0d
INPUT_ABOUT:
	db 'about', 0x0d		;TODO haha not enough space
OUTPUT_HELP:
	db 'echo - reads a user input and echoes it back to screen',0x0a,\
	'reg - dumps registers',0x0a,\
	'vidmem - demonstrates writing to Video Memory',0x0a,\
	'exit - reboot',0x0a,\
	'about - general info',0x0a, 0
OUTPUT_ABOUT:
	db 'Another: Zhangfuxing',0x0a,\
	'Contact: xxx@qq.com',0x0a,\
	'Language: NASM 2.12.02', 0x0a, 0
INPUT: resb 10		;TODO warning
ECHO_STRING: resb 100	;TODO warning


times 510-($-$$) db 0
dw 0xaa55

mov ah, 0x00
mov al, 0x03		;text mode 16color 80*25 640*200
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

;mov bx, SHELL_HEAD
;call print_string

call read_string

;mov bx, $
;call print_hex16 		;this function is not work now
				;because 0x10000?

jmp $

%include "print_string.asm"
%include "endline.asm"
%include "read_string.asm"
%include "print_hex8.asm"
%include "print_hex16.asm"
%include "cmp_string.asm"
%include "echo_function.asm"
%include "show_reg.asm"
