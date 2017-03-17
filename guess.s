	.file	"guess.c"
	.globl	n
	.data
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.long	2
	.globl	a
	.type	a, @object
	.size	a, 6
a:
	.ascii	"0x0000"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	n(%rip), %eax
	cltq
	movb	$97, a(%rax)
	movl	n(%rip), %eax
	addl	$1, %eax
	movl	%eax, n(%rip)
	movl	n(%rip), %eax
	cltq
	movb	$98, a(%rax)
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 6.3.1 20161221 (Red Hat 6.3.1-1)"
	.section	.note.GNU-stack,"",@progbits
