.data
arr: .word 3, 1, 2, 5, 6
num: .word 5
.text
.globl main
main:

	la  $a0,arr	#a0放陣列
	lw   $a1,num	#a1放長度5

	addi $sp,$sp,-20	#設定堆疊 排序
	sw   $ra,16($sp)	#ra s3 s2 s1 s0保存進堆疊
	sw   $s3,12($sp)
	sw   $s2,8($sp)
	sw   $s1,4($sp)
	sw   $s0,0($sp)
	move $s2,$a0    #搬移參數 
	move $s3,$a1
	move $s0,$0

	li $v0, 10               
    	syscall    
	
for1tst:
	slt  $t0,$s0,$s3	#判斷外部迴圈
	beq  $t0,$zero,exit1
	addi $s1,$s0,-1
for2tst:	
	slti $t0,$s1,0 		#內部迴圈
	bne  $t0,$s1,exit2
	sll  $t1,$s1,2
	add  $t2,$s2,$t1
	lw   $t3,0($t2)
	lw   $t4,4($t2)
	slt  $t0,$t4,$t3
	beq  $t0,$zero,exit2
	
	move $a0,$s2
	move $a1,$s1
	jal swap
	
	addi $s1,$s1,-1
	j for2


exit2:
	addi $s0,$s0,1
	j for2

exit1:
	lw   $ra,16($sp)
	lw   $s3,12($sp)
	lw   $s2,8($sp)
	lw   $s1,4($sp)
	lw   $s0,0($sp)
	addi $sp,$sp,20
	jr   $ra


swap: 
	sll $t1,$a1,2 #$t1=k*4
	add $t1,$t1,$a1 #$t1=v+(k*4)
	lw  $t0,0($t1)  #$t0(temp)=v[k]
	lw  $t2,4($t1)	#$t2=v[k+1]
	sw  $t0,4($t1)  #v[k]=t2
	sw  $t2,0($t1)	#v[k+1]=t0
	jr  $ra