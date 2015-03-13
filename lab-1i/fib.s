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

	subs r4,r0,#0 ;@ R4 = R0 - 0 (update flags)
	ble .L3 ;@ if(R0 <= 0) goto .L3 (which returns 0)

	cmp r4,#1 ;@ Compare R4 wtih 1
	beq .L4;@ If R4 == 1 goto .L4 (which returns 1)
	
	ldr r5,=0
	ldr r6,=0
	ldr r0,=1
	sub r4,r4,#1
	
.ITER:	
	mov r5,r6;
	mov r6,r0;
	add r0,r5,r6;
	
	sub r4,r4,#1;
	cmp r4,#0;
	bne .ITER;
	
	pop {r3, r4, r5, r6, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, r6, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, r6, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
