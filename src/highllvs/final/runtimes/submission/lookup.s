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
	.file	"optimized_lookup.c"
	.text
	.align	2
	.global	determinelength
	.type	determinelength, %function
determinelength:
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
	.size	determinelength, .-determinelength
	.global	__aeabi_idivmod
	.align	2
	.global	tableofpowers
	.type	tableofpowers, %function
tableofpowers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	str	r1, [fp, #-16]
	str	r2, [fp, #-20]
	str	r3, [fp, #-32]
	mov	r3, #1
	ldr	r1, [fp, #-32]
	str	r3, [r1, #0]
	ldr	r3, [fp, #-32]
	add	r2, r3, #4
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	mov	r1, #2
	str	r1, [fp, #-24]
	b	.L6
.L7:
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	add	r4, r2, r3
	ldr	r3, [fp, #-24]
	rsb	r3, r3, #1
	mov	r3, r3, asl #2
	rsb	r3, r3, #0
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	rsb	r3, r3, #1
	mov	r3, r3, asl #2
	rsb	r3, r3, #0
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r3, [r3, #0]
	mul	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [r4, #0]
	ldr	r2, [fp, #-24]
	add	r2, r2, #1
	str	r2, [fp, #-24]
.L6:
	ldr	r3, [fp, #-20]
	ldr	r1, [fp, #-24]
	cmp	r1, r3
	blt	.L7
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	tableofpowers, .-tableofpowers
	.align	2
	.global	crypt
	.type	crypt, %function
crypt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	mov	r2, #1
	str	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L10
.L12:
	ldr	r2, [fp, #-28]
	and	r3, r2, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L11
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #2
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-20]
	mul	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-32]
	bl	__aeabi_idivmod
	mov	r3, r1
	str	r3, [fp, #-20]
.L11:
	ldr	r3, [fp, #-28]
	mov	r3, r3, asr #1
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	add	r2, r2, #1
	str	r2, [fp, #-24]
.L10:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L12
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r4, r3, asr #31
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	crypt, .-crypt
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 2080
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #2080
	sub	sp, sp, #4
	mov	r3, #123
	str	r3, [fp, #-40]
	mov	r3, #17
	str	r3, [fp, #-36]
	mov	r3, #2752
	add	r3, r3, #1
	str	r3, [fp, #-32]
	mov	r3, #3232
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-36]
	bl	determinelength
	mov	r3, r0
	str	r3, [fp, #-24]
	sub	r3, fp, #2064
	sub	r3, r3, #12
	sub	r3, r3, #12
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-24]
	bl	tableofpowers
	sub	r3, fp, #2064
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-28]
	bl	crypt
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-32]
	bl	determinelength
	mov	r3, r0
	str	r3, [fp, #-24]
	sub	r3, fp, #2064
	sub	r3, r3, #12
	sub	r3, r3, #12
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	bl	tableofpowers
	sub	r3, fp, #2064
	sub	r3, r3, #12
	sub	r3, r3, #12
	mov	r0, r3
	ldr	r1, [fp, #-32]
	ldr	r2, [fp, #-28]
	bl	crypt
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-16]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
