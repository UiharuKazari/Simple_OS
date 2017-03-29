ASMFLAG = -f bin

all:boot

boot:boot.asm print_string.asm endline.asm print_hex16.asm read_string.asm print_hex8.asm echo_function.asm show_reg.asm
	nasm ${ASMFLAG} boot.asm

run:boot
	qemu-system-i386 boot >/dev/null 2>&1 &

clean:
	rm -rf boot
