            .data
A:          .word 123
            .word 234
            .word 345
            .word 456
ADDRESS_A:  .word 20480   #00005000の10進表現
S:          .word 0
            .text
main:   or   $t0, $0, $0   # 和を 0 に初期化
        lw   $t1, ADDRESS_A        # Aのアドレスを $t1 に入れる。

        lw   $t2, 0($t1)
        add  $t0, $t0, $t2 

        lw   $t2, 4($t1)
        add  $t0, $t0, $t2

        lw   $t2, 8($t1)
        add  $t0, $t0, $t2

        lw   $t2, 12($t1)
        add  $t0, $t0, $t2

        sw   $t0, S
exit:   j exit

