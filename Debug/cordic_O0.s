	.file	"cordic.c"
	.intel_syntax noprefix
	.text
	.globl	GRF
	.def	GRF;	.scl	2;	.type	32;	.endef
	.seh_proc	GRF
GRF:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 120
	.seh_stackalloc	120
	lea	rbp, 64[rsp]
	.seh_setframe	rbp, 64
	movups	XMMWORD PTR 0[rbp], xmm6
	.seh_savexmm	xmm6, 64
	movups	XMMWORD PTR 16[rbp], xmm7
	.seh_savexmm	xmm7, 80
	movups	XMMWORD PTR 32[rbp], xmm8
	.seh_savexmm	xmm8, 96
	.seh_endprologue
	mov	QWORD PTR 80[rbp], rcx
	mov	rbx, rdx
	mov	rax, QWORD PTR [rbx]
	mov	rdx, QWORD PTR 8[rbx]
	mov	QWORD PTR -32[rbp], rax
	mov	QWORD PTR -24[rbp], rdx
	movsd	QWORD PTR 96[rbp], xmm2
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	mov	rax, QWORD PTR 96[rbp]
	movq	xmm0, rax
	call	cos
	movapd	xmm6, xmm0
	movsd	xmm7, QWORD PTR -32[rbp]
	movsd	xmm8, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 96[rbp]
	movq	xmm0, rax
	call	tan
	movapd	xmm1, xmm8
	mulsd	xmm1, xmm0
	subsd	xmm7, xmm1
	movapd	xmm0, xmm7
	mulsd	xmm0, xmm6
	movsd	QWORD PTR -8[rbp], xmm0
	mov	rax, QWORD PTR 96[rbp]
	movq	xmm0, rax
	call	cos
	movapd	xmm6, xmm0
	movsd	xmm7, QWORD PTR -24[rbp]
	movsd	xmm8, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 96[rbp]
	movq	xmm0, rax
	call	tan
	mulsd	xmm0, xmm8
	addsd	xmm0, xmm7
	mulsd	xmm0, xmm6
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR -8[rbp]
	movsd	QWORD PTR -32[rbp], xmm0
	mov	rcx, QWORD PTR 80[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR 80[rbp]
	movups	xmm6, XMMWORD PTR 0[rbp]
	movups	xmm7, XMMWORD PTR 16[rbp]
	movups	xmm8, XMMWORD PTR 32[rbp]
	add	rsp, 120
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	lf2fp
	.def	lf2fp;	.scl	2;	.type	32;	.endef
	.seh_proc	lf2fp
lf2fp:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 24
	.seh_stackalloc	24
	lea	rbp, 16[rsp]
	.seh_setframe	rbp, 16
	.seh_endprologue
	movsd	QWORD PTR 32[rbp], xmm0
	mov	DWORD PTR -4[rbp], 0
	lea	rax, 32[rbp]
	mov	rax, QWORD PTR [rax]
	sar	rax, 52
	and	eax, 2047
	sub	eax, 1023
	mov	ebx, eax
	test	ebx, ebx
	js	.L4
	lea	rax, 32[rbp]
	mov	rax, QWORD PTR [rax]
	movabs	rdx, 4503599627370495
	and	rdx, rax
	movabs	rax, 4503599627370496
	or	rax, rdx
	mov	ecx, ebx
	sal	rax, cl
	sal	eax, 8
	sar	eax, 8
	sal	eax, 8
	mov	edx, eax
	mov	eax, DWORD PTR -4[rbp]
	movzx	eax, al
	or	eax, edx
	mov	DWORD PTR -4[rbp], eax
	jmp	.L5
.L4:
	lea	rax, 32[rbp]
	mov	rax, QWORD PTR [rax]
	movabs	rdx, 4503599627370495
	and	rdx, rax
	movabs	rax, 4503599627370496
	or	rdx, rax
	mov	eax, ebx
	neg	eax
	mov	ecx, eax
	sar	rdx, cl
	mov	rax, rdx
	sal	eax, 8
	sar	eax, 8
	sal	eax, 8
	mov	edx, eax
	mov	eax, DWORD PTR -4[rbp]
	movzx	eax, al
	or	eax, edx
	mov	DWORD PTR -4[rbp], eax
.L5:
	nop
	add	rsp, 24
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	K
	.data
	.align 8
K:
	.long	-1256890314
	.long	1071869597
	.globl	_angles
	.align 32
_angles:
	.long	1413777120
	.long	1072243195
	.long	90276502
	.long	1071492199
	.long	-115491822
	.long	1070553973
	.long	-1703361215
	.long	1069536698
	.long	-1221205575
	.long	1068496219
	.long	-1155246312
	.long	1067449685
	.long	1527207137
	.long	1066401621
	.long	1484366646
	.long	1065353173
	.long	1358364373
	.long	1064304629
	.long	1355686842
	.long	1063256061
	.long	1527955685
	.long	1062207487
	.long	-922337204
	.long	1061158911
	.long	-922337204
	.long	1060110335
	.long	-922337204
	.long	1059061759
	.long	-1066787083
	.long	1058013184
	.long	-1066787083
	.long	1056964608
	.section .rdata,"dr"
.LC3:
	.ascii "[%2d] deg: %.2lf   %lf   %lf\12\0"
	.text
	.globl	CORDIC
	.def	CORDIC;	.scl	2;	.type	32;	.endef
	.seh_proc	CORDIC
CORDIC:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 136
	.seh_stackalloc	136
	lea	rbp, 96[rsp]
	.seh_setframe	rbp, 96
	movups	XMMWORD PTR 0[rbp], xmm6
	.seh_savexmm	xmm6, 96
	movups	XMMWORD PTR 16[rbp], xmm7
	.seh_savexmm	xmm7, 112
	.seh_endprologue
	mov	QWORD PTR 64[rbp], rcx
	mov	rbx, rdx
	mov	rax, QWORD PTR [rbx]
	mov	rdx, QWORD PTR 8[rbx]
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -40[rbp], rdx
	movsd	QWORD PTR 80[rbp], xmm2
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -12[rbp], 0
	mov	QWORD PTR -32[rbp], 0
	mov	QWORD PTR -24[rbp], 0
	mov	DWORD PTR -16[rbp], 0
	jmp	.L7
.L12:
	movsd	xmm0, QWORD PTR 80[rbp]
	comisd	xmm0, QWORD PTR -8[rbp]
	jb	.L15
	movsd	xmm6, QWORD PTR -48[rbp]
	movsd	xmm7, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR -16[rbp]
	neg	eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR .LC1[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow
	mulsd	xmm7, xmm0
	movapd	xmm1, xmm7
	subsd	xmm6, xmm1
	movapd	xmm0, xmm6
	movsd	QWORD PTR -32[rbp], xmm0
	movsd	xmm6, QWORD PTR -40[rbp]
	movsd	xmm7, QWORD PTR -48[rbp]
	mov	eax, DWORD PTR -16[rbp]
	neg	eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR .LC1[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow
	mulsd	xmm0, xmm7
	addsd	xmm0, xmm6
	movsd	QWORD PTR -24[rbp], xmm0
	mov	eax, DWORD PTR -16[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, _angles[rip]
	movsd	xmm0, QWORD PTR [rdx+rax]
	movsd	xmm1, QWORD PTR -8[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	jmp	.L10
.L15:
	movsd	xmm6, QWORD PTR -48[rbp]
	movsd	xmm7, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR -16[rbp]
	neg	eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR .LC1[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow
	mulsd	xmm0, xmm7
	addsd	xmm0, xmm6
	movsd	QWORD PTR -32[rbp], xmm0
	movsd	xmm6, QWORD PTR -40[rbp]
	movsd	xmm7, QWORD PTR -48[rbp]
	mov	eax, DWORD PTR -16[rbp]
	neg	eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR .LC1[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow
	mulsd	xmm7, xmm0
	movapd	xmm1, xmm7
	subsd	xmm6, xmm1
	movapd	xmm0, xmm6
	movsd	QWORD PTR -24[rbp], xmm0
	mov	eax, DWORD PTR -16[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, _angles[rip]
	movsd	xmm1, QWORD PTR [rdx+rax]
	movsd	xmm0, QWORD PTR -8[rbp]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
.L10:
	movsd	xmm0, QWORD PTR -32[rbp]
	movsd	QWORD PTR -48[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	xmm0, QWORD PTR -40[rbp]
	movsd	xmm3, QWORD PTR -48[rbp]
	movsd	xmm2, QWORD PTR -8[rbp]
	movsd	xmm1, QWORD PTR .LC2[rip]
	mulsd	xmm1, xmm2
	movapd	xmm2, xmm3
	movq	rcx, xmm3
	movapd	xmm3, xmm1
	movapd	xmm1, xmm3
	movq	rdx, xmm3
	mov	eax, DWORD PTR -16[rbp]
	movsd	QWORD PTR 32[rsp], xmm0
	movapd	xmm3, xmm2
	mov	r9, rcx
	movapd	xmm2, xmm1
	mov	r8, rdx
	mov	edx, eax
	lea	rax, .LC3[rip]
	mov	rcx, rax
	call	printf
	cmp	DWORD PTR -12[rbp], 0
	jle	.L11
	add	DWORD PTR -16[rbp], 1
	mov	DWORD PTR -12[rbp], 0
	jmp	.L7
.L11:
	add	DWORD PTR -12[rbp], 1
.L7:
	cmp	DWORD PTR -16[rbp], 15
	jle	.L12
	mov	rax, QWORD PTR K[rip]
	movsd	xmm0, QWORD PTR .LC1[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow
	movsd	xmm1, QWORD PTR -48[rbp]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -48[rbp], xmm0
	mov	rax, QWORD PTR K[rip]
	movsd	xmm0, QWORD PTR .LC1[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow
	movsd	xmm1, QWORD PTR -40[rbp]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0
	mov	rcx, QWORD PTR 64[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR [rcx], rax
	mov	QWORD PTR 8[rcx], rdx
	mov	rax, QWORD PTR 64[rbp]
	movups	xmm6, XMMWORD PTR 0[rbp]
	movups	xmm7, XMMWORD PTR 16[rbp]
	add	rsp, 136
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC6:
	.ascii "%d  0x%x\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	call	__main
	movsd	xmm0, QWORD PTR .LC4[rip]
	movsd	QWORD PTR -32[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -24[rbp], xmm0
	lea	rcx, -48[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR -96[rbp], rax
	mov	QWORD PTR -88[rbp], rdx
	movsd	xmm0, QWORD PTR .LC5[rip]
	lea	rax, -96[rbp]
	movapd	xmm2, xmm0
	mov	rdx, rax
	call	GRF
	lea	rcx, -64[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	QWORD PTR -96[rbp], rax
	mov	QWORD PTR -88[rbp], rdx
	movsd	xmm0, QWORD PTR .LC5[rip]
	lea	rax, -96[rbp]
	movapd	xmm2, xmm0
	mov	rdx, rax
	call	CORDIC
	movsd	xmm0, QWORD PTR .LC4[rip]
	movsd	QWORD PTR -72[rbp], xmm0
	lea	rax, -72[rbp]
	mov	rax, QWORD PTR [rax]
	sar	rax, 52
	and	eax, 2047
	sub	eax, 1023
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	mov	edx, 15
	mov	ecx, eax
	sar	edx, cl
	mov	eax, edx
	mov	DWORD PTR -8[rbp], eax
	mov	edx, DWORD PTR -8[rbp]
	mov	eax, DWORD PTR -4[rbp]
	mov	r8d, edx
	mov	edx, eax
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	mov	eax, 0
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC2:
	.long	442745336
	.long	1078765020
	.align 8
.LC4:
	.long	0
	.long	1072693248
	.align 8
.LC5:
	.long	-498103822
	.long	1074614863
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev1, Built by MSYS2 project) 14.2.0"
	.def	cos;	.scl	2;	.type	32;	.endef
	.def	tan;	.scl	2;	.type	32;	.endef
	.def	pow;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
