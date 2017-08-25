	.data
x: .space 8
y: .space 4

	.text
	.globl main
main:
	sub $sp, $sp, 4
	sw	$ra, ($sp)


	li	$v0, 5
	syscall

	sw	$v0, y

	lw	 $t0, y
	addi $t0, $t0, 2000

	lw  $t1, y
	addi $t1, $t1, 3000

	mult $t0, $t1

	mfhi $t3
	sw 	 $t3, x

	mflo $t3
	sw   $t3, x + 4


	lw  $ra, ($sp)
	add $sp, $sp, 4

	jr	$ra