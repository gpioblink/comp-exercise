	.data
A:	.word 12
	.word 34
	.word 56
	.word 78
	.word 90
	.word 20
	.word 20
ADDRESS_A:	.word 20480
N:	.word 7
B:	.space 28
ADDRESS_B:	.word 20516
ONE:	.word 1
FOUR:	.word 4

	.text
main:	or	$t0, $0, $0 # i
	lw	$t1, N
	lw	$t2, ONE
	lw	$t3, ADDRESS_A
	lw	$t4, FOUR
	lw	$t5, ADDRESS_B

loop:	# check i != n and increment
	beq	$t0, $t1, exit
	add	$t0, $t0, $t2
	# load value and forward pointer a
	lw	$t6, 0($t3)
	add	$t3, $t3, $t4
	# store value and forward pointer b
	sw	$t6, 0($t5)
	add	$t5, $t5, $t4
	j	loop
loopend:	j	exit
