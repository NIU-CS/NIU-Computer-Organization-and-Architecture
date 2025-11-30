#################################################
# Q1: MIPS If-Then-Else
# int f, g=1, h=2, i=0, j=0;
# if (i == j) f = g + h; else f = g - h;
#################################################

    .text               # code section
    .globl main         # declare main label as global

main:
    addi $s0, $zero, 0  # $s0 = 0
    addi $s1, $zero, 1  # $s1 = 1
    addi $s2, $zero, 2  # $s2 = 2
    addi $s3, $zero, 0  # $s3 = 0
    addi $s4, $zero, 0  # $s4 = 0
    bne $s3, $s4, Else  # go to Else if i != j
    add $s0, $s1, $s2   # f = g + h (skipped if i != j)
    j Exit

Else:
    sub $s0, $s1, $s2   # f = g - h (skipped if i = j)

Exit:
    li $v0, 10          # system call code 10
    syscall
