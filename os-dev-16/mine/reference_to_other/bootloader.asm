%define loc 0x1000
%define ftable 0x2000
%define drive 0x80
%define os_sect 3
%define ftabsect 2
[bits 16]
[org 0]

jmp 0x7c0:start

start:
	mov ax, cs
	mov es, ax
	mov ds, ax

	mov al, 0x03
	mov ah, 0
	int 0x10
	
	mov si, msg
	call print

	mov ah, 0
	int 0x16	;read a char

	;read disk int 0x13
	;ah - 0x02, read sector function
	;al - number of sectors (how many numbers pepared to read)
	;ch - bottom 8 bits of track number (0-based)
	;cl - ttssssss
	;	tt = top two bits of 10-bit track number
	;	ssssss = 6-bit sector number (1-based)
	;dh - head number (0-based)
	;dl - drive number
	;es:bx - address of user buffer
	;-----------------------------------------------
	;es 0x1000	THREE PARAMETERS
	;cl 3
	;al 2
	;-------------------
	;bx 0		THE OTHERS IS FIXED
	;dl 0x80 - this disk
	;dh 0
	;ch 0
	;ah 2
	;read 0x80 disk, from {head 0, track 0, sector 3}, 2 sectors, to 0x1000:0 -- os, why 2 sectors?

	mov ax, loc	
	mov es, ax	;??why not "mov es, loc"
	mov cl, os_sect
	mov al, 2
	call loadsector

	;read the second sector to 0x2000:0
	mov ax, ftable
	mov es, ax
	mov cl, ftabsect
	mov al, 1
	call loadsector	

	jmp loc:0000

done:
	jmp $

loadsector:
	mov bx, 0
	mov dl, drive
	mov dh, 0
	mov ch, 0
	mov ah, 2
	int 0x13
	jc err
	ret

err:
	mov si, erro
	call print
	ret

print:
;	mov bp, sp
	cout:
	lodsb
	or al, al
	jz dne
	mov ah, 0x0e
	int 0x10
;	mov bx, 0
	jmp cout

	dne:
;	mov sp, bp
	ret

	
msg db "Booting Successful..",10,13,"Press any key to continue !",10,13,10,13,0
erro db "Error loading sector ",10,13,0

times 510-($-$$) db 0
dw 0xaa55
