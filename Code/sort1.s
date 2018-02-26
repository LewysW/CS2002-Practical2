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
	pushq	%rax
.Ltmp6:
	.cfi_def_cfa_offset 64
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
	movq	%rcx, %r15
	movq	%rdx, %rbx
	movq	%rsi, %r12
	movq	%rdi, %r13
	movq	%r15, %rax
	subq	%rbx, %rax
	cmpq	$2, %rax
	jl	.LBB1_1
	movq	%rax, %rbp
	shrq	$63, %rbp
	addq	%rax, %rbp
	sarq	%rbp
	addq	%rbx, %rbp
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	movq	%rbp, %rcx
	movq	%r14, %r8
	callq	sortsub
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbp, %rdx
	movq	%r15, %rcx
	movq	%r14, %r8
	callq	sortsub
	movq	%r13, %rdi
	movq	%r12, %rsi
	movq	%rbx, %rdx
	movq	%rbp, %rcx
	movq	%r15, %r8
	movq	%r14, %r9
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	merge
.LBB1_1:
	addq	$8, %rsp
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

	.align	16, 0x90
	.type	merge,@function
merge:
	.cfi_startproc
	pushq	%rbp
.Ltmp13:
	.cfi_def_cfa_offset 16
	pushq	%r15
.Ltmp14:
	.cfi_def_cfa_offset 24
	pushq	%r14
.Ltmp15:
	.cfi_def_cfa_offset 32
	pushq	%r13
.Ltmp16:
	.cfi_def_cfa_offset 40
	pushq	%r12
.Ltmp17:
	.cfi_def_cfa_offset 48
	pushq	%rbx
.Ltmp18:
	.cfi_def_cfa_offset 56
	subq	$88, %rsp
.Ltmp19:
	.cfi_def_cfa_offset 144
.Ltmp20:
	.cfi_offset %rbx, -56
.Ltmp21:
	.cfi_offset %r12, -48
.Ltmp22:
	.cfi_offset %r13, -40
.Ltmp23:
	.cfi_offset %r14, -32
.Ltmp24:
	.cfi_offset %r15, -24
.Ltmp25:
	.cfi_offset %rbp, -16
	movq	%r9, 48(%rsp)
	movq	%r8, %r15
	movq	%rcx, %rbx
	movq	%rdx, %rbp
	movq	%rsi, %r14
	movq	%rdi, 32(%rsp)
	movq	%r15, %rdi
	subq	%rbp, %rdi
	imulq	%r14, %rdi
	movq	%rdi, 16(%rsp)
	callq	malloc
	movq	%r15, %rdx
	movq	%rax, 24(%rsp)
	cmpq	%rdx, %rbx
	setl	%al
	xorl	%r12d, %r12d
	cmpq	%rbx, %rbp
	setl	87(%rsp)
	jl	.LBB2_1
	cmpq	%rdx, %rbx
	movq	%rbx, %r13
	movq	%rbx, (%rsp)
	movq	%rbp, 40(%rsp)
	movq	%rbp, 8(%rsp)
	jge	.LBB2_10
	jmp	.LBB2_3
.LBB2_1:
	movq	%rbx, %r13
	movq	%rbx, (%rsp)
	movq	%rbp, 40(%rsp)
	movq	%rbp, 8(%rsp)
.LBB2_3:
	movq	40(%rsp), %rsi
	imulq	%r14, %rsi
	movq	32(%rsp), %rcx
	addq	%rcx, %rsi
	movq	%rsi, 56(%rsp)
	movq	%r14, %rsi
	imulq	%r12, %rsi
	incq	%r12
	addq	24(%rsp), %rsi
	movq	%rsi, 64(%rsp)
	movq	%r14, %rsi
	imulq	%r13, %rsi
	addq	%rcx, %rsi
	movq	%rsi, 72(%rsp)
	xorl	%r15d, %r15d
	.align	16, 0x90
.LBB2_4:
	movq	%rdx, %rbx
	testb	$1, %al
	je	.LBB2_7
	testb	$1, 87(%rsp)
	je	.LBB2_9
	movq	72(%rsp), %rax
	leaq	(%rax,%r15), %rsi
	movq	56(%rsp), %rdi
	callq	*48(%rsp)
	testq	%rax, %rax
	jle	.LBB2_7
.LBB2_9:
	incq	%r13
	movq	64(%rsp), %rax
	leaq	(%rax,%r15), %rdi
	movq	72(%rsp), %rax
	leaq	(%rax,%r15), %rsi
	movq	%r14, %rdx
	callq	memcpy
	movq	%rbx, %rdx
	cmpq	%rdx, %r13
	setl	%al
	movb	87(%rsp), %cl
	orb	%al, %cl
	addq	%r14, %r15
	incq	%r12
	testb	$1, %cl
	jne	.LBB2_4
	jmp	.LBB2_10
	.align	16, 0x90
.LBB2_7:
	movq	40(%rsp), %rbp
	incq	%rbp
	movq	%rbp, 40(%rsp)
	movq	64(%rsp), %rdi
	addq	%r15, %rdi
	movq	56(%rsp), %rsi
	movq	%r14, %rdx
	callq	memcpy
	movq	%rbx, %rdx
	cmpq	%rdx, %r13
	setl	%al
	cmpq	(%rsp), %rbp
	setl	87(%rsp)
	jl	.LBB2_3
	cmpq	%rdx, %r13
	jl	.LBB2_3
.LBB2_10:
	movq	8(%rsp), %rax
	imulq	%r14, %rax
	movq	32(%rsp), %rdi
	addq	%rax, %rdi
	movq	24(%rsp), %rbx
	movq	%rbx, %rsi
	movq	16(%rsp), %rdx
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
.Lfunc_end2:
	.size	merge, .Lfunc_end2-merge
	.cfi_endproc


	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
