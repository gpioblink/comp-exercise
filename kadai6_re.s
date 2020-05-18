	.data
A:	.word 1
	.word 2
	.word 6
	.word 0
	.word 2
	.word 5
	.word 0
N:	.word 7

	.text
main:	lui $sp, 32767
	ori $sp, $sp, 61436
	addi $s0, $0, 2
	addi $s1, $0, 0
	addi $s2, $0, 2
	addi $s3, $0, 0
	la $a0, A
	lw $a1, N
	jal sort
	j exit
	

sort:    addi $sp, $sp, -20
         sw $ra, 16($sp)    #スタック上に$raを退避
         sw $s3, 12($sp)    #スタック上に$s3を退避
         sw $s2, 8($sp)     #スタック上に$s2を退避
         sw $s1, 4($sp)     #スタック上に$s1を退避
         sw $s0, 0($sp)     #スタック上に$s0を退避

         or $s2,$a0,$0      #$a0を$s2に退避
         or $s3,$a1,$0      #$a1を$s3に退避
         or $s0,$0,$0       # i = 0

for1tst: slt $t0,$s0,$s3     # $t0 = (i < n) 1:0
         beq $t0,$0,exit1    # if $t0 == 0 then exit1

         addi $s1, $s0, -1   # j = i -1

for2tst: slti $t0, $s1, 0    # $t0 = (i < 0) 1:0
         beq $t0, $0, cont   #bne $t0, $0, exit2 変更点2
         j exit2

cont:    or $t1, $s1, $0     # $t1 = i * 4
         add $t1, $t1, $t1   #変更点3
         add $t1, $t1, $t1

         add $t2, $s2, $t1   # $t2 = &(A[i])
         lw $t3, 0($t2)      # $t3 = A[i]
         lw $t4, 4($t2)      # $t4 = A[i+4]

         slt $t0, $t3, $t4   # $t0 = (A[i]
         beq $t0, $0, exit2  # if $t0 == 0 then exit2
         or $a0, $s2, $0     # $a0 = $s2(&A)
         or $a1, $s1, $0     # $a1 = $s1(j)
         jal swap

         addi $s1, $s1, -1   # j = j - 1
         j for2tst

exit2:   addi $s0, $s0, 1    # i = i + 1
         j for1tst

exit1:   lw $s0, 0($sp)      #スタックから$s0を復元
         lw $s1, 4($sp)      #スタックから$s1を復元
         lw $s2, 8($sp)      #スタックから$s2を復元
         lw $s3, 12($sp)     #スタックから$s3を復元
         lw $ra, 16($sp)     #スタックから$raを復元
         addi $sp, $sp, 20  
         jr $ra              #呼出し元のルーチンに戻る

swap:    add $t1, $a1, $0   #変更点1
         add $t1, $t1, $t1
         add $t1, $t1, $t1
         add $t1, $a0, $t1
         lw $t0, 0($t1)
         lw $t2, 4($t1)
         sw $t2, 0($t1)
         sw $t0, 4($t1)
         jr $ra
