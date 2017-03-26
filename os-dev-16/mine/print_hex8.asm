;print hex in 'bl'
print_hex8:
	push ax
	mov al, bl 
	and al, 0x0f
	cmp al, 10
	jl .lessThanTen18
	add al, 87
	jmp .setChr18
.lessThanTen18:
	add al, 48
	jmp .setChr18
.setChr18:
	mov byte [HEX_OUT8+3], al
	shr bl, 4

	mov al, bl
	and al, 0x0f
	cmp al, 10
	jl .lessThanTen28
	add al, 87
	jmp .setChr28
.lessThanTen28:
	add al, 48
	jmp .setChr28
.setChr28:
	mov byte [HEX_OUT8+2], al
	shr bl, 4

	mov bx, HEX_OUT8
	call print_string
	pop ax
	ret

HEX_OUT8:
	db '0x00', 0
