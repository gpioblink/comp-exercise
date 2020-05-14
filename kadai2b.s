            .data
A:          .word 123
            .word 234
            .word 345
            .word 456
ADDRESS_A:  .word 20480   #00005000の10進表現
FOUR:       .word 4   #定数4
S:          .word 0
            .text
main:   or   $t0, $0, $0   # 和を 0 に初期化
        lw   $t1, ADDRESS_A        # Aのアドレスを $t1 に入れる。
        lw   $t2, FOUR        # 定数4を $t2 に入れる。

        lw   $t3, 0($t1)
        add  $t0, $t0, $t3 
        add  $t1, $t1, $t2    # 
アドレスを次へすすめる(t2には4が入っているから)

        lw   $t3, 0($t1)
        add  $t0, $t0, $t3
        add  $t1, $t1, $t2

        lw   $t3, 0($t1)
        add  $t0, $t0, $t3
        add  $t1, $t1, $t2

        lw   $t3, 0($t1)
        add  $t0, $t0, $t3

        sw   $t0, S
exit:   j exit
