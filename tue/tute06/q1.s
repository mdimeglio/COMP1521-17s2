	.data
x:	.word 2
y:	.word 1
z:	.word 3

	.text

	.globl main
main:
	# prologue
	addi	$sp, $sp, -4
	sw		$fp, ($sp)
	move	$fp, $sp

	addi	$sp, $sp, -4
	sw		$ra, ($sp)

	# $a0 = ((x*x + y*y) - x*y) * z
	lw		$t0, x
	lw		$t1, y
	mul		$v0, $t0, $t0
	mul		$t2, $t1, $t1
	add		$v0, $v0, $t2
	mul		$t2, $t0, $t1
	sub		$v0, $v0, $t2

	lw		$t0, z
	mul		$a0, $v0, $t0

	li		$v0, 1
	syscall

	li $v0, 0

	#epilogue
	lw		$ra, ($sp)	
	addi	$sp, $sp, 4
	
	lw		$fp, ($sp)
	addi	$sp, $sp, 4
	
	jr $ra