	.file	"OOP_test.c"
	.intel_syntax noprefix
	.text
	.globl	__globalLastClock
	.bss
	.align 4
__globalLastClock:
	.space 4
	.globl	_startclock
	.align 4
_startclock:
	.space 4
	.globl	__globalTestTime
	.align 8
__globalTestTime:
	.space 8
	.globl	__globalTestTimeptr
	.data
	.align 8
__globalTestTimeptr:
	.quad	__globalTestTime
	.text
	.globl	_clockElapsed
	.def	_clockElapsed;	.scl	2;	.type	32;	.endef
	.seh_proc	_clockElapsed
_clockElapsed:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 40
	.seh_stackalloc	40
	lea	rbp, 32[rsp]
	.seh_setframe	rbp, 32
	.seh_endprologue
	mov	ebx, DWORD PTR __globalLastClock[rip]
	call	clock
	mov	DWORD PTR __globalLastClock[rip], eax
	mov	eax, DWORD PTR __globalLastClock[rip]
	sub	eax, ebx
	add	rsp, 40
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	clockUpdateElapsed
	.def	clockUpdateElapsed;	.scl	2;	.type	32;	.endef
	.seh_proc	clockUpdateElapsed
clockUpdateElapsed:
	push	rbp
	.seh_pushreg	rbp
	push	rsi
	.seh_pushreg	rsi
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 32
	.seh_stackalloc	32
	lea	rbp, 32[rsp]
	.seh_setframe	rbp, 32
	.seh_endprologue
	mov	rbx, rcx
	mov	esi, DWORD PTR [rbx]
	call	clock
	mov	DWORD PTR [rbx], eax
	mov	eax, DWORD PTR [rbx]
	sub	eax, esi
	add	rsp, 32
	pop	rbx
	pop	rsi
	pop	rbp
	ret
	.seh_endproc
	.globl	timeptr
	.def	timeptr;	.scl	2;	.type	32;	.endef
	.seh_proc	timeptr
timeptr:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	rax, QWORD PTR __globalTestTimeptr[rip]
	mov	rcx, rax
	call	_time64
	mov	rax, QWORD PTR __globalTestTimeptr[rip]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	__clrline__
	.section .rdata,"dr"
.LC0:
	.ascii "\15\33[K\0"
	.data
	.align 8
__clrline__:
	.quad	.LC0
	.text
	.globl	aa
	.def	aa;	.scl	2;	.type	32;	.endef
	.seh_proc	aa
aa:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	nop
	pop	rbp
	ret
	.seh_endproc
	.globl	memreset
	.def	memreset;	.scl	2;	.type	32;	.endef
	.seh_proc	memreset
memreset:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	lea	rbp, [rsp]
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	rax, rcx
	mov	rbx, rax
	movsx	rax, edx
	add	rax, rbx
	jmp	.L9
.L10:
	mov	BYTE PTR [rbx], 0
	add	rbx, 1
.L9:
	cmp	rax, rbx
	jne	.L10
	mov	eax, edx
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	memreset_t
	.def	memreset_t;	.scl	2;	.type	32;	.endef
	.seh_proc	memreset_t
memreset_t:
	push	rbp
	.seh_pushreg	rbp
	push	rsi
	.seh_pushreg	rsi
	push	rbx
	.seh_pushreg	rbx
	lea	rbp, [rsp]
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	eax, edx
	movsx	rdx, eax
	mov	rcx, rdx
	and	ecx, 7
	mov	rdx, QWORD PTR 32[rbp]
	lea	rbx, [rcx+rdx]
	mov	rsi, QWORD PTR 32[rbp]
	jmp	.L13
.L14:
	mov	BYTE PTR [rsi], 0
	add	rsi, 1
.L13:
	cmp	rsi, rbx
	jne	.L14
	cdqe
	and	rax, -8
	add	rbx, rax
	mov	rsi, QWORD PTR 32[rbp]
	jmp	.L15
.L16:
	mov	QWORD PTR [rsi], 0
	add	rsi, 8
.L15:
	cmp	rbx, rsi
	jne	.L16
	mov	rax, rbx
	sub	rax, QWORD PTR 32[rbp]
	pop	rbx
	pop	rsi
	pop	rbp
	ret
	.seh_endproc
	.globl	memreset_t2
	.def	memreset_t2;	.scl	2;	.type	32;	.endef
	.seh_proc	memreset_t2
memreset_t2:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 40
	.seh_stackalloc	40
	lea	rbp, 32[rsp]
	.seh_setframe	rbp, 32
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	eax, edx
	mov	rbx, QWORD PTR 32[rbp]
	jmp	.L19
.L20:
	mov	QWORD PTR [rbx], 0
	add	rbx, 8
	sub	eax, 8
.L19:
	mov	edx, eax
	cmp	edx, 7
	ja	.L20
	mov	edx, eax
	mov	rcx, rbx
	call	memreset
	cdqe
	sal	rax, 3
	add	rbx, rax
	mov	rax, rbx
	sub	rax, QWORD PTR 32[rbp]
	add	rsp, 40
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	memreset_t3
	.def	memreset_t3;	.scl	2;	.type	32;	.endef
	.seh_proc	memreset_t3
memreset_t3:
	push	rbp
	.seh_pushreg	rbp
	push	rsi
	.seh_pushreg	rsi
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 32
	.seh_stackalloc	32
	lea	rbp, 32[rsp]
	.seh_setframe	rbp, 32
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	eax, edx
	mov	rbx, QWORD PTR 32[rbp]
	movsx	rdx, eax
	and	rdx, -8
	lea	rsi, [rbx+rdx]
	jmp	.L23
.L24:
	mov	QWORD PTR [rbx], 0
	add	rbx, 8
.L23:
	cmp	rbx, rsi
	jne	.L24
	and	eax, 7
	mov	edx, eax
	mov	rcx, rbx
	call	memreset
	cdqe
	add	rbx, rax
	mov	rax, rbx
	sub	rax, QWORD PTR 32[rbp]
	add	rsp, 32
	pop	rbx
	pop	rsi
	pop	rbp
	ret
	.seh_endproc
	.globl	memcpy_h
	.def	memcpy_h;	.scl	2;	.type	32;	.endef
	.seh_proc	memcpy_h
memcpy_h:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	lea	rbp, [rsp]
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	rax, rcx
	mov	DWORD PTR 40[rbp], r8d
	mov	ecx, DWORD PTR 40[rbp]
	lea	rbx, [rax+rcx]
	jmp	.L27
.L28:
	movzx	ecx, BYTE PTR [rax]
	mov	BYTE PTR [rdx], cl
	add	rax, 1
	add	rdx, 1
.L27:
	cmp	rbx, rax
	jne	.L28
	nop
	nop
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	memcmp_h
	.def	memcmp_h;	.scl	2;	.type	32;	.endef
	.seh_proc	memcmp_h
memcmp_h:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	rax, rcx
	mov	ecx, r8d
	jmp	.L30
.L33:
	movzx	r9d, BYTE PTR [rax]
	movzx	r8d, BYTE PTR [rdx]
	cmp	r9b, r8b
	je	.L31
	mov	eax, 0
	jmp	.L32
.L31:
	add	rax, 1
	add	rdx, 1
	sub	ecx, 1
.L30:
	test	ecx, ecx
	jne	.L33
	mov	eax, 1
.L32:
	pop	rbp
	ret
	.seh_endproc
	.globl	memcmp_hc
	.def	memcmp_hc;	.scl	2;	.type	32;	.endef
	.seh_proc	memcmp_hc
memcmp_hc:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	rax, rcx
	mov	ecx, r8d
	jmp	.L35
.L40:
	movzx	r9d, BYTE PTR [rax]
	movzx	r8d, BYTE PTR [rdx]
	cmp	r9b, r8b
	je	.L36
	movzx	eax, BYTE PTR [rax]
	movzx	edx, BYTE PTR [rdx]
	cmp	dl, al
	jnb	.L37
	mov	eax, 1
	jmp	.L39
.L37:
	mov	eax, -1
	jmp	.L39
.L36:
	add	rax, 1
	add	rdx, 1
	sub	ecx, 1
.L35:
	test	ecx, ecx
	jne	.L40
	mov	eax, 0
.L39:
	pop	rbp
	ret
	.seh_endproc
	.globl	memcmp_hl
	.def	memcmp_hl;	.scl	2;	.type	32;	.endef
	.seh_proc	memcmp_hl
memcmp_hl:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	eax, r8d
	mov	DWORD PTR -4[rbp], eax
	jmp	.L42
.L45:
	movzx	r9d, BYTE PTR [rcx]
	movzx	r8d, BYTE PTR [rdx]
	cmp	r9b, r8b
	jne	.L47
	add	rcx, 1
	add	rdx, 1
	sub	eax, 1
.L42:
	test	eax, eax
	jne	.L45
	jmp	.L44
.L47:
	nop
.L44:
	mov	edx, DWORD PTR -4[rbp]
	sub	edx, eax
	mov	eax, edx
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	memmov
	.def	memmov;	.scl	2;	.type	32;	.endef
	.seh_proc	memmov
memmov:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	rax, rcx
	mov	ecx, r8d
	jmp	.L49
.L50:
	movzx	r8d, BYTE PTR [rax]
	mov	BYTE PTR [rdx], r8b
	mov	BYTE PTR [rax], 0
	add	rax, 1
	add	rdx, 1
	sub	ecx, 1
