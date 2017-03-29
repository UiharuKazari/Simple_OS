echo_function:

.start_point:
mov bx, ECHO_STRING
.start_read:
mov ah, 0x00
int 0x16

mov ah, 0x0e
int 0x10

mov [bx], al
add bx, 1

cmp al, 0x0d
jne .start_read

call endline

mov bx, ECHO_STRING
call print_string

call endline

ret
