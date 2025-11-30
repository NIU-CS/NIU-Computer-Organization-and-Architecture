main:
	addi $s0 $s0 0 #s0
	addi $s1 $s1 0
	addi $s2 $s2 0
	addi $s3 $s3 0
	addi $s4 $s4 0

	
	bne $s3,$s4,Else #i!=j
	add $s0,$s1,$s2	 #f=g+h
	j Exit
	Else:sub $s0,$s1,$s2 #f=g-h
	Exit:     
