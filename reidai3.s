         .data
n:       .word 9
s:       .word 0
ONE:     .word 1
         .text
main:    or   $t0, $0, $0       # i = 0
         lw   $t1, n            # nの値をロード
         lw   $t2, ONE          # 定数1をロード
         or   $t3, $0, $0       # 和を格納するt3の初期化

loop:    beq  $t0, $t1, loopend  # i == n なら loopend へ
         add  $t0, $t0, $t2      # i++
         add  $t3, $t3, $t0      # s += i
         j    loop

loopend: sw   $t3, s           # $t3の値をsにストア

exit:    j    exit

