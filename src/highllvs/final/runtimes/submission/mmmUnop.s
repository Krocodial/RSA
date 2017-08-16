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
	.file	"unoptimized_mmm.c"
	.global	__aeabi_uidivmod
	.text
	.align	2
	.global	mme
	.type	mme, %function
mme:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	__aeabi_uidivmod
	mov	r3, r1
	str	r3, [fp, #-16]
	b	.L2
.L4:
	ldr	r3, [fp, #-20]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L3
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	mul	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	__aeabi_uidivmod
	mov	r3, r1
	str	r3, [fp, #-8]
.L3:
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-16]
	mul	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	__aeabi_uidivmod
	mov	r3, r1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L4
	ldr	r3, [fp, #-8]
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
	mov	r3, #17
	str	r3, [fp, #-28]
	mov	r3, #2752
	add	r3, r3, #1
	str	r3, [fp, #-24]
	mov	r3, #123
	str	r3, [fp, #-20]
	mov	r3, #3232
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-16]
	bl	mme
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	bl	mme
	mov	r3, r0
	str	r3, [fp, #-8]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
