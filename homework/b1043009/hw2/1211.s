main:

	addi $a0, $zero, 4 #n=a0=4
	jal fact	   #進去fact函式
	j exit		   #完成結束	
fact:

	addi $sp,$sp,-8    #預存2個位置堆疊
	sw $ra,0($sp) 	   #ra和a0
	sw $a0,4($sp)  

	slti $t0,$a0,1 	   # t0=1 看a0<1 
	beq $t0,$zero,L1   #yes=> go in L1 
	addi $v0,$zero,1   #n0 => v0=1
	addi $sp,$sp,8     
	jr $ra		  #return ra
L1:
	addi $a0,$a0,-1  #n=n-1	
	jal fact 	 #f(n-1)	
    	lw $a0, 4($sp)   
	mul $v0,$a0,$v0	 #計算n*f(n-1)
	lw $ra, 0($sp)
	addi $sp,$sp,8 

	jr $ra 

exit:

