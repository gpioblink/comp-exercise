
        .data
A:      .word 987
        .word 876
        .word 765
        .word 654
        .word 543
N:      .word 3

        .text
main:    la $a0, A
         lw $a1, N
         jal swap
exit:    j exit

swap:    add $t1, $a1, $0   #変更点1
         add $t1, $t1, $t1
         add $t1, $t1, $t1
         add $t1, $a0, $t1
         lw $t0, 0($t1)
         lw $t2, 4($t1)
         sw $t2, 0($t1)
         sw $t0, 4($t1)
         jr $ra
