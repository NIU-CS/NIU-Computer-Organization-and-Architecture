#################################################
# Q2: MIPS While Loop
#
# while (save[i] == k)
#    i += 1;
#################################################

.data
save:   .word 7, 7, 7, 8, 9 # array save data (assuming save[0]=7, save[1]=7, ...)

    .text
    .globl main

main:
    addi $s3, $zero, 0    # i = 0 (starting from index 0)
    addi $s5, $zero, 7    # k = 7 (set the value to find as 7)

    la   $s6, save        # $s6 = load base address of array save (memory address)

Loop:
    sll  $t1, $s3, 2      # Temp reg $t1 = i * 4
    add  $t1, $t1, $s6    # $t1 = address of save[i]
    lw   $t0, 0($t1)      # Temp reg $t0 = save[i]
    bne  $t0, $s5, Exit   # go to Exit if save[i] != k
    addi $s3, $s3, 1      # i = i + 1
    j Loop                # go to Loop

Exit:
    li   $v0, 10          # system call code 10 (Exit)
    syscall