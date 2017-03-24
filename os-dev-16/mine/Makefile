ASMFLAG = -f bin

all:boot

boot:boot.asm
	nasm ${ASMFLAG} boot.asm

run:boot
	qemu-system-i386 boot >/dev/null 2>&1 &

clean:
	rm -rf boot
