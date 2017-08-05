	.arch armv5
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"MMM.c"
	.global	__aeabi_uidivmod
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\012\000"
	.text
	.align	2
	.global	mme
	.syntax unified
	.arm
	.type	mme, %function
mme:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	ldr	r1, [fp, #-24]
	mov	r0, r3
	bl	__aeabi_uidivmod
	mov	r3, r1
	str	r3, [fp, #-16]
	b	.L2
.L4:
	ldr	r3, [fp, #-20]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L3
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-8]
	bl	mmm
	mov	r3, r0
	str	r3, [fp, #-8]
.L3:
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	mmm
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-8]
	ldr	r0, .L6
	bl	printf
.L2:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L4
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L7:
	.align	2
.L6:
	.word	.LC0
	.size	mme, .-mme
	.align	2
	.global	mmm
	.syntax unified
	.arm
	.type	mmm, %function
mmm:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	ldr	r1, [fp, #-24]
	mov	r0, r3
	bl	__aeabi_uidivmod
	mov	r3, r1
	str	r3, [fp, #-16]
	b	.L9
.L11:
	ldr	r3, [fp, #-20]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L10
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r1, [fp, #-24]
	mov	r0, r3
	bl	__aeabi_uidivmod
	mov	r3, r1
	str	r3, [fp, #-8]
.L10:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	ldr	r1, [fp, #-24]
	mov	r0, r3
	bl	__aeabi_uidivmod
	mov	r3, r1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #1
	str	r3, [fp, #-20]
.L9:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L11
	ldr	r3, [fp, #-8]
	ldr	r1, [fp, #-24]
	mov	r0, r3
	bl	__aeabi_uidivmod
	mov	r3, r1
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	mmm, .-mmm
	.section	.rodata
	.align	2
.LC1:
	.ascii	"w\000"
	.align	2
.LC2:
	.ascii	"encrypted.enc\000"
	.text
	.align	2
	.global	encrypt
	.syntax unified
	.arm
	.type	encrypt, %function
encrypt:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r1, .L16
	ldr	r0, .L16+4
	bl	fopen
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-24]
	bl	fgetc
	mov	r3, r0
	str	r3, [fp, #-12]
	b	.L14
.L15:
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-28]
	ldr	r0, [fp, #-12]
	bl	mme
	mov	r3, r0
	str	r3, [fp, #-12]
	mov	r3, #0
	strb	r3, [fp, #-14]
	mov	r3, #0
	strb	r3, [fp, #-13]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r2, r3, #255
	ldrb	r3, [fp, #-14]
	orr	r3, r2, r3
	strb	r3, [fp, #-14]
	ldr	r3, [fp, #-12]
	and	r2, r3, #255
	ldrb	r3, [fp, #-13]
	orr	r3, r2, r3
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r1, [fp, #-8]
	mov	r0, r3
	bl	fputc
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	ldr	r1, [fp, #-8]
	mov	r0, r3
	bl	fputc
	ldr	r0, [fp, #-24]
	bl	fgetc
	mov	r3, r0
	str	r3, [fp, #-12]
.L14:
	ldr	r3, [fp, #-12]
	cmn	r3, #1
	bne	.L15
	ldr	r0, [fp, #-24]
	bl	fclose
	ldr	r0, [fp, #-8]
	bl	fclose
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L17:
	.align	2
.L16:
	.word	.LC1
	.word	.LC2
	.size	encrypt, .-encrypt
	.section	.rodata
	.align	2
.LC3:
	.ascii	"plaintext.txt\000"
	.align	2
.LC4:
	.ascii	"r\000"
	.text
	.align	2
	.global	decrypt
	.syntax unified
	.arm
	.type	decrypt, %function
decrypt:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r1, .L21
	ldr	r0, .L21+4
	bl	fopen
	str	r0, [fp, #-20]
	ldr	r1, .L21+8
	ldr	r0, .L21+12
	bl	fopen
	str	r0, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	fgetc
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L19
.L20:
	ldr	r0, [fp, #-16]
	bl	fgetc
	mov	r3, r0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	lsl	r2, r3, #8
	ldr	r3, [fp, #-12]
	orr	r3, r2, r3
	ldr	r2, [fp, #-8]
	orr	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-36]
	ldr	r1, [fp, #-32]
	ldr	r0, [fp, #-8]
	bl	mme
	mov	r3, r0
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	fputc
	ldr	r0, [fp, #-16]
	bl	fgetc
	mov	r3, r0
	str	r3, [fp, #-24]
.L19:
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	bne	.L20
	ldr	r0, [fp, #-16]
	bl	fclose
	ldr	r0, [fp, #-20]
	bl	fclose
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L22:
	.align	2
.L21:
	.word	.LC1
	.word	.LC3
	.word	.LC4
	.word	.LC2
	.size	decrypt, .-decrypt
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	bl	Test
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	main, .-main
	.section	.rodata
	.align	2
.LC5:
	.ascii	"test.txt\000"
	.align	2
.LC6:
	.ascii	"encryption run succesfully, find file 'encrypted.en"
	.ascii	"c'\000"
	.align	2
.LC7:
	.ascii	"decryption run succesfully, find plaintext file 'pl"
	.ascii	"aintest.txt'\000"
	.text
	.align	2
	.global	Test
	.syntax unified
	.arm
	.type	Test, %function
Test:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, #17
	str	r3, [fp, #-20]
	ldr	r3, .L26
	str	r3, [fp, #-16]
	ldr	r3, .L26+4
	str	r3, [fp, #-12]
	ldr	r1, .L26+8
	ldr	r0, .L26+12
	bl	fopen
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-12]
	mov	r1, r3
	ldr	r0, [fp, #-8]
	bl	encrypt
	ldr	r0, .L26+16
	bl	puts
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	mov	r1, r2
	mov	r0, r3
	bl	decrypt
	ldr	r0, .L26+20
	bl	puts
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L27:
	.align	2
.L26:
	.word	2753
	.word	3233
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.size	Test, .-Test
	.ident	"GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",%progbits
