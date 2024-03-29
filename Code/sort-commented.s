	.text
	.file	"sort.c"
	.globl	mergesort
	.p2align	4, 0x90
	.type	mergesort,@function
mergesort:
	.cfi_startproc
	pushq	%rbp
.Lcfi0:
	.cfi_def_cfa_offset 16
.Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi2:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	xorl	%eax, %eax
	movl	%eax, %r8d
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	%rdx, -40(%rbp)
	movq	%r8, %rdx
	movq	-40(%rbp), %r8
	callq	sortsub
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	mergesort, .Lfunc_end0-mergesort
	.cfi_endproc

	.p2align	4, 0x90
	.type	sortsub,@function
sortsub:
	.cfi_startproc
	pushq	%rbp # Pushes address of base pointer to call stack to allow program to return to the mergesort function.
.Lcfi3:
	.cfi_def_cfa_offset 16
.Lcfi4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp # Sets new base pointer of new stack frame (corresponding to sortsub function) by
					   # copying the value of the stack pointer into the base pointer
.Lcfi5:
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp # Stack pointer is decremented by 64 to allocate 64 bytes for local variable use
				      # and the stack frames of the functions called within subsort
  # Below are local variable values retrieved from parameters in sort sub
	movq	%rdi, -8(%rbp) # copies value of void* arr parameter stored in rdi to the address offset by 8 bytes from base pointer
	movq	%rsi, -16(%rbp) # copies value of long size parameter stored in rsi to the address offset by 16 bytes from the base pointer
	movq	%rdx, -24(%rbp) # copies value of long left parameter stored in rdx to the address offset by 24 bytes from the base pointer
	movq	%rcx, -32(%rbp) # copies value of long right parameter stored in rcx to the address offset by 32 bytes from the base pointer
	movq	%r8, -40(%rbp) # copies value of long (*comp) parameter stored in r8 to the address offset by 40 bytes from the base pointer
	movq	-32(%rbp), %rcx # copies the value of the right variable into rcx
	subq	-24(%rbp), %rcx # Subtracts the value of the variable left from the variable right (the value in rcx) in the conditional statement
	cmpq	$1, %rcx # Compares the value of 1 and the value of rcx (the result of subtracting left from right)
	jle	.LBB1_2
	movl	$2, %eax # copies the value 2 into the register eax (this is the value the mid expression is divied by in sortsub)
	movl	%eax, %ecx # copies the value of register eax (2) into the register ecx.
	movq	-24(%rbp), %rdx # copies the value of the Left variable into register rdx
	movq	-32(%rbp), %rsi # copies the value of the right variable into register rsi
	subq	-24(%rbp), %rsi # Subtracts the value of the left variable from the value of the right variable during assignment of mid variable
	movq	%rsi, %rax # copies the result of right - left  into the register rax
	movq	%rdx, -56(%rbp) # copies the value of left stored in rdx to the address offset 56 bytes from the base pointer
	cqto # Sign extends the two register values edx:eax (64 bit integer) to be used in a division to allow for extra precision
	idivq	%rcx # Divides the value of rcx (the result of right - left) by edx:eax which is 2 due to earlier assignment.
						 # Corresponds to dvision during assignment of mid
	movq	-56(%rbp), %rcx # copies the value of left into register rcx
	addq	%rax, %rcx # Adds values of left and result of (right - left) / 2 during assignment of mid
	movq	%rcx, -48(%rbp) # copies value of mid (result of left + (right - left) / 2) into address offset by 48 bytes from rbp
	# Parameters for first sortsub call:
	movq	-8(%rbp), %rdi # copies value of arr variable into register rdi in preperation for sortsub call
	movq	-16(%rbp), %rsi # copies value of size variable into register rsi in preperation for sortsub call
	movq	-24(%rbp), %rax # copies value of left variable into register rax in preperation for sortsub call
	movq	-48(%rbp), %rcx # copies value of mid variable into register rcx in preperation for sortsub call
	movq	-40(%rbp), %r8 # copies value of comp variable into register r8 in preperation for sortsub call
	movq	%rax, %rdx # Replaces the value of left in rdx with the value of left from rax
	callq	sortsub # Calls the sortsub function
	# Parameters for second sortsub call:
	movq	-8(%rbp), %rdi # copies value of arr variable into register rdi in preperation for sortsub call
	movq	-16(%rbp), %rsi # copies value of size variable into register rsi in preperation for sortsub call
	movq	-48(%rbp), %rdx # copies value of mid variable into register rdx in preperation for sortsub call
	movq	-32(%rbp), %rcx # copies value of right variable into register rcx in preperation for sortsub call
	movq	-40(%rbp), %r8 # copies value of comp variable into register r8 in preperation for sortsub call
	callq	sortsub # Calls the sortsub function
	# Parameters for merge call:
	movq	-8(%rbp), %rdi # copies value of arr variable into register rdi in preperation for sortsub call
	movq	-16(%rbp), %rsi # copies value of size variable into register rsi in preperation for sortsub call
	movq	-24(%rbp), %rdx # copies value of left variable into register rdx in preperation for sortsub call
	movq	-48(%rbp), %rcx # copies value of mid variable into register rcx in preperation for sortsub call
	movq	-32(%rbp), %r8 # copies the value of right variable into register r8
	movq	-40(%rbp), %r9 # copies the value of the comp variable into register r9
	callq	merge # Calls the merge function
