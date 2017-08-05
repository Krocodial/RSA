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
	.file	"rsalookup.c"
	.comm	lookup,40700,4
	.comm	lookupdec,40700,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"w\000"
	.align	2
.LC1:
	.ascii	"encrypted.enc\000"
	.text
	.align	2
	.global	encrypt
	.syntax unified
	.arm
	.type	encrypt, %function
encrypt:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	ldr	r1, .L4
	ldr	r0, .L4+4
	bl	fopen
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-24]
	bl	fgetc
	mov	r3, r0
	str	r3, [fp, #-12]
	b	.L2
.L3:
	ldr	r2, .L4+8
	ldr	r3, [fp, #-12]
	ldr	r3, [r2, r3, lsl #2]
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
.L2:
	ldr	r3, [fp, #-12]
	cmn	r3, #1
	bne	.L3
	ldr	r0, [fp, #-24]
	bl	fclose
	ldr	r0, [fp, #-8]
	bl	fclose
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L5:
	.align	2
.L4:
	.word	.LC0
	.word	.LC1
	.word	lookup
	.size	encrypt, .-encrypt
	.section	.rodata
	.align	2
.LC2:
	.ascii	"r\000"
	.align	2
.LC3:
	.ascii	"plaintext.txt\000"
	.text
	.align	2
	.global	decrypt
	.syntax unified
	.arm
	.type	decrypt, %function
decrypt:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	ldr	r1, .L9
	ldr	r0, .L9+4
	bl	fopen
	str	r0, [fp, #-20]
	ldr	r1, .L9+8
	ldr	r0, .L9+12
	bl	fopen
	str	r0, [fp, #-16]
	ldr	r0, [fp, #-20]
	bl	fgetc
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L7
.L8:
	ldr	r0, [fp, #-20]
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
	ldr	r2, .L9+16
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]
	ldr	r1, [fp, #-16]
	mov	r0, r3
	bl	fputc
	ldr	r0, [fp, #-20]
	bl	fgetc
	mov	r3, r0
	str	r3, [fp, #-24]
.L7:
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	bne	.L8
	ldr	r0, [fp, #-20]
	bl	fclose
	ldr	r0, [fp, #-16]
	bl	fclose
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L10:
	.align	2
.L9:
	.word	.LC2
	.word	.LC1
	.word	.LC0
	.word	.LC3
	.word	lookupdec
	.size	decrypt, .-decrypt
	.section	.rodata
	.align	2
.LC4:
	.ascii	"rb\000"
	.align	2
.LC5:
	.ascii	"lookup.txt\000"
	.align	2
.LC6:
	.ascii	"lookup table not found\000"
	.align	2
.LC7:
	.ascii	"%d\000"
	.align	2
.LC8:
	.ascii	"lookupdec.txt\000"
	.align	2
.LC9:
	.ascii	"decryption lookup table not found\000"
	.align	2
.LC10:
	.ascii	"file.txt\000"
	.align	2
.LC11:
	.ascii	"file.txt not found\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r1, .L20
	ldr	r0, .L20+4
	bl	fopen
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L12
	ldr	r0, .L20+8
	bl	puts
	mov	r3, #1
	b	.L13
.L12:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L14
.L15:
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r2, .L20+12
	add	r3, r3, r2
	mov	r2, r3
	ldr	r1, .L20+16
	ldr	r0, [fp, #-16]
	bl	__isoc99_fscanf
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L14:
	ldr	r3, [fp, #-20]
	ldr	r2, .L20+20
	cmp	r3, r2
	ble	.L15
	ldr	r1, .L20+24
	ldr	r0, .L20+28
	bl	fopen
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L16
	ldr	r0, .L20+32
	bl	puts
	mov	r3, #1
	b	.L13
.L16:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L17
.L18:
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r2, .L20+36
	add	r3, r3, r2
	mov	r2, r3
	ldr	r1, .L20+16
	ldr	r0, [fp, #-12]
	bl	__isoc99_fscanf
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L17:
	ldr	r3, [fp, #-20]
	ldr	r2, .L20+20
	cmp	r3, r2
	ble	.L18
	ldr	r1, .L20+24
	ldr	r0, .L20+40
	bl	fopen
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L19
	ldr	r0, .L20+44
	bl	printf
	mov	r3, #1
	b	.L13
.L19:
	ldr	r0, [fp, #-8]
	bl	encrypt
	bl	decrypt
	mov	r3, #0
.L13:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L21:
	.align	2
.L20:
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	lookup
	.word	.LC7
	.word	10174
	.word	.LC2
	.word	.LC8
	.word	.LC9
	.word	lookupdec
	.word	.LC10
	.word	.LC11
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",%progbits
