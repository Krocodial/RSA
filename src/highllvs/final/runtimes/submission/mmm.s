	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"optimized_mmm.c"
	.text
	.align	2
	.global	determine_length
	.type	determine_length, %function
determine_length:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	mov	r3, r3, asr #1
	str	r3, [fp, #-12]
.L2:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L3
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	determine_length, .-determine_length
	.align	2
	.global	mmm
	.type	mmm, %function
mmm:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L6
.L7:
	ldr	r3, [fp, #-20]
	and	r1, r3, #1
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	and	r3, r2, r3
	and	r3, r3, #1
	add	r3, r1, r3
	mov	r1, r3
	ldr	r3, [fp, #-8]
	and	r2, r3, #1
	ldr	r3, [fp, #-12]
	mul	r0, r3, r2
	mov	r2, r1
	ldr	r3, [fp, #-16]
	mul	r3, r2, r3
	add	r2, r0, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r3, r3, lsr #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	mov	r3, r3, lsr #1
	str	r3, [fp, #-8]
.L6:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L7
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bcc	.L8
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	rsb	r3, r2, r3
	str	r3, [fp, #-20]
.L8:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	mmm, .-mmm
	.global	__aeabi_uidivmod
	.align	2
	.global	mme
	.type	mme, %function
mme:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-32]
	mov	r0, r3
	bl	determine_length
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #1
	mov	r3, #1
	mov	r3, r3, asl r2
	mov	r0, r3
	ldr	r1, [fp, #-32]
	bl	__aeabi_uidivmod
	mov	r3, r1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, #1
	mov	r1, r3
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-20]
	bl	mmm
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-20]
	bl	mmm
	mov	r3, r0
	str	r3, [fp, #-8]
	b	.L11
.L13:
	ldr	r3, [fp, #-28]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L12
	ldr	r0, [fp, #-12]
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-20]
	bl	mmm
	mov	r3, r0
	str	r3, [fp, #-12]
.L12:
	ldr	r0, [fp, #-8]
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-20]
	bl	mmm
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-28]
	mov	r3, r3, lsr #1
	str	r3, [fp, #-28]
.L11:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L13
	mov	r0, #1
	ldr	r1, [fp, #-12]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-20]
	bl	mmm
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	mme, .-mme
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	mov	r3, #123
	str	r3, [fp, #-28]
	mov	r3, #17
	str	r3, [fp, #-24]
	mov	r3, #2752
	add	r3, r3, #1
	str	r3, [fp, #-20]
	mov	r3, #3232
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	ip, [fp, #-16]
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	mme
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-20]
	ldr	ip, [fp, #-16]
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	mme
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
