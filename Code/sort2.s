	.text
	.file	"sort.c"
	.globl	mergesort
	.align	16, 0x90
	.type	mergesort,@function
mergesort:
	.cfi_startproc
	movq	%rcx, %rax
	movq	%rdx, %rcx
	xorl	%edx, %edx
	movq	%rax, %r8
	jmp	sortsub
.Lfunc_end0:
	.size	mergesort, .Lfunc_end0-mergesort
	.cfi_endproc

	.align	16, 0x90
	.type	sortsub,@function
sortsub:
	.cfi_startproc
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp2:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp4:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp5:
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
.Ltmp6:
	.cfi_def_cfa_offset 144
.Ltmp7:
	.cfi_offset %rbx, -56
.Ltmp8:
	.cfi_offset %r12, -48
.Ltmp9:
	.cfi_offset %r13, -40
.Ltmp10:
	.cfi_offset %r14, -32
.Ltmp11:
	.cfi_offset %r15, -24
.Ltmp12:
	.cfi_offset %rbp, -16
	movq	%rdx, %r14
	movq	%rcx, %rbx
	subq	%r14, %rbx
	cmpq	$2, %rbx
	jl	.LBB1_10
	movq	%rbx, %r12
	shrq	$63, %r12
	addq	%rbx, %r12
	sarq	%r12
	addq	%r14, %r12
	movq	%r12, 16(%rsp)
	movq	%rdi, %rbp
	movq	%rsi, %r13
	movq	%r14, %rdx
	movq	%rcx, 80(%rsp)
	movq	%r12, %rcx
	movq	%r8, %r15
	callq	sortsub
	movq	%rbp, %rdi
	movq	%rbp, 24(%rsp)
	movq	%r13, %rsi
	movq	%r12, %rdx
	movq	80(%rsp), %rcx
	movq	%r15, %r8
	movq	%r15, 48(%rsp)
	callq	sortsub
	imulq	%r13, %rbx
	movq	%r13, %rbp
	movq	%rbx, 8(%rsp)
	movq	%rbx, %rdi
	callq	malloc
	movq	%rax, 32(%rsp)
	cmpq	80(%rsp), %r12
	setl	%al
	movb	$1, %r15b
	movq	%r12, %r13
	movq	%r14, 40(%rsp)
	movq	%r14, (%rsp)
	xorl	%r14d, %r14d
.LBB1_2:
	movq	40(%rsp), %rdx
	imulq	%rbp, %rdx
	movq	24(%rsp), %rcx
	addq	%rcx, %rdx
	movq	%rdx, 56(%rsp)
	movq	%rbp, %rdx
	imulq	%r14, %rdx
	addq	32(%rsp), %rdx
	movq	%rdx, 64(%rsp)
	movq	%rbp, %rdx
	imulq	%r13, %rdx
	addq	%rcx, %rdx
	movq	%rdx, 72(%rsp)
	xorl	%ebx, %ebx
	movq	%r14, %r12
	.align	16, 0x90
.LBB1_3:
	testb	$1, %al
	je	.LBB1_6
	movq	72(%rsp), %rax
	leaq	(%rax,%rbx), %r14
	testb	$1, %r15b
	je	.LBB1_8
	movq	56(%rsp), %rdi
	movq	%r14, %rsi
	callq	*48(%rsp)
	testq	%rax, %rax
	jle	.LBB1_6
.LBB1_8:
	incq	%r12
	incq	%r13
	movq	64(%rsp), %rax
	leaq	(%rax,%rbx), %rdi
	movq	%r14, %rsi
	movq	%rbp, %rdx
	callq	memcpy
	cmpq	80(%rsp), %r13
	setl	%al
	movb	%r15b, %cl
	orb	%al, %cl
	addq	%rbp, %rbx
	testb	$1, %cl
	jne	.LBB1_3
	jmp	.LBB1_9
	.align	16, 0x90
.LBB1_6:
	leaq	1(%r12), %r14
	imulq	%rbp, %r12
	addq	32(%rsp), %r12
	movq	40(%rsp), %rbx
	incq	%rbx
	movq	%rbx, 40(%rsp)
	movq	%r12, %rdi
	movq	56(%rsp), %rsi
	movq	%rbp, %rdx
	callq	memcpy
	cmpq	80(%rsp), %r13
	setl	%al
	cmpq	16(%rsp), %rbx
	setl	%r15b
	jl	.LBB1_2
	cmpq	80(%rsp), %r13
	jl	.LBB1_2
.LBB1_9:
	movq	(%rsp), %rax
	imulq	%rbp, %rax
	movq	24(%rsp), %rdi
	addq	%rax, %rdi
	movq	32(%rsp), %rbx
	movq	%rbx, %rsi
	movq	8(%rsp), %rdx
	callq	memcpy
	movq	%rbx, %rdi
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	free
.LBB1_10:
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end1:
	.size	sortsub, .Lfunc_end1-sortsub
	.cfi_endproc


	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
