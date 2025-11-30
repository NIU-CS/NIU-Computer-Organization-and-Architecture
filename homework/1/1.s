.data
out_string:
    .asciiz "\nHello, World!\n"

.text
.globl main

main:
    # Print the string
    li $v0, 4              # system call code for print string
    la $a0, out_string     # load address of string to $a0
    syscall

    # Exit the program
    li $v0, 10             # system call code for exit
    syscall
