        .data
A:      .word 19
        .word 75
        .word 10
        .word 15
S:      .word 0
        .text
main:   or   $t0, $0, $0   # 和を 0 に初期化
        la   $t1, A        # Aのアドレスを $t1 に入れる。実際は ori 命令に置き換わる。

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
