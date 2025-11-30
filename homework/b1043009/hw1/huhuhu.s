main:
    addi $s0, $s0, 0    # Initialize $s0 (f) to 0
    addi $s1, $s1, 1    # Initialize $s1 (g) to 1
    addi $s2, $s2, 2    # Initialize $s2 (h) to 2
    addi $s3, $s3, 0    # Initialize $s3 (i) to 0
    addi $s4, $s4, 0    # Initialize $s4 (j) to 0

    bne $s3, $s4, Else  # Branch to 'Else' if i != j
    add $s0, $s1, $s2   # f = g + h
    j Exit               # Jump to 'Exit'

Else:sub $s0, $s1, $s2   # f = g - h

Exit:
    li $v0,10 #MIPS中，用 exit 的常用编號是 10
    syscall