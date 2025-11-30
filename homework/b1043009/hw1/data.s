.data
    i: .word 0
    k: .word 5
    save: .word 5, 5, 5, 15, 5

.text
main:
    lw $s3, i    # i = $s3
    lw $s5, k    # k= $s5
    lw $s6, save #  save = $s6

Loop:
    sll $t1, $s3, 2   #  i * 4 
    add $t1, $t1, $s6  # save[i]
    lw $t0, 0($t1)     # save[i] = $t0

    bne $t0, $s5, Exit # if save[i] != k

    addi $s3, $s3, 1   #  i++
    j Loop             # Jump back to Loop

Exit:
    li $v0, 10         
    syscall            