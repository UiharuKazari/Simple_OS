show_reg:
;pusha
mov bx, $
call print_hex16

mov bx, ax
call print_hex16

mov bx, bx
call print_hex16

mov bx, cx
call print_hex16

mov bx, dx
call print_hex16

mov bx, cs
call print_hex16

mov bx, ds
call print_hex16

mov bx, ss
call print_hex16

mov bx, es
call print_hex16

mov bx, sp
call print_hex16

mov bx, si
call print_hex16

mov bx, di
call print_hex16

mov bx, gs
call print_hex16

mov bx, fs
call print_hex16

;popa
ret