.LBB1_2:
	addq	$64, %rsp # Stack pointer is incremented by 64 to deallocate the 64 bytes used by the sortsub stackframe
	popq	%rbp # pops the return address of the mergesort function off of the call stack to rbp to return
	retq # returns to parent function mergesort
.Lfunc_end1:
	.size	sortsub, .Lfunc_end1-sortsub
	.cfi_endproc

	.p2align	4, 0x90
	.type	merge,@function
merge:
	.cfi_startproc
	pushq	%rbp
.Lcfi6:
	.cfi_def_cfa_offset 16
.Lcfi7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi8:
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movq	-40(%rbp), %rcx
	subq	-24(%rbp), %rcx
	movq	%rcx, -56(%rbp)
	movq	-56(%rbp), %rcx
	imulq	-16(%rbp), %rcx
	movq	%rcx, %rdi
	callq	malloc
	movq	%rax, -64(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	$0, -88(%rbp)
.LBB2_1:
	movb	$1, %al
	movq	-72(%rbp), %rcx
	cmpq	-32(%rbp), %rcx
	movb	%al, -89(%rbp)
	jl	.LBB2_3
	movq	-80(%rbp), %rax
	cmpq	-40(%rbp), %rax
	setl	%cl
	movb	%cl, -89(%rbp)
.LBB2_3:
	movb	-89(%rbp), %al
	testb	$1, %al
	jne	.LBB2_4
	jmp	.LBB2_10
.LBB2_4:
	movq	-80(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jge	.LBB2_7
	movq	-72(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jge	.LBB2_8
	movq	-48(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rdx
	imulq	-72(%rbp), %rdx
	addq	%rdx, %rcx
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rsi
	imulq	-80(%rbp), %rsi
	addq	%rsi, %rdx
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	callq	*%rax
	cmpq	$0, %rax
	jg	.LBB2_8
.LBB2_7:
	movq	-64(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, -88(%rbp)
	imulq	%rdx, %rcx
	addq	%rcx, %rax
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	%rsi, %rdi
	addq	$1, %rdi
	movq	%rdi, -72(%rbp)
	imulq	%rsi, %rdx
	addq	%rdx, %rcx
	movq	-16(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	memcpy
	jmp	.LBB2_9
.LBB2_8:
	movq	-64(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, -88(%rbp)
	imulq	%rdx, %rcx
	addq	%rcx, %rax
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-80(%rbp), %rsi
	movq	%rsi, %rdi
	addq	$1, %rdi
	movq	%rdi, -80(%rbp)
	imulq	%rsi, %rdx
	addq	%rdx, %rcx
	movq	-16(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	memcpy
.LBB2_9:
	jmp	.LBB2_1
.LBB2_10:
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	imulq	-24(%rbp), %rcx
	addq	%rcx, %rax
	movq	-64(%rbp), %rsi
	movq	-56(%rbp), %rcx
	imulq	-16(%rbp), %rcx
	movq	%rax, %rdi
	movq	%rcx, %rdx
	callq	memcpy
	movq	-64(%rbp), %rdi
	callq	free
	addq	$96, %rsp
	popq	%rbp
	retq
.Lfunc_end2:
	.size	merge, .Lfunc_end2-merge
	.cfi_endproc


	.ident	"clang version 5.0.1 (tags/RELEASE_501/final)"
	.section	".note.GNU-stack","",@progbits
