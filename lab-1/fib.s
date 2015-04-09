	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r4, r5, lr}

	subs r4,r0,#1
	it le;@ If R4 <= 1 
	pople {r4,r5,pc}

	mov r0,r4; @ R0 = R4
	bl fibonacci ;@ Recursive call to fibonacci with R4 as parameter

	mov r5,r0 ;@ R5 = R0
	sub r0,r4,#1; @ R0 = R4 - 
	bl fibonacci;@ Recursive call to fibonacci with R4 -1 as parameter

	adds r0,r5,r0; @ R0 = R5 + R0 (update flags)

	pop {r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
	.size fibonacci, .-fibonacci
	.end
