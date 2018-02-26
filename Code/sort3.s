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
	movq	%r8, %r14
	movq	%rcx, %rax
	movq	%rsi, %r15
	movq	%rax, %rbx
	subq	%rdx, %rbx
	cmpq	$2, %rbx
	jl	.LBB1_14
	movq	%rbx, %rbp
	shrq	$63, %rbp
	addq	%rbx, %rbp
	sarq	%rbp
	addq	%rdx, %rbp
	movq	%rbp, 24(%rsp)
	movq	%rdi, %r12
	movq	%r12, 32(%rsp)
	movq	%r15, %rsi
	movq	%rdx, 16(%rsp)
	movq	%rbp, %rcx
	movq	%rax, %r13
	movq	%r14, %r8
	callq	sortsub
	movq	%r12, %rdi
	movq	%r15, %rsi
	movq	%rbp, %rdx
	movq	%r13, %rcx
	movq	%r14, %r8
	movq	%r14, 64(%rsp)
	callq	sortsub
	imulq	%r15, %rbx
	movq	%r15, %r12
	movq	%rbx, 8(%rsp)
	movq	%rbx, %rdi
	callq	malloc
	movq	%r13, %r15
	movq	%rax, 40(%rsp)
	cmpq	%r15, %rbp
	setl	%al
	movb	$1, %cl
	xorl	%r14d, %r14d
	movq	%rbp, %r13
	movq	16(%rsp), %rdx
	movq	%rdx, 48(%rsp)
.LBB1_2:
	movq	48(%rsp), %rsi
	movq	%r12, %rbx
	imulq	%rbx, %rsi
	movq	32(%rsp), %rdx
	addq	%rdx, %rsi
	movq	%rsi, 72(%rsp)
	testb	$1, %cl
	je	.LBB1_3
	testb	$1, %al
	je	.LBB1_10
	movq	%rbx, %rax
	imulq	%r13, %rax
	addq	%rdx, %rax
	movq	%rax, 80(%rsp)
	movq	%rbx, %rax
	imulq	%r14, %rax
	addq	40(%rsp), %rax
	movq	%rax, 56(%rsp)
	xorl	%ebp, %ebp
	.align	16, 0x90
.LBB1_8:
	movq	80(%rsp), %rax
	leaq	(%rax,%rbp), %r12
	movq	72(%rsp), %rdi
	movq	%r12, %rsi
	callq	*64(%rsp)
	testq	%rax, %rax
	jle	.LBB1_10
	incq	%r14
	incq	%r13
	movq	56(%rsp), %rax
	leaq	(%rax,%rbp), %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	memcpy
	addq	%rbx, %rbp
	cmpq	%r15, %r13
	jl	.LBB1_8
	jmp	.LBB1_10
	.align	16, 0x90
.LBB1_3:
	movq	%rbx, %r12
	movq	%r12, %rcx
	imulq	%r14, %rcx
	addq	40(%rsp), %rcx
	movq	%rcx, 80(%rsp)
	movq	%r12, %rbp
	imulq	%r13, %rbp
	addq	%rdx, %rbp
	xorl	%ebx, %ebx
	.align	16, 0x90
.LBB1_4:
	testb	$1, %al
	je	.LBB1_5
	incq	%r14
	incq	%r13
	movq	80(%rsp), %rax
	leaq	(%rax,%rbx), %rdi
	leaq	(%rbp,%rbx), %rsi
	movq	%r12, %rdx
	callq	memcpy
	addq	%r12, %rbx
	movb	$1, %al
	cmpq	%r15, %r13
	jl	.LBB1_4
	jmp	.LBB1_13
	.align	16, 0x90
.LBB1_5:
	movq	%r12, %rbx
.LBB1_10:
	movq	%r14, %rdi
	leaq	1(%rdi), %r14
	imulq	%rbx, %rdi
	addq	40(%rsp), %rdi
	movq	48(%rsp), %rbp
	incq	%rbp
	movq	%rbp, 48(%rsp)
	movq	72(%rsp), %rsi
	movq	%rbx, %rdx
	movq	%rbx, %r12
	callq	memcpy
	cmpq	%r15, %r13
	setl	%al
	cmpq	24(%rsp), %rbp
	setl	%cl
	jl	.LBB1_2
	cmpq	%r15, %r13
	jl	.LBB1_2
.LBB1_13:
	movq	16(%rsp), %rax
	imulq	%r12, %rax
	movq	32(%rsp), %rdi
	addq	%rax, %rdi
	movq	40(%rsp), %rbx
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
.LBB1_14:
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
