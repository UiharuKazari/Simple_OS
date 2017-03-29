read_string:
push ax
.start_point:
mov bx, SHELL_HEAD
call print_string

mov bx, INPUT
.start_read:
mov ah, 0x00
int 0x16

;mov bl, al
;call print_hex8 	;press 'a' 0x61 in al

;mov bl, ah
;call print_hex8		;add push/pop ax in print_hex8 for not
			;change al

mov ah, 0x0e
int 0x10

mov [bx], al
add bx, 1

;if get Enter '\r' 0x0d, then stop
cmp al, 0x0d		;press Enter, 0x0d in al, CR '\r'
jne .start_read

call endline
call endline

mov ah, 0x0e
mov al, ' '
int 0x10

;mov bx, INPUT
;call print_string




;the string can be 'help' 'echo' 'reg' 'vidmem' 'exit' 'about'
;function cmp_string:
;mov bx, STRING
;call cmp_string
;the function ret al 0x00-> ok, 0x01->fail

mov bx, INPUT_HELP
call cmp_string
cmp al, 0x00
je .func_help

mov bx, INPUT_ECHO
call cmp_string
cmp al, 0x00
je .func_echo

mov bx, INPUT_REG
call cmp_string
cmp al, 0x00
je .func_reg

mov bx, INPUT_VIDMEM
call cmp_string
cmp al, 0x00
je .func_vidmem

mov bx, INPUT_EXIT
call cmp_string
cmp al, 0x00
je .func_exit

mov bx, INPUT_ABOUT
call cmp_string
cmp al, 0x00
je .func_about

mov bx, INVALID_MSG
call print_string
call endline
jmp .start_point

.func_help:
mov bx, OUTPUT_HELP
call print_string
jmp .start_point
.func_echo:
call echo_function
jmp .start_point
.func_reg:
call show_reg
jmp .start_point
.func_vidmem:
jmp .start_point
.func_exit:
int 0x19
.func_about:
mov bx, OUTPUT_ABOUT
call print_string

jmp .start_point

pop ax
ret