.L49:
	test	ecx, ecx
	jne	.L50
	nop
	nop
	pop	rbp
	ret
	.seh_endproc
	.globl	debugInfo
	.bss
	.align 32
debugInfo:
	.space 50
	.globl	debugbuf
	.align 32
debugbuf:
	.space 4095
	.section .rdata,"dr"
.LC1:
	.ascii "[INFO] {%s/%s :%d} \0"
.LC2:
	.ascii "[INFO] {%s/%s} \0"
	.text
	.globl	info
	.def	info;	.scl	2;	.type	32;	.endef
	.seh_proc	info
info:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	DWORD PTR 32[rbp], r8d
	cmp	DWORD PTR 32[rbp], 0
	je	.L52
	mov	rdx, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 32[rbp]
	mov	DWORD PTR 40[rsp], eax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR 32[rsp], rax
	mov	r9, rdx
	lea	r8, .LC1[rip]
	mov	edx, 50
	lea	rax, debugInfo[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L53
.L52:
	mov	rdx, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR 32[rsp], rax
	mov	r9, rdx
	lea	r8, .LC2[rip]
	mov	edx, 50
	lea	rax, debugInfo[rip]
	mov	rcx, rax
	call	snprintf
.L53:
	lea	rax, debugInfo[rip]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "[DEBUG] {%s/%s :%d} \0"
.LC4:
	.ascii "[DEBUG] {%s/%s} \0"
	.text
	.globl	debug
	.def	debug;	.scl	2;	.type	32;	.endef
	.seh_proc	debug
debug:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	DWORD PTR 32[rbp], r8d
	cmp	DWORD PTR 32[rbp], 0
	je	.L56
	mov	rdx, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 32[rbp]
	mov	DWORD PTR 40[rsp], eax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR 32[rsp], rax
	mov	r9, rdx
	lea	r8, .LC3[rip]
	mov	edx, 50
	lea	rax, debugInfo[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L57
.L56:
	mov	rdx, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR 32[rsp], rax
	mov	r9, rdx
	lea	r8, .LC4[rip]
	mov	edx, 50
	lea	rax, debugInfo[rip]
	mov	rcx, rax
	call	snprintf
.L57:
	lea	rax, debugInfo[rip]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC5:
	.ascii "[WARNING] {%s/%s :%d} \0"
.LC6:
	.ascii "[WARNING] {%s/%s} \0"
	.text
	.globl	warning
	.def	warning;	.scl	2;	.type	32;	.endef
	.seh_proc	warning
warning:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	DWORD PTR 32[rbp], r8d
	cmp	DWORD PTR 32[rbp], 0
	je	.L60
	mov	rdx, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 32[rbp]
	mov	DWORD PTR 40[rsp], eax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR 32[rsp], rax
	mov	r9, rdx
	lea	r8, .LC5[rip]
	mov	edx, 50
	lea	rax, debugInfo[rip]
	mov	rcx, rax
	call	snprintf
	jmp	.L61
.L60:
	mov	rdx, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR 32[rsp], rax
	mov	r9, rdx
	lea	r8, .LC6[rip]
	mov	edx, 50
	lea	rax, debugInfo[rip]
	mov	rcx, rax
	call	snprintf
.L61:
	lea	rax, debugInfo[rip]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
.lcomm flog,8,8
	.section .rdata,"dr"
.LC7:
	.ascii "ab\0"
.LC8:
	.ascii "lib/Tools/Debug.h\0"
	.align 8
.LC9:
	.ascii "%s error opening/creating log file \"~\\%s\"\12\0"
	.text
	.globl	flog_init
	.def	flog_init;	.scl	2;	.type	32;	.endef
	.seh_proc	flog_init
flog_init:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 40
	.seh_stackalloc	40
	lea	rbp, 32[rsp]
	.seh_setframe	rbp, 32
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	rax, QWORD PTR 32[rbp]
	lea	rdx, .LC7[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR flog[rip], rax
	mov	rax, QWORD PTR flog[rip]
	test	rax, rax
	jne	.L64
	mov	r8d, 89
	lea	rax, __func__.2[rip]
	mov	rdx, rax
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	warning
	mov	rbx, rax
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	mov	rax, QWORD PTR 32[rbp]
	mov	r9, rax
	mov	r8, rbx
	lea	rax, .LC9[rip]
	mov	rdx, rax
	call	fprintf
	mov	eax, 0
	jmp	.L65
.L64:
	mov	rax, QWORD PTR flog[rip]
.L65:
	add	rsp, 40
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "%s Error opening / creating log file \"~/%s\"\12\0"
.LC11:
	.ascii "%s\12\0"
	.text
	.globl	debug_log
	.def	debug_log;	.scl	2;	.type	32;	.endef
	.seh_proc	debug_log
debug_log:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	mov	eax, 4152
	call	___chkstk_ms
	sub	rsp, rax
	.seh_stackalloc	4152
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 4048[rbp], rcx
	mov	QWORD PTR 4056[rbp], rdx
	mov	rax, QWORD PTR 4056[rbp]
	lea	rdx, .LC7[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR 4008[rbp], rax
	cmp	QWORD PTR 4008[rbp], 0
	jne	.L67
	mov	r8d, 103
	lea	rax, __func__.1[rip]
	mov	rdx, rax
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	warning
	mov	rbx, rax
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	mov	rax, QWORD PTR 4056[rbp]
	mov	r9, rax
	mov	r8, rbx
	lea	rax, .LC10[rip]
	mov	rdx, rax
	call	fprintf
	mov	eax, 0
	jmp	.L69
.L67:
	mov	rdx, QWORD PTR 4048[rbp]
	lea	rax, -96[rbp]
	mov	r9, rdx
	lea	r8, .LC11[rip]
	mov	edx, 4095
	mov	rcx, rax
	call	snprintf
	mov	DWORD PTR 4004[rbp], eax
	mov	eax, DWORD PTR 4004[rbp]
	movsx	rdx, eax
	mov	rcx, QWORD PTR 4008[rbp]
	lea	rax, -96[rbp]
	mov	r9, rcx
	mov	r8, rdx
	mov	edx, 1
	mov	rcx, rax
	call	fwrite
	mov	rax, QWORD PTR 4008[rbp]
	mov	rcx, rax
	call	fclose
	mov	eax, 1
.L69:
	add	rsp, 4152
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	memfree
	.def	memfree;	.scl	2;	.type	32;	.endef
	.seh_proc	memfree
memfree:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	test	rax, rax
	je	.L73
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	free
	mov	rax, QWORD PTR 16[rbp]
	mov	QWORD PTR [rax], 0
	jmp	.L70
.L73:
	nop
.L70:
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC12:
	.ascii "lib/mem_ex.h\0"
	.align 8
.LC13:
	.ascii "%s Error Allocating memory [%llu byte%c]\12\0"
	.text
	.globl	memswap_s
	.def	memswap_s;	.scl	2;	.type	32;	.endef
	.seh_proc	memswap_s
memswap_s:
	push	rbp
	.seh_pushreg	rbp
	push	rsi
	.seh_pushreg	rsi
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 48
	.seh_stackalloc	48
	lea	rbp, 48[rsp]
	.seh_setframe	rbp, 48
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	DWORD PTR 40[rbp], edx
	mov	rax, QWORD PTR 32[rbp]
	mov	rax, QWORD PTR [rax]
	test	rax, rax
	je	.L75
	mov	rax, QWORD PTR 32[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	free
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR [rax], 0
.L75:
	mov	eax, DWORD PTR 40[rbp]
	cdqe
	mov	rcx, rax
	call	malloc
	mov	rdx, rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR 32[rbp]
	mov	rax, QWORD PTR [rax]
	test	rax, rax
	jne	.L79
	cmp	DWORD PTR 40[rbp], 1
	jle	.L77
	mov	esi, 115
	jmp	.L78
.L77:
	mov	esi, 0
.L78:
	mov	r8d, 52
	lea	rax, __func__.0[rip]
	mov	rdx, rax
	lea	rax, .LC12[rip]
	mov	rcx, rax
	call	warning
	mov	rbx, rax
	mov	ecx, 2
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	mov	eax, DWORD PTR 40[rbp]
	mov	DWORD PTR 32[rsp], esi
	mov	r9d, eax
	mov	r8, rbx
	lea	rax, .LC13[rip]
	mov	rdx, rax
	call	fprintf
.L79:
	nop
	add	rsp, 48
	pop	rbx
	pop	rsi
	pop	rbp
	ret
	.seh_endproc
	.globl	memswap
	.def	memswap;	.scl	2;	.type	32;	.endef
	.seh_proc	memswap
memswap:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	cmp	QWORD PTR 16[rbp], 0
	je	.L81
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	free
.L81:
	mov	eax, DWORD PTR 24[rbp]
	cdqe
	mov	rcx, rax
	call	malloc
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	__mainOBuf
	.bss
	.align 32
__mainOBuf:
	.space 4096
	.globl	__mainIBuf
	.align 32
__mainIBuf:
	.space 4096
	.globl	__OStream
	.align 32
__OStream:
	.space 256
	.globl	__IStream
	.align 32
__IStream:
	.space 256
	.globl	__curOStream
	.align 4
__curOStream:
	.space 4
	.globl	__curIStream
	.align 4
__curIStream:
	.space 4
	.text
	.globl	_getOStream
	.def	_getOStream;	.scl	2;	.type	32;	.endef
	.seh_proc	_getOStream
_getOStream:
	push	rbp
	.seh_pushreg	rbp
	push	rsi
	.seh_pushreg	rsi
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 32
	.seh_stackalloc	32
	lea	rbp, 32[rsp]
	.seh_setframe	rbp, 32
	.seh_endprologue
	mov	esi, ecx
	mov	eax, DWORD PTR __curOStream[rip]
	mov	eax, eax
	lea	rdx, 0[0+rax*8]
	lea	rax, __OStream[rip]
	lea	rbx, [rdx+rax]
	mov	eax, esi
	mov	edx, eax
	mov	rcx, rbx
	call	memswap_s
	mov	edx, esi
	mov	rax, QWORD PTR [rbx]
	mov	rcx, rax
	call	memswap
	mov	QWORD PTR [rbx], rax
	mov	eax, DWORD PTR __curOStream[rip]
	cmp	eax, 31
	ja	.L84
	mov	eax, DWORD PTR __curOStream[rip]
	add	eax, 1
	mov	DWORD PTR __curOStream[rip], eax
	jmp	.L85
.L84:
	mov	DWORD PTR __curOStream[rip], 0
.L85:
	mov	rax, QWORD PTR [rbx]
	add	rsp, 32
	pop	rbx
	pop	rsi
	pop	rbp
	ret
	.seh_endproc
	.globl	_getIStream
	.def	_getIStream;	.scl	2;	.type	32;	.endef
	.seh_proc	_getIStream
_getIStream:
	push	rbp
	.seh_pushreg	rbp
	push	rsi
	.seh_pushreg	rsi
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 32
	.seh_stackalloc	32
	lea	rbp, 32[rsp]
	.seh_setframe	rbp, 32
	.seh_endprologue
	mov	esi, ecx
	mov	eax, DWORD PTR __curIStream[rip]
	mov	eax, eax
	lea	rdx, 0[0+rax*8]
	lea	rax, __IStream[rip]
	lea	rbx, [rdx+rax]
	mov	eax, esi
	mov	edx, eax
	mov	rcx, rbx
	call	memswap_s
	mov	edx, esi
	mov	rax, QWORD PTR [rbx]
	mov	rcx, rax
	call	memswap
	mov	QWORD PTR [rbx], rax
	mov	eax, DWORD PTR __curIStream[rip]
	cmp	eax, 31
	ja	.L88
	mov	eax, DWORD PTR __curIStream[rip]
	add	eax, 1
	mov	DWORD PTR __curIStream[rip], eax
	jmp	.L89
.L88:
	mov	DWORD PTR __curIStream[rip], 0
.L89:
	mov	rax, QWORD PTR [rbx]
	add	rsp, 32
	pop	rbx
	pop	rsi
	pop	rbp
	ret
	.seh_endproc
	.globl	_printstr
	.def	_printstr;	.scl	2;	.type	32;	.endef
	.seh_proc	_printstr
_printstr:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	lea	rax, 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	mov	DWORD PTR -16[rbp], 0
	jmp	.L92
.L93:
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	fprintf
	add	DWORD PTR -12[rbp], eax
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 8[rax]
	mov	QWORD PTR -24[rbp], rdx
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	add	DWORD PTR -16[rbp], 1
.L92:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L93
	mov	eax, DWORD PTR -12[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	cloneCh
	.def	cloneCh;	.scl	2;	.type	32;	.endef
	.seh_proc	cloneCh
cloneCh:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	rax, rcx
	mov	DWORD PTR 32[rbp], r8d
	mov	ecx, edx
	mov	DWORD PTR -4[rbp], 0
	jmp	.L96
.L97:
	mov	BYTE PTR [rax], cl
	add	DWORD PTR -4[rbp], 1
	add	rax, 1
.L96:
	mov	edx, DWORD PTR -4[rbp]
	cmp	edx, DWORD PTR 32[rbp]
	jl	.L97
	mov	BYTE PTR [rax], 0
	mov	eax, DWORD PTR -4[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	cloneCh_s
	.def	cloneCh_s;	.scl	2;	.type	32;	.endef
	.seh_proc	cloneCh_s
cloneCh_s:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 24
	.seh_stackalloc	24
	lea	rbp, 16[rsp]
	.seh_setframe	rbp, 16
	.seh_endprologue
	mov	rax, rcx
	mov	DWORD PTR 40[rbp], edx
	mov	edx, r8d
	mov	DWORD PTR 56[rbp], r9d
	mov	ecx, edx
	mov	edx, DWORD PTR 40[rbp]
	movsx	rdx, edx
	lea	rbx, [rax+rdx]
	mov	DWORD PTR -4[rbp], 0
	jmp	.L100
.L103:
	cmp	rax, rbx
	jb	.L101
	mov	eax, -1
	jmp	.L102
.L101:
	mov	BYTE PTR [rax], cl
	add	DWORD PTR -4[rbp], 1
	add	rax, 1
.L100:
	mov	edx, DWORD PTR -4[rbp]
	cmp	edx, DWORD PTR 56[rbp]
	jl	.L103
	mov	eax, DWORD PTR -4[rbp]
.L102:
	add	rsp, 24
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC14:
	.ascii "\0"
	.text
	.globl	cloneCh_c
	.def	cloneCh_c;	.scl	2;	.type	32;	.endef
	.seh_proc	cloneCh_c
cloneCh_c:
	push	rbp
	.seh_pushreg	rbp
	push	rsi
	.seh_pushreg	rsi
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 32
	.seh_stackalloc	32
	lea	rbp, 32[rsp]
	.seh_setframe	rbp, 32
	.seh_endprologue
	mov	eax, ecx
	mov	DWORD PTR 40[rbp], edx
	mov	esi, eax
	cmp	DWORD PTR 40[rbp], 4095
	jbe	.L105
	lea	rax, .LC14[rip]
	jmp	.L106
.L105:
	mov	eax, DWORD PTR 40[rbp]
	mov	ecx, eax
	call	_getOStream
	mov	rbx, rax
	mov	edx, DWORD PTR 40[rbp]
	movsx	eax, sil
	mov	r8d, edx
	mov	edx, eax
	mov	rcx, rbx
	call	cloneCh
	mov	rax, rbx
.L106:
	add	rsp, 32
	pop	rbx
	pop	rsi
	pop	rbp
	ret
	.seh_endproc
	.globl	cloneChf
	.def	cloneChf;	.scl	2;	.type	32;	.endef
	.seh_proc	cloneChf
cloneChf:
	push	rbp
	.seh_pushreg	rbp
	push	rsi
	.seh_pushreg	rsi
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 48
	.seh_stackalloc	48
	lea	rbp, 48[rsp]
	.seh_setframe	rbp, 48
	.seh_endprologue
	mov	rbx, rcx
	mov	eax, edx
	mov	DWORD PTR 48[rbp], r8d
	mov	esi, eax
	test	rbx, rbx
	jne	.L108
	mov	eax, -1
	jmp	.L109
.L108:
	mov	DWORD PTR -4[rbp], 0
	mov	eax, DWORD PTR 48[rbp]
	cmp	eax, 4096
	jbe	.L110
	jmp	.L111
.L112:
	movsx	eax, sil
	mov	rdx, rbx
	mov	ecx, eax
	call	putc
	add	DWORD PTR -4[rbp], 1
.L111:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR 48[rbp]
	jl	.L112
	jmp	.L113
.L110:
	movsx	eax, sil
	mov	edx, DWORD PTR 48[rbp]
	mov	r8d, edx
	mov	edx, eax
	lea	rax, __mainOBuf[rip]
	mov	rcx, rax
	call	cloneCh
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR 48[rbp]
	cdqe
	mov	r9, rbx
	mov	r8, rax
	mov	edx, 1
	lea	rax, __mainOBuf[rip]
	mov	rcx, rax
	call	fwrite
.L113:
	mov	eax, DWORD PTR -4[rbp]
.L109:
	add	rsp, 48
	pop	rbx
	pop	rsi
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC15:
	.ascii "barlen: %4d  actual: {%4d | %4d}  highest: %llu\12\0"
	.text
	.globl	horHistogram
	.def	horHistogram;	.scl	2;	.type	32;	.endef
	.seh_proc	horHistogram
horHistogram:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	DWORD PTR 32[rbp], r8d
	mov	QWORD PTR 40[rbp], r9
	mov	QWORD PTR -24[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L115
.L134:
	cmp	DWORD PTR 48[rbp], 10
	ja	.L116
	mov	eax, DWORD PTR 48[rbp]
	lea	rdx, 0[0+rax*4]
	lea	rax, .L118[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L118[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L118:
	.long	.L116-.L118
	.long	.L123-.L118
	.long	.L122-.L118
	.long	.L121-.L118
	.long	.L121-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L119-.L118
	.long	.L119-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.text
.L121:
	mov	rax, QWORD PTR -32[rbp]
	movzx	eax, BYTE PTR [rax]
	movzx	edx, BYTE PTR -24[rbp]
	cmp	dl, al
	jnb	.L124
	mov	rax, QWORD PTR -32[rbp]
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -24[rbp], al
.L124:
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 1
	mov	QWORD PTR -32[rbp], rax
	jmp	.L125
.L120:
	mov	rax, QWORD PTR -32[rbp]
	movzx	eax, WORD PTR [rax]
	movzx	edx, WORD PTR -24[rbp]
	cmp	dx, ax
	jnb	.L126
	mov	rax, QWORD PTR -32[rbp]
	movzx	eax, WORD PTR [rax]
	mov	WORD PTR -24[rbp], ax
.L126:
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 2
	mov	QWORD PTR -32[rbp], rax
	jmp	.L125
.L119:
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR [rax]
	mov	edx, DWORD PTR -24[rbp]
	cmp	edx, eax
	jnb	.L127
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -24[rbp], eax
.L127:
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 4
	mov	QWORD PTR -32[rbp], rax
	jmp	.L125
.L117:
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR -24[rbp]
	cmp	rdx, rax
	jnb	.L128
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
.L128:
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 8
	mov	QWORD PTR -32[rbp], rax
	jmp	.L125
.L123:
	mov	rax, QWORD PTR -32[rbp]
	movss	xmm0, DWORD PTR [rax]
	movss	xmm1, DWORD PTR -24[rbp]
	comiss	xmm0, xmm1
	jbe	.L129
	mov	rax, QWORD PTR -32[rbp]
	movss	xmm0, DWORD PTR [rax]
	movss	DWORD PTR -24[rbp], xmm0
.L129:
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 4
	mov	QWORD PTR -32[rbp], rax
	jmp	.L125
.L122:
	mov	rax, QWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR [rax]
	movsd	xmm1, QWORD PTR -24[rbp]
	comisd	xmm0, xmm1
	jbe	.L131
	mov	rax, QWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR [rax]
	movsd	QWORD PTR -24[rbp], xmm0
.L131:
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 8
	mov	QWORD PTR -32[rbp], rax
	jmp	.L125
.L116:
	mov	eax, -1
	jmp	.L114
.L125:
	add	DWORD PTR -4[rbp], 1
.L115:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR 32[rbp]
	jl	.L134
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	jmp	.L135
.L149:
	cmp	DWORD PTR 48[rbp], 10
	ja	.L152
	mov	eax, DWORD PTR 48[rbp]
	lea	rdx, 0[0+rax*4]
	lea	rax, .L138[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L138[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L138:
	.long	.L152-.L138
	.long	.L143-.L138
	.long	.L142-.L138
	.long	.L141-.L138
	.long	.L141-.L138
	.long	.L140-.L138
	.long	.L140-.L138
	.long	.L139-.L138
	.long	.L139-.L138
	.long	.L152-.L138
	.long	.L152-.L138
	.text
.L141:
	mov	rax, QWORD PTR -32[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -32[rbp], rdx
	movzx	eax, BYTE PTR [rax]
	movzx	eax, al
	imul	rax, QWORD PTR 40[rbp]
	movzx	edx, BYTE PTR -24[rbp]
	movzx	ecx, dl
	mov	edx, 0
	div	rcx
	mov	DWORD PTR -8[rbp], eax
	jmp	.L144
.L140:
	mov	rax, QWORD PTR -32[rbp]
	lea	rdx, 2[rax]
	mov	QWORD PTR -32[rbp], rdx
	movzx	eax, WORD PTR [rax]
	movzx	eax, ax
	imul	rax, QWORD PTR 40[rbp]
	movzx	edx, WORD PTR -24[rbp]
	movzx	ecx, dx
	mov	edx, 0
	div	rcx
	mov	DWORD PTR -8[rbp], eax
	jmp	.L144
.L139:
	mov	rax, QWORD PTR -32[rbp]
	lea	rdx, 4[rax]
	mov	QWORD PTR -32[rbp], rdx
	mov	eax, DWORD PTR [rax]
	mov	eax, eax
	imul	rax, QWORD PTR 40[rbp]
	mov	edx, DWORD PTR -24[rbp]
	mov	ecx, edx
	mov	edx, 0
	div	rcx
	mov	DWORD PTR -8[rbp], eax
	jmp	.L144
.L143:
	mov	rax, QWORD PTR -32[rbp]
	lea	rdx, 4[rax]
	mov	QWORD PTR -32[rbp], rdx
	movss	xmm0, DWORD PTR [rax]
	movss	xmm2, DWORD PTR -24[rbp]
	movaps	xmm1, xmm0
	divss	xmm1, xmm2
	mov	rax, QWORD PTR 40[rbp]
	test	rax, rax
	js	.L145
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, rax
	jmp	.L146
.L145:
	mov	rdx, rax
	shr	rdx
	and	eax, 1
	or	rdx, rax
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, rdx
	addss	xmm0, xmm0
.L146:
	mulss	xmm0, xmm1
	cvttss2si	eax, xmm0
	mov	DWORD PTR -8[rbp], eax
	jmp	.L144
.L142:
	mov	rax, QWORD PTR -32[rbp]
	lea	rdx, 8[rax]
	mov	QWORD PTR -32[rbp], rdx
	movsd	xmm0, QWORD PTR [rax]
	movsd	xmm2, QWORD PTR -24[rbp]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	mov	rax, QWORD PTR 40[rbp]
	test	rax, rax
	js	.L147
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	jmp	.L148
.L147:
	mov	rdx, rax
	shr	rdx
	and	eax, 1
	or	rdx, rax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rdx
	addsd	xmm0, xmm0
.L148:
	mulsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	mov	DWORD PTR -8[rbp], eax
	jmp	.L144
.L152:
	nop
.L144:
	mov	rdx, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	mov	rcx, QWORD PTR 40[rbp]
	sub	rcx, rax
	mov	r8, rcx
	mov	ecx, DWORD PTR -8[rbp]
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	r9, r8
	mov	r8d, ecx
	mov	rdx, rax
	lea	rax, .LC15[rip]
	mov	rcx, rax
	call	printf
	add	QWORD PTR -16[rbp], 1
.L135:
	mov	eax, DWORD PTR 32[rbp]
	cdqe
	cmp	QWORD PTR -16[rbp], rax
	jb	.L149
.L114:
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	_highest_size_t
	.def	_highest_size_t;	.scl	2;	.type	32;	.endef
	.seh_proc	_highest_size_t
_highest_size_t:
	push	rbp
	.seh_pushreg	rbp
	push	rdi
	.seh_pushreg	rdi
	push	rsi
	.seh_pushreg	rsi
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 24
	.seh_stackalloc	24
	lea	rbp, 16[rsp]
	.seh_setframe	rbp, 16
	.seh_endprologue
	mov	QWORD PTR 48[rbp], rcx
	mov	DWORD PTR 56[rbp], edx
	mov	DWORD PTR 64[rbp], r8d
	mov	rbx, QWORD PTR 48[rbp]
	mov	edi, 0
	mov	DWORD PTR -4[rbp], 0
	jmp	.L154
.L170:
	cmp	DWORD PTR 64[rbp], 10
	ja	.L155
	mov	eax, DWORD PTR 64[rbp]
	lea	rdx, 0[0+rax*4]
	lea	rax, .L157[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L157[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L157:
	.long	.L155-.L157
	.long	.L162-.L157
	.long	.L161-.L157
	.long	.L160-.L157
	.long	.L160-.L157
	.long	.L159-.L157
	.long	.L159-.L157
	.long	.L158-.L157
	.long	.L158-.L157
	.long	.L156-.L157
	.long	.L156-.L157
	.text
.L160:
	movzx	eax, BYTE PTR [rbx]
	movzx	esi, al
	add	rbx, 1
	jmp	.L163
.L159:
	movzx	eax, WORD PTR [rbx]
	movzx	esi, ax
	add	rbx, 2
	jmp	.L163
.L158:
	mov	eax, DWORD PTR [rbx]
	mov	esi, eax
	add	rbx, 4
	jmp	.L163
.L156:
	mov	rsi, QWORD PTR [rbx]
	add	rbx, 8
	jmp	.L163
.L162:
	movss	xmm0, DWORD PTR [rbx]
	comiss	xmm0, DWORD PTR .LC16[rip]
	jnb	.L164
	cvttss2si	rsi, xmm0
	jmp	.L165
.L164:
	movss	xmm1, DWORD PTR .LC16[rip]
	subss	xmm0, xmm1
	cvttss2si	rsi, xmm0
	movabs	rax, -9223372036854775808
	xor	rsi, rax
.L165:
	add	rbx, 4
	jmp	.L163
.L161:
	movsd	xmm0, QWORD PTR [rbx]
	comisd	xmm0, QWORD PTR .LC17[rip]
	jnb	.L166
	cvttsd2si	rsi, xmm0
	jmp	.L167
.L166:
	movsd	xmm1, QWORD PTR .LC17[rip]
	subsd	xmm0, xmm1
	cvttsd2si	rsi, xmm0
	movabs	rax, -9223372036854775808
	xor	rsi, rax
.L167:
	add	rbx, 8
	jmp	.L163
.L155:
	mov	eax, 0
	jmp	.L168
.L163:
	cmp	rdi, rsi
	jnb	.L169
	mov	rdi, rsi
.L169:
	add	DWORD PTR -4[rbp], 1
.L154:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR 56[rbp]
	jl	.L170
	mov	rax, rdi
.L168:
	add	rsp, 24
	pop	rbx
	pop	rsi
	pop	rdi
	pop	rbp
	ret
	.seh_endproc
	.globl	_highest_type_T
	.def	_highest_type_T;	.scl	2;	.type	32;	.endef
	.seh_proc	_highest_type_T
_highest_type_T:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 40
	.seh_stackalloc	40
	lea	rbp, 32[rsp]
	.seh_setframe	rbp, 32
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	DWORD PTR 40[rbp], edx
	mov	DWORD PTR 48[rbp], r8d
	mov	QWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L172
.L188:
	cmp	DWORD PTR 48[rbp], 10
	ja	.L173
	mov	eax, DWORD PTR 48[rbp]
	lea	rdx, 0[0+rax*4]
	lea	rax, .L175[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L175[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L175:
	.long	.L173-.L175
	.long	.L180-.L175
	.long	.L179-.L175
	.long	.L178-.L175
	.long	.L178-.L175
	.long	.L177-.L175
	.long	.L177-.L175
	.long	.L176-.L175
	.long	.L176-.L175
	.long	.L174-.L175
	.long	.L174-.L175
	.text
.L178:
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR -24[rbp], rdx
	movzx	eax, BYTE PTR [rax]
	movzx	ebx, al
	jmp	.L181
.L177:
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 2[rax]
	mov	QWORD PTR -24[rbp], rdx
	movzx	eax, WORD PTR [rax]
	movzx	ebx, ax
	jmp	.L181
.L176:
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 4[rax]
	mov	QWORD PTR -24[rbp], rdx
	mov	eax, DWORD PTR [rax]
	mov	ebx, eax
	jmp	.L181
.L174:
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 8[rax]
	mov	QWORD PTR -24[rbp], rdx
	mov	rbx, QWORD PTR [rax]
	jmp	.L181
.L180:
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 4[rax]
	mov	QWORD PTR -24[rbp], rdx
	movss	xmm0, DWORD PTR [rax]
	comiss	xmm0, DWORD PTR .LC16[rip]
	jnb	.L182
	cvttss2si	rbx, xmm0
	jmp	.L181
.L182:
	movss	xmm1, DWORD PTR .LC16[rip]
	subss	xmm0, xmm1
	cvttss2si	rbx, xmm0
	movabs	rax, -9223372036854775808
	xor	rbx, rax
	jmp	.L181
.L179:
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, 8[rax]
	mov	QWORD PTR -24[rbp], rdx
	movsd	xmm0, QWORD PTR [rax]
	comisd	xmm0, QWORD PTR .LC17[rip]
	jnb	.L184
	cvttsd2si	rbx, xmm0
	jmp	.L181
.L184:
	movsd	xmm1, QWORD PTR .LC17[rip]
	subsd	xmm0, xmm1
	cvttsd2si	rbx, xmm0
	movabs	rax, -9223372036854775808
	xor	rbx, rax
	jmp	.L181
.L173:
	mov	eax, 0
	jmp	.L189
.L181:
	mov	rax, QWORD PTR -16[rbp]
	cmp	rax, rbx
	jnb	.L187
	mov	QWORD PTR -16[rbp], rbx
.L187:
	add	DWORD PTR -4[rbp], 1
.L172:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR 40[rbp]
	jl	.L188
	mov	rax, QWORD PTR -16[rbp]
.L189:
	add	rsp, 40
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	_printBar
	.def	_printBar;	.scl	2;	.type	32;	.endef
	.seh_proc	_printBar
_printBar:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 32
	.seh_stackalloc	32
	lea	rbp, 16[rsp]
	.seh_setframe	rbp, 16
	movups	XMMWORD PTR 0[rbp], xmm6
	.seh_savexmm	xmm6, 16
	.seh_endprologue
	mov	rax, rcx
	movapd	xmm0, xmm1
	movsd	QWORD PTR 48[rbp], xmm2
	mov	DWORD PTR 56[rbp], r9d
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR 64[rbp], 0
	je	.L191
	mov	rdx, QWORD PTR 64[rbp]
	movzx	ecx, BYTE PTR [rdx]
	jmp	.L192
.L191:
	mov	ecx, 91
.L192:
	mov	rdx, rax
	lea	rax, 1[rdx]
	mov	BYTE PTR [rdx], cl
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, DWORD PTR 56[rbp]
	movsd	xmm1, QWORD PTR 48[rbp]
	movapd	xmm6, xmm1
	divsd	xmm6, xmm2
	mov	DWORD PTR -4[rbp], 0
	jmp	.L193
.L201:
	pxor	xmm1, xmm1
	comisd	xmm0, xmm1
	jb	.L206
	subsd	xmm0, xmm6
	cmp	QWORD PTR 64[rbp], 0
	je	.L196
	mov	rdx, QWORD PTR 64[rbp]
	movzx	ecx, BYTE PTR 2[rdx]
	jmp	.L197
.L196:
	mov	ecx, 35
.L197:
	mov	rdx, rax
	lea	rax, 1[rdx]
	mov	BYTE PTR [rdx], cl
	jmp	.L198
.L206:
	cmp	QWORD PTR 64[rbp], 0
	je	.L199
	mov	rdx, QWORD PTR 64[rbp]
	movzx	ecx, BYTE PTR 3[rdx]
	jmp	.L200
.L199:
	mov	ecx, 45
.L200:
	mov	rdx, rax
	lea	rax, 1[rdx]
	mov	BYTE PTR [rdx], cl
.L198:
	add	DWORD PTR -4[rbp], 1
.L193:
	mov	edx, DWORD PTR -4[rbp]
	cmp	edx, DWORD PTR 56[rbp]
	jl	.L201
	cmp	QWORD PTR 64[rbp], 0
	je	.L202
	mov	rdx, QWORD PTR 64[rbp]
	movzx	edx, BYTE PTR 1[rdx]
	jmp	.L203
.L202:
	mov	edx, 93
.L203:
	mov	BYTE PTR [rax], dl
	mov	rax, QWORD PTR -16[rbp]
	movups	xmm6, XMMWORD PTR 0[rbp]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC19:
	.ascii "[%3d] %d : %c\12\0"
	.text
	.globl	getline
	.def	getline;	.scl	2;	.type	32;	.endef
	.seh_proc	getline
getline:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR 24[rbp], edx
	mov	BYTE PTR -5[rbp], 0
	mov	DWORD PTR -4[rbp], 0
	jmp	.L208
.L211:
	call	getch
	mov	BYTE PTR -5[rbp], al
	mov	edx, DWORD PTR -4[rbp]
	mov	rax, QWORD PTR 16[rbp]
	add	rdx, rax
	movzx	eax, BYTE PTR -5[rbp]
	mov	BYTE PTR [rdx], al
	movsx	ecx, BYTE PTR -5[rbp]
	movsx	edx, BYTE PTR -5[rbp]
	mov	eax, DWORD PTR -4[rbp]
	mov	r9d, ecx
	mov	r8d, edx
	mov	edx, eax
	lea	rax, .LC19[rip]
	mov	rcx, rax
	call	printf
	cmp	BYTE PTR -5[rbp], 13
	je	.L213
	add	DWORD PTR -4[rbp], 1
.L208:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR 24[rbp]
	jb	.L211
	jmp	.L210
.L213:
	nop
.L210:
	mov	eax, DWORD PTR -4[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	init
	.def	init;	.scl	2;	.type	32;	.endef
	.seh_proc	init
init:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	nop
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 32
obj_vtable:
	.quad	obj_init
	.quad	obj_translate
	.quad	obj_income
	.quad	obj_attack
	.quad	obj_idle
	.quad	obj_stat_update
	.quad	obj_print_stats
	.text
	.globl	obj_translate
	.def	obj_translate;	.scl	2;	.type	32;	.endef
	.seh_proc	obj_translate
obj_translate:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	lea	rbp, [rsp]
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 24[rbp], rcx
	mov	rbx, rdx
	mov	rax, QWORD PTR 24[rbp]
	movss	xmm0, DWORD PTR 8[rax]
	pxor	xmm1, xmm1
	cvtss2sd	xmm1, xmm0
	movss	xmm0, DWORD PTR [rbx]
	pxor	xmm2, xmm2
	cvtss2sd	xmm2, xmm0
	mov	rax, QWORD PTR 24[rbp]
	mov	eax, DWORD PTR 88[rax]
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, eax
	movsd	xmm0, QWORD PTR .LC20[rip]
	mulsd	xmm0, xmm3
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvtsd2ss	xmm0, xmm0
	mov	rax, QWORD PTR 24[rbp]
	movss	DWORD PTR 8[rax], xmm0
	mov	rax, QWORD PTR 24[rbp]
	movss	xmm0, DWORD PTR 12[rax]
	pxor	xmm1, xmm1
	cvtss2sd	xmm1, xmm0
	movss	xmm0, DWORD PTR 4[rbx]
	pxor	xmm2, xmm2
	cvtss2sd	xmm2, xmm0
	mov	rax, QWORD PTR 24[rbp]
	mov	eax, DWORD PTR 88[rax]
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, eax
	movsd	xmm0, QWORD PTR .LC20[rip]
	mulsd	xmm0, xmm3
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvtsd2ss	xmm0, xmm0
	mov	rax, QWORD PTR 24[rbp]
	movss	DWORD PTR 12[rax], xmm0
	mov	rax, QWORD PTR 24[rbp]
	movss	xmm0, DWORD PTR 16[rax]
	pxor	xmm1, xmm1
	cvtss2sd	xmm1, xmm0
	movss	xmm0, DWORD PTR 8[rbx]
	pxor	xmm2, xmm2
	cvtss2sd	xmm2, xmm0
	mov	rax, QWORD PTR 24[rbp]
	mov	eax, DWORD PTR 88[rax]
	pxor	xmm3, xmm3
	cvtsi2sd	xmm3, eax
	movsd	xmm0, QWORD PTR .LC20[rip]
	mulsd	xmm0, xmm3
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	cvtsd2ss	xmm0, xmm0
	mov	rax, QWORD PTR 24[rbp]
	movss	DWORD PTR 16[rax], xmm0
	nop
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	obj_attack
	.def	obj_attack;	.scl	2;	.type	32;	.endef
	.seh_proc	obj_attack
obj_attack:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 16
	.seh_stackalloc	16
	lea	rbp, [rsp]
	.seh_setframe	rbp, 0
	movups	XMMWORD PTR 0[rbp], xmm6
	.seh_savexmm	xmm6, 0
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	DWORD PTR 40[rbp], edx
	pxor	xmm6, xmm6
	cmp	DWORD PTR 40[rbp], 0
	je	.L217
	cmp	DWORD PTR 40[rbp], 1
	je	.L218
	jmp	.L220
.L217:
	mov	rax, QWORD PTR 32[rbp]
	mov	eax, DWORD PTR 80[rax]
	add	eax, eax
	pxor	xmm6, xmm6
	cvtsi2sd	xmm6, eax
	mov	rax, QWORD PTR 32[rbp]
	movsd	xmm0, QWORD PTR 40[rax]
	mov	rax, QWORD PTR 32[rbp]
	mov	ecx, DWORD PTR 84[rax]
	mov	eax, 10
	cdq
	idiv	ecx
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	subsd	xmm0, xmm1
	mov	rax, QWORD PTR 32[rbp]
	movsd	QWORD PTR 40[rax], xmm0
	jmp	.L220
.L218:
	mov	rax, QWORD PTR 32[rbp]
	mov	edx, DWORD PTR 80[rax]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	pxor	xmm6, xmm6
	cvtsi2sd	xmm6, eax
	mov	rax, QWORD PTR 32[rbp]
	movsd	xmm0, QWORD PTR 40[rax]
	mov	rax, QWORD PTR 32[rbp]
	mov	ecx, DWORD PTR 84[rax]
	mov	eax, 20
	cdq
	idiv	ecx
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	subsd	xmm0, xmm1
	mov	rax, QWORD PTR 32[rbp]
	movsd	QWORD PTR 40[rax], xmm0
	nop
.L220:
	movapd	xmm0, xmm6
	movups	xmm6, XMMWORD PTR 0[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	obj_income
	.def	obj_income;	.scl	2;	.type	32;	.endef
	.seh_proc	obj_income
obj_income:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	movsd	QWORD PTR 24[rbp], xmm1
	mov	rax, QWORD PTR 16[rbp]
	movsd	xmm0, QWORD PTR 72[rax]
	addsd	xmm0, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR 16[rbp]
	movsd	QWORD PTR 72[rax], xmm0
	nop
	pop	rbp
	ret
	.seh_endproc
	.globl	obj_idle
	.def	obj_idle;	.scl	2;	.type	32;	.endef
	.seh_proc	obj_idle
obj_idle:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	movsd	xmm1, QWORD PTR 40[rax]
	mov	rax, QWORD PTR 16[rbp]
	movsd	xmm0, QWORD PTR 64[rax]
	comisd	xmm0, xmm1
	jbe	.L224
	mov	rax, QWORD PTR 16[rbp]
	movsd	xmm1, QWORD PTR 40[rax]
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 96[rax]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC21[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	mov	rax, QWORD PTR 16[rbp]
	movsd	QWORD PTR 40[rax], xmm0
.L224:
	mov	rax, QWORD PTR 16[rbp]
	movsd	xmm1, QWORD PTR 32[rax]
	mov	rax, QWORD PTR 16[rbp]
	movsd	xmm0, QWORD PTR 56[rax]
	comisd	xmm0, xmm1
	jbe	.L226
	mov	rax, QWORD PTR 16[rbp]
	movsd	xmm1, QWORD PTR 32[rax]
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 96[rax]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC22[rip]
	mulsd	xmm2, xmm0
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 92[rax]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	mov	rax, QWORD PTR 16[rbp]
	movsd	QWORD PTR 32[rax], xmm0
.L226:
	mov	rax, QWORD PTR 16[rbp]
	movsd	xmm1, QWORD PTR 24[rax]
	mov	rax, QWORD PTR 16[rbp]
	movsd	xmm0, QWORD PTR 48[rax]
	comisd	xmm0, xmm1
	ja	.L232
	jmp	.L233
.L232:
	mov	rax, QWORD PTR 16[rbp]
	movsd	xmm1, QWORD PTR 24[rax]
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 84[rax]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC23[rip]
	mulsd	xmm2, xmm0
	mov	rax, QWORD PTR 16[rbp]
	mov	eax, DWORD PTR 96[rax]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	mov	rax, QWORD PTR 16[rbp]
	movsd	QWORD PTR 24[rax], xmm0
.L233:
	nop
	pop	rbp
	ret
	.seh_endproc
	.globl	obj_init
	.def	obj_init;	.scl	2;	.type	32;	.endef
	.seh_proc	obj_init
obj_init:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	lea	rdx, obj_vtable[rip]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR 16[rbp]
	pxor	xmm0, xmm0
	movss	DWORD PTR 8[rax], xmm0
	mov	rax, QWORD PTR 16[rbp]
	pxor	xmm0, xmm0
	movss	DWORD PTR 12[rax], xmm0
	mov	rax, QWORD PTR 16[rbp]
	pxor	xmm0, xmm0
	movss	DWORD PTR 16[rax], xmm0
	mov	rax, QWORD PTR 16[rbp]
	mov	DWORD PTR 80[rax], 1
	mov	rax, QWORD PTR 16[rbp]
	mov	DWORD PTR 84[rax], 1
	mov	rax, QWORD PTR 16[rbp]
	mov	DWORD PTR 88[rax], 1
	mov	rax, QWORD PTR 16[rbp]
	mov	DWORD PTR 92[rax], 1
	mov	rax, QWORD PTR 16[rbp]
	mov	DWORD PTR 96[rax], 1
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, QWORD PTR 40[rax]
	pxor	xmm0, xmm0
	movups	XMMWORD PTR -64[rbp], xmm0
	movd	DWORD PTR -48[rbp], xmm0
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR -56[rbp]
	mov	QWORD PTR -96[rbp], rax
	mov	QWORD PTR -88[rbp], rdx
	mov	eax, DWORD PTR -48[rbp]
	mov	DWORD PTR -80[rbp], eax
	lea	rdx, -96[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	r8
	mov	rax, QWORD PTR 16[rbp]
	movsd	xmm0, QWORD PTR .LC25[rip]
	movsd	QWORD PTR 72[rax], xmm0
	mov	rax, QWORD PTR 16[rbp]
	movsd	xmm0, QWORD PTR 48[rax]
	mov	rax, QWORD PTR 16[rbp]
	movsd	QWORD PTR 24[rax], xmm0
	mov	rax, QWORD PTR 16[rbp]
	movsd	xmm0, QWORD PTR 56[rax]
	mov	rax, QWORD PTR 16[rbp]
	movsd	QWORD PTR 32[rax], xmm0
	mov	rax, QWORD PTR 16[rbp]
	movsd	xmm0, QWORD PTR 64[rax]
	mov	rax, QWORD PTR 16[rbp]
	movsd	QWORD PTR 40[rax], xmm0
	nop
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	obj_stat_update
	.def	obj_stat_update;	.scl	2;	.type	32;	.endef
	.seh_proc	obj_stat_update
obj_stat_update:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	lea	rbp, [rsp]
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 24[rbp], rcx
	mov	rbx, rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	edx, DWORD PTR 80[rax]
	mov	eax, DWORD PTR [rbx]
	add	edx, eax
	mov	rax, QWORD PTR 24[rbp]
	mov	DWORD PTR 80[rax], edx
	mov	rax, QWORD PTR 24[rbp]
	mov	edx, DWORD PTR 84[rax]
	mov	eax, DWORD PTR 4[rbx]
	add	edx, eax
	mov	rax, QWORD PTR 24[rbp]
	mov	DWORD PTR 84[rax], edx
	mov	rax, QWORD PTR 24[rbp]
	mov	edx, DWORD PTR 88[rax]
	mov	eax, DWORD PTR 8[rbx]
	add	edx, eax
	mov	rax, QWORD PTR 24[rbp]
	mov	DWORD PTR 88[rax], edx
	mov	rax, QWORD PTR 24[rbp]
	mov	edx, DWORD PTR 92[rax]
	mov	eax, DWORD PTR 12[rbx]
	add	edx, eax
	mov	rax, QWORD PTR 24[rbp]
	mov	DWORD PTR 92[rax], edx
	mov	rax, QWORD PTR 24[rbp]
	mov	edx, DWORD PTR 96[rax]
	mov	eax, DWORD PTR 16[rbx]
	add	edx, eax
	mov	rax, QWORD PTR 24[rbp]
	mov	DWORD PTR 96[rax], edx
	mov	rax, QWORD PTR 24[rbp]
	mov	eax, DWORD PTR 96[rax]
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movsd	xmm0, QWORD PTR .LC26[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC27[rip]
	addsd	xmm1, xmm0
	mov	rax, QWORD PTR 24[rbp]
	mov	edx, DWORD PTR 84[rax]
	mov	eax, edx
	add	eax, eax
	add	eax, edx
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	addsd	xmm0, xmm1
	mov	rax, QWORD PTR 24[rbp]
	movsd	QWORD PTR 48[rax], xmm0
	mov	rax, QWORD PTR 24[rbp]
	mov	edx, DWORD PTR 96[rax]
	mov	eax, edx
	sal	eax, 4
	sub	eax, edx
	lea	ecx, 250[rax]
	mov	rax, QWORD PTR 24[rbp]
	mov	edx, DWORD PTR 84[rax]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	sal	eax, 2
	add	ecx, eax
	mov	rax, QWORD PTR 24[rbp]
	mov	edx, DWORD PTR 80[rax]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, ecx
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR 24[rbp]
	movsd	QWORD PTR 64[rax], xmm0
	mov	rax, QWORD PTR 24[rbp]
	mov	edx, DWORD PTR 92[rax]
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	add	eax, 100
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	mov	rax, QWORD PTR 24[rbp]
	mov	eax, DWORD PTR 96[rax]
	pxor	xmm2, xmm2
	cvtsi2sd	xmm2, eax
	movsd	xmm0, QWORD PTR .LC28[rip]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	mov	rax, QWORD PTR 24[rbp]
	movsd	QWORD PTR 56[rax], xmm0
	nop
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC29:
	.ascii "HP: %3.2lf/%-3.2lf %s\11MP: %3.2lf/%-3.2lf %s\12\0"
.LC30:
	.ascii "stamina: %4lf/%-4lf\12%s\12\12\0"
.LC31:
	.ascii "x: %lf  y: %lf  z: %lf\12\0"
.LC32:
	.ascii "Gold: %4.2lf\12\12\0"
	.align 8
.LC33:
	.ascii "STR: %3d\12DEX: %3d\12SPD: %3d\12INT: %3d\12VIT: %3d\12\0"
	.text
	.globl	obj_print_stats
	.def	obj_print_stats;	.scl	2;	.type	32;	.endef
	.seh_proc	obj_print_stats
obj_print_stats:
	push	rbp
	.seh_pushreg	rbp
	push	rdi
	.seh_pushreg	rdi
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 208
	.seh_stackalloc	208
	lea	rbp, 176[rsp]
	.seh_setframe	rbp, 176
	movups	XMMWORD PTR 0[rbp], xmm6
	.seh_savexmm	xmm6, 176
	movups	XMMWORD PTR 16[rbp], xmm7
	.seh_savexmm	xmm7, 192
	.seh_endprologue
	mov	QWORD PTR 64[rbp], rcx
	lea	rdx, -112[rbp]
	mov	eax, 0
	mov	ecx, 13
	mov	rdi, rdx
	rep stosq
	mov	rdx, rdi
	mov	BYTE PTR [rdx], al
	add	rdx, 1
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm1, QWORD PTR 56[rax]
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm0, QWORD PTR 32[rax]
	lea	rax, -112[rbp]
	add	rax, 35
	mov	QWORD PTR 32[rsp], 0
	mov	r9d, 32
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	mov	rcx, rax
	call	_printBar
	mov	rbx, rax
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm7, QWORD PTR 56[rax]
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm6, QWORD PTR 32[rax]
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm1, QWORD PTR 48[rax]
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm0, QWORD PTR 24[rax]
	lea	rax, -112[rbp]
	mov	QWORD PTR 32[rsp], 0
	mov	r9d, 32
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	mov	rcx, rax
	call	_printBar
	mov	rdx, rax
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm1, QWORD PTR 48[rax]
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm0, QWORD PTR 24[rax]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm2
	movq	rcx, xmm2
	movapd	xmm2, xmm0
	movapd	xmm0, xmm2
	movq	rax, xmm2
	mov	QWORD PTR 48[rsp], rbx
	movsd	QWORD PTR 40[rsp], xmm7
	movsd	QWORD PTR 32[rsp], xmm6
	mov	r9, rdx
	movapd	xmm2, xmm1
	mov	r8, rcx
	movapd	xmm1, xmm0
	mov	rdx, rax
	lea	rax, .LC29[rip]
	mov	rcx, rax
	call	printf
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm1, QWORD PTR 64[rax]
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm0, QWORD PTR 40[rax]
	lea	rax, -112[rbp]
	add	rax, 70
	mov	QWORD PTR 32[rsp], 0
	mov	r9d, 32
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	mov	rcx, rax
	call	_printBar
	mov	rdx, rax
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm1, QWORD PTR 64[rax]
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm0, QWORD PTR 40[rax]
	movapd	xmm2, xmm1
	movapd	xmm1, xmm2
	movq	rcx, xmm2
	movapd	xmm2, xmm0
	movapd	xmm0, xmm2
	movq	rax, xmm2
	mov	r9, rdx
	movapd	xmm2, xmm1
	mov	r8, rcx
	movapd	xmm1, xmm0
	mov	rdx, rax
	lea	rax, .LC30[rip]
	mov	rcx, rax
	call	printf
	mov	rax, QWORD PTR 64[rbp]
	movss	xmm0, DWORD PTR 16[rax]
	pxor	xmm2, xmm2
	cvtss2sd	xmm2, xmm0
	mov	rax, QWORD PTR 64[rbp]
	movss	xmm0, DWORD PTR 12[rax]
	pxor	xmm1, xmm1
	cvtss2sd	xmm1, xmm0
	mov	rax, QWORD PTR 64[rbp]
	movss	xmm0, DWORD PTR 8[rax]
	cvtss2sd	xmm0, xmm0
	movapd	xmm3, xmm2
	movapd	xmm2, xmm3
	movq	rcx, xmm3
	movapd	xmm3, xmm1
	movapd	xmm1, xmm3
	movq	rdx, xmm3
	movapd	xmm3, xmm0
	movapd	xmm0, xmm3
	movq	rax, xmm3
	movapd	xmm3, xmm2
	mov	r9, rcx
	movapd	xmm2, xmm1
	mov	r8, rdx
	movapd	xmm1, xmm0
	mov	rdx, rax
	lea	rax, .LC31[rip]
	mov	rcx, rax
	call	printf
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm0, QWORD PTR 72[rax]
	movapd	xmm1, xmm0
	movapd	xmm0, xmm1
	movq	rax, xmm1
	movapd	xmm1, xmm0
	mov	rdx, rax
	lea	rax, .LC32[rip]
	mov	rcx, rax
	call	printf
	mov	rax, QWORD PTR 64[rbp]
	mov	ecx, DWORD PTR 96[rax]
	mov	rax, QWORD PTR 64[rbp]
	mov	edx, DWORD PTR 92[rax]
	mov	rax, QWORD PTR 64[rbp]
	mov	r9d, DWORD PTR 88[rax]
	mov	rax, QWORD PTR 64[rbp]
	mov	r8d, DWORD PTR 84[rax]
	mov	rax, QWORD PTR 64[rbp]
	mov	eax, DWORD PTR 80[rax]
	mov	DWORD PTR 40[rsp], ecx
	mov	DWORD PTR 32[rsp], edx
	mov	edx, eax
	lea	rax, .LC33[rip]
	mov	rcx, rax
	call	printf
	nop
	movups	xmm6, XMMWORD PTR 0[rbp]
	movups	xmm7, XMMWORD PTR 16[rbp]
	add	rsp, 208
	pop	rbx
	pop	rdi
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC34:
	.ascii "cls\0"
.LC36:
	.ascii "\33[Hiteration: %6d  UPS: %lf\12\12\0"
.LC37:
	.ascii "\12\12KEY: %d\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 320
	.seh_stackalloc	320
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	call	__main
	lea	rax, .LC34[rip]
	mov	rcx, rax
	call	system
	mov	ecx, 104
	call	malloc
	mov	QWORD PTR 152[rbp], rax
	mov	rax, QWORD PTR 152[rbp]
	lea	rdx, obj_vtable[rip]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR 152[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR 152[rbp]
	mov	rcx, rax
	call	rdx
	mov	DWORD PTR 188[rbp], 0
	mov	BYTE PTR 187[rbp], 0
	mov	QWORD PTR 176[rbp], 0
	pxor	xmm0, xmm0
	movsd	QWORD PTR 168[rbp], xmm0
	mov	DWORD PTR 164[rbp], 0
.L259:
	mov	ecx, 0
	mov	rax, QWORD PTR __imp__sleep[rip]
	call	rax
	mov	eax, DWORD PTR 164[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR 164[rbp], edx
	cmp	eax, 63
	jg	.L238
	call	_clockElapsed
	cdqe
	add	QWORD PTR 176[rbp], rax
	jmp	.L239
.L238:
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, QWORD PTR 176[rbp]
	movsd	xmm0, QWORD PTR .LC35[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR 168[rbp], xmm0
	mov	QWORD PTR 176[rbp], 0
	mov	DWORD PTR 164[rbp], 0
.L239:
	mov	eax, DWORD PTR 188[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR 188[rbp], edx
	movsd	xmm0, QWORD PTR 168[rbp]
	mov	rdx, QWORD PTR 168[rbp]
	movapd	xmm2, xmm0
	mov	r8, rdx
	mov	edx, eax
	lea	rax, .LC36[rip]
	mov	rcx, rax
	call	printf
	mov	rax, QWORD PTR 152[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR 48[rax]
	mov	rax, QWORD PTR 152[rbp]
	mov	rcx, rax
	call	rdx
	movsx	eax, BYTE PTR 187[rbp]
	mov	edx, eax
	lea	rax, .LC37[rip]
	mov	rcx, rax
	call	printf
	mov	rax, QWORD PTR __imp__kbhit[rip]
	call	rax
	test	eax, eax
	je	.L240
	call	getch
	jmp	.L241
.L240:
	mov	eax, 0
.L241:
	mov	BYTE PTR 187[rbp], al
	movsx	eax, BYTE PTR 187[rbp]
	sub	eax, 32
	cmp	eax, 87
	ja	.L242
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L244[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L244[rip]
	add	rax, rdx
	jmp	rax
	.section .rdata,"dr"
	.align 4
.L244:
	.long	.L255-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L254-.L244
	.long	.L253-.L244
	.long	.L252-.L244
	.long	.L251-.L244
	.long	.L250-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L249-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L248-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L247-.L244
	.long	.L246-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L245-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L243-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L249-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L248-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L247-.L244
	.long	.L246-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L245-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L243-.L244
	.text
.L243:
	mov	rax, QWORD PTR 152[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, QWORD PTR 8[rax]
	pxor	xmm0, xmm0
	movss	DWORD PTR 140[rbp], xmm0
	movss	xmm0, DWORD PTR .LC38[rip]
	movss	DWORD PTR 144[rbp], xmm0
	pxor	xmm0, xmm0
	movss	DWORD PTR 148[rbp], xmm0
	mov	rax, QWORD PTR 140[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	eax, DWORD PTR 148[rbp]
	mov	DWORD PTR -56[rbp], eax
	lea	rdx, -64[rbp]
	mov	rax, QWORD PTR 152[rbp]
	mov	rcx, rax
	call	r8
	jmp	.L258
.L249:
	mov	rax, QWORD PTR 152[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, QWORD PTR 8[rax]
	movss	xmm0, DWORD PTR .LC39[rip]
	movss	DWORD PTR 128[rbp], xmm0
	pxor	xmm0, xmm0
	movss	DWORD PTR 132[rbp], xmm0
	pxor	xmm0, xmm0
	movss	DWORD PTR 136[rbp], xmm0
	mov	rax, QWORD PTR 128[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	eax, DWORD PTR 136[rbp]
	mov	DWORD PTR -56[rbp], eax
	lea	rdx, -64[rbp]
	mov	rax, QWORD PTR 152[rbp]
	mov	rcx, rax
	call	r8
	jmp	.L258
.L245:
	mov	rax, QWORD PTR 152[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, QWORD PTR 8[rax]
	pxor	xmm0, xmm0
	movss	DWORD PTR 116[rbp], xmm0
	movss	xmm0, DWORD PTR .LC39[rip]
	movss	DWORD PTR 120[rbp], xmm0
	pxor	xmm0, xmm0
	movss	DWORD PTR 124[rbp], xmm0
	mov	rax, QWORD PTR 116[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	eax, DWORD PTR 124[rbp]
	mov	DWORD PTR -56[rbp], eax
	lea	rdx, -64[rbp]
	mov	rax, QWORD PTR 152[rbp]
	mov	rcx, rax
	call	r8
	jmp	.L258
.L248:
	mov	rax, QWORD PTR 152[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, QWORD PTR 8[rax]
	movss	xmm0, DWORD PTR .LC38[rip]
	movss	DWORD PTR 104[rbp], xmm0
	pxor	xmm0, xmm0
	movss	DWORD PTR 108[rbp], xmm0
	pxor	xmm0, xmm0
	movss	DWORD PTR 112[rbp], xmm0
	mov	rax, QWORD PTR 104[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	eax, DWORD PTR 112[rbp]
	mov	DWORD PTR -56[rbp], eax
	lea	rdx, -64[rbp]
	mov	rax, QWORD PTR 152[rbp]
	mov	rcx, rax
	call	r8
	jmp	.L258
.L247:
	mov	rax, QWORD PTR 152[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, QWORD PTR 24[rax]
	mov	rax, QWORD PTR 152[rbp]
	mov	edx, 0
	mov	rcx, rax
	call	r8
	jmp	.L258
.L246:
	mov	rax, QWORD PTR 152[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, QWORD PTR 24[rax]
	mov	rax, QWORD PTR 152[rbp]
	mov	edx, 1
	mov	rcx, rax
	call	r8
	jmp	.L258
.L254:
	mov	rax, QWORD PTR 152[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, QWORD PTR 40[rax]
	mov	DWORD PTR 80[rbp], 1
	mov	DWORD PTR 84[rbp], 0
	mov	DWORD PTR 88[rbp], 0
	mov	DWORD PTR 92[rbp], 0
	mov	DWORD PTR 96[rbp], 0
	mov	rax, QWORD PTR 80[rbp]
	mov	rdx, QWORD PTR 88[rbp]
	mov	QWORD PTR -96[rbp], rax
	mov	QWORD PTR -88[rbp], rdx
	mov	eax, DWORD PTR 96[rbp]
	mov	DWORD PTR -80[rbp], eax
	lea	rdx, -96[rbp]
	mov	rax, QWORD PTR 152[rbp]
	mov	rcx, rax
	call	r8
	jmp	.L258
.L253:
	mov	rax, QWORD PTR 152[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, QWORD PTR 40[rax]
	mov	DWORD PTR 48[rbp], 0
	mov	DWORD PTR 52[rbp], 1
	mov	DWORD PTR 56[rbp], 0
	mov	DWORD PTR 60[rbp], 0
	mov	DWORD PTR 64[rbp], 0
	mov	rax, QWORD PTR 48[rbp]
	mov	rdx, QWORD PTR 56[rbp]
	mov	QWORD PTR -96[rbp], rax
	mov	QWORD PTR -88[rbp], rdx
	mov	eax, DWORD PTR 64[rbp]
	mov	DWORD PTR -80[rbp], eax
	lea	rdx, -96[rbp]
	mov	rax, QWORD PTR 152[rbp]
	mov	rcx, rax
	call	r8
	jmp	.L258
.L252:
	mov	rax, QWORD PTR 152[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, QWORD PTR 40[rax]
	mov	DWORD PTR 16[rbp], 0
	mov	DWORD PTR 20[rbp], 0
	mov	DWORD PTR 24[rbp], 1
	mov	DWORD PTR 28[rbp], 0
	mov	DWORD PTR 32[rbp], 0
	mov	rax, QWORD PTR 16[rbp]
	mov	rdx, QWORD PTR 24[rbp]
	mov	QWORD PTR -96[rbp], rax
	mov	QWORD PTR -88[rbp], rdx
	mov	eax, DWORD PTR 32[rbp]
	mov	DWORD PTR -80[rbp], eax
	lea	rdx, -96[rbp]
	mov	rax, QWORD PTR 152[rbp]
	mov	rcx, rax
	call	r8
	jmp	.L258
.L251:
	mov	rax, QWORD PTR 152[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, QWORD PTR 40[rax]
	mov	DWORD PTR -16[rbp], 0
	mov	DWORD PTR -12[rbp], 0
	mov	DWORD PTR -8[rbp], 0
	mov	DWORD PTR -4[rbp], 1
	mov	DWORD PTR 0[rbp], 0
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR -96[rbp], rax
	mov	QWORD PTR -88[rbp], rdx
	mov	eax, DWORD PTR 0[rbp]
	mov	DWORD PTR -80[rbp], eax
	lea	rdx, -96[rbp]
	mov	rax, QWORD PTR 152[rbp]
	mov	rcx, rax
	call	r8
	jmp	.L258
.L250:
	mov	rax, QWORD PTR 152[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, QWORD PTR 40[rax]
	mov	DWORD PTR -48[rbp], 0
	mov	DWORD PTR -44[rbp], 0
	mov	DWORD PTR -40[rbp], 0
	mov	DWORD PTR -36[rbp], 0
	mov	DWORD PTR -32[rbp], 1
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR -96[rbp], rax
	mov	QWORD PTR -88[rbp], rdx
	mov	eax, DWORD PTR -32[rbp]
	mov	DWORD PTR -80[rbp], eax
	lea	rdx, -96[rbp]
	mov	rax, QWORD PTR 152[rbp]
	mov	rcx, rax
	call	r8
	jmp	.L258
.L255:
	mov	rax, QWORD PTR 152[rbp]
	movsd	xmm0, QWORD PTR 72[rax]
	cvttsd2si	eax, xmm0
	jmp	.L260
.L242:
	mov	rax, QWORD PTR 152[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR 32[rax]
	mov	rax, QWORD PTR 152[rbp]
	mov	rcx, rax
	call	rdx
.L258:
	jmp	.L259
.L260:
	add	rsp, 320
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
__func__.2:
	.ascii "flog_init\0"
	.align 8
__func__.1:
	.ascii "debug_log\0"
	.align 8
__func__.0:
	.ascii "memswap_s\0"
	.align 4
.LC16:
	.long	1593835520
	.align 8
.LC17:
	.long	0
	.long	1138753536
	.align 8
.LC20:
	.long	858993459
	.long	1070805811
	.align 8
.LC21:
	.long	0
	.long	1072955392
	.align 8
.LC22:
	.long	-343597384
	.long	1070512209
	.align 8
.LC23:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC25:
	.long	0
	.long	1079902208
	.align 8
.LC26:
	.long	0
	.long	1075707904
	.align 8
.LC27:
	.long	0
	.long	1079574528
	.align 8
.LC28:
	.long	0
	.long	1074003968
	.align 8
.LC35:
	.long	0
	.long	1089421312
	.align 4
.LC38:
	.long	1065353216
	.align 4
.LC39:
	.long	-1082130432
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev1, Built by MSYS2 project) 14.2.0"
	.def	clock;	.scl	2;	.type	32;	.endef
	.def	snprintf;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	putc;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	getch;	.scl	2;	.type	32;	.endef
	.def	system;	.scl	2;	.type	32;	.endef
