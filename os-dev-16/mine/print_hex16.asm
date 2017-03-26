;print hex in 'bx'
print_hex16:
	push ax
	mov ax, bx
	and ax, 0x000f
	cmp ax, 10
	jl .lessThanTen1
	add ax, 87
	jmp .setChr1
.lessThanTen1:
	add ax, 48
	jmp .setChr1
.setChr1:
	mov byte [HEX_OUT+5], al
	shr bx, 4

	mov ax, bx
	and ax, 0x000f
	cmp ax, 10
	jl .lessThanTen2
	add ax, 87
	jmp .setChr2
.lessThanTen2:
	add ax, 48
	jmp .setChr2
.setChr2:
	mov byte [HEX_OUT+4], al
	shr bx, 4

	mov ax, bx
	and ax, 0x000f
	cmp ax, 10
	jl .lessThanTen3
	add ax, 87
	jmp .setChr3
.lessThanTen3:
	add ax, 48
	jmp .setChr3
.setChr3:
	mov byte [HEX_OUT+3], al
	shr bx, 4

	mov ax, bx
	and ax, 0x000f
	cmp ax, 10
	jl .lessThanTen4
	add ax, 87
	jmp .setChr4
.lessThanTen4:
	add ax, 48
	jmp .setChr4
.setChr4:
	mov byte [HEX_OUT+2], al
	shr bx, 4

	mov bx, HEX_OUT
	call print_string
	pop ax
	ret

HEX_OUT:
	db '0x0000', 0
