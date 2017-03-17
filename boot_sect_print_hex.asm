[org 0x7c00]
mov dx, 0x1fb6
call print_hex

print_hex:
	mov bx, dx
	and bx, 0x000f
	cmp bx, 10
	jl .lessThanTen1
	add bx, 87
	jmp .setChr1
.lessThanTen1:
	add bx, 48
	jmp .setChr1
.setChr1:
	mov byte [HEX_OUT+5], bl
	shr dx, 4

	mov bx, dx
	and bx, 0x000f
	cmp bx, 10
	jl .lessThanTen2
	add bx, 87
	jmp .setChr2
.lessThanTen2:
	add bx, 48
	jmp .setChr2
.setChr2:
	mov byte [HEX_OUT+4], bl
	shr dx, 4

	mov bx, dx
	and bx, 0x000f
	cmp bx, 10
	jl .lessThanTen3
	add bx, 87
	jmp .setChr3
.lessThanTen3:
	add bx, 48
	jmp .setChr3
.setChr3:
	mov byte [HEX_OUT+3], bl
	shr dx, 4

	mov bx, dx
	and bx, 0x000f
	cmp bx, 10
	jl .lessThanTen4
	add bx, 87
	jmp .setChr4
.lessThanTen4:
	add bx, 48
	jmp .setChr4
.setChr4:
	mov byte [HEX_OUT+2], bl
	shr dx, 4

	mov bx, HEX_OUT
	call print_string
	ret

jmp $

%include "print_string.asm"

HEX_OUT:
	db '0x0000', 0

times 510-($-$$) db 0
dw 0xaa55
