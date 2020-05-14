
        .data
A:      .word 58     # A[0] = 58
        .word 41     # A[1] = 41
        .word 22
        .word 20
        .word 19
        .word 45
        .word 54
        .word 87    # A[7] = 87
ADDRESS_A:  .word 20480   # 0x00005000
N:      .word 8    # The length of Array
S:      .word 0
# define consts if needed
ONE:	.word 1
FOUR:	.word 4

        .text
main:	or	$t0, $0, $0 # i
	lw	$t1, N
	lw	$t2, ONE
	or	$t3, $0, $0 # s
	lw	$t4, ADDRESS_A
	lw	$t5, FOUR

loop:	# check i != n and increment
	beq	$t0, $t1, loopend
	add	$t0, $t0, $t2
	# load value and foward pointer
	lw	$t6, 0($t4)
	add	$t4, $t4, $t5
	# sum
	add	$t3, $t3, $t6
	j	loop

loopend:	sw	$t3, S

exit:	j	exit
