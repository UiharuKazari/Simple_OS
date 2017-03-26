;cmp INPUT and INPUT_'STH'
cmp_string:
push dx
push cx
mov dx, bx				;stroe argument in dx
xor cx, cx
.start_bit_cmp:

mov bx, INPUT
add bx, cx
mov ah, [bx]

mov bx, dx
;mov bx, INPUT_HELP
add bx, cx
mov al, [bx]

;if ah = 0x0d or al = 0x0d, stop
cmp ah, 0x0d
jne .not_end
; input end
cmp al, 0x0d
jne .bit_cmp_fail
jmp .bit_cmp_ok

.not_end:
cmp ah, al
je .bit_eq

jmp .bit_cmp_fail

.bit_eq:
add cx, 1
jmp .start_bit_cmp

.bit_cmp_fail:
mov al, 0x01
jmp .end_bit_cmp

.bit_cmp_ok:
mov al, 0x00
.end_bit_cmp:

pop cx
pop dx
ret
