	.data
A:	.word 126
B:	.word 250
C:	.word 0
ONE:	.word 1
SIXTEEN:	.word 16
	.text
main:	lw $t0, ONE
	add $t1, $0, $t0 # $t1 = DigitSelector
	lw $t3, SIXTEEN
	or $t4, $0, $0 # i
	lw $t5, C # $t5 = result
	lw $t6, A # $t6 = multiplier
	lw $t7, B # $t7 = multiplicand
loop:	beq $t3, $t4, loopend
	add $t4, $t4, $t0
	# judge whether least significant bit is zero
	and $t2, $t6, $t1
	add $t1, $t1, $t1 # shift digit
	beq $t2, $0, adder
	add $t5, $t5, $t7 # if lst is not zero, add multiplicand to result 
adder:
	add $t7, $t7, $t7 # shift multiplicand
	j loop
loopend:
exit:	j exit
		
