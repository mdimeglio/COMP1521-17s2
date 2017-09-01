	.data



	.text

	.globl main
main:
	# prologue
	addi	$sp, $sp, -4
	sw		$fp, ($sp)
	move	$fp, $sp

	addi	$sp, $sp, -4
	sw		$ra, ($sp)



	li $v0, 0

	#epilogue
	lw		$ra, ($sp)	
	addi	$sp, $sp, 4
	
	lw		$fp, ($sp)
	addi	$sp, $sp, 4
	
	jr $ra