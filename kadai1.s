	.data
A:	.word 216
B:	.word 34
C:	.word 153
S:	.word 0
FF:	.word 2020

	.text
main:	lw	$t0, A
	lw	$t1, B
	lw	$t2, C
	lw	$t3, FF
	sub	$t4, $t0, $t1
	add	$t5, $t4, $t2
	or	$t6, $t5, $t3
	sw	$t6, S
exit:	j	exit
