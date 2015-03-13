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
	push {r3, r4, r5, r6, lr}

	add r4,r0,#1
	
	ldr r5,=-1
	ldr r6,=1
	
.ITER:	
	add r0,r5,r6
	mov r5,r6
	mov r6,r0

	subs r4,r4,#1
	bne .ITER@檢查z flag=0
	pop {r3, r4, r5, r6, pc}		@EPILOG

	@ END CODE MODIFICATION
	.size fibonacci, .-fibonacci
	.end
