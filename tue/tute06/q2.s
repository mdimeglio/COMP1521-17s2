	.data
buf: .space 50


	.text

	.globl main
main:
	# prologue
	addi	$sp, $sp, -4
	sw		$fp, ($sp)
	move	$fp, $sp

	addi	$sp, $sp, -4
	sw		$ra, ($sp)

	# read string into buf
	li 		$v0, 8
	la		$a0, buf
	li 		$a1, 50
	syscall

	# do while loop to find first non-space character

	# body
	# $s0 - memory address up to in string
	# $s1 - current character being inspected
	la		$s0, buf
while:
	lb		$s1, ($s0)
	beq		$s1, $0, endwhile

	li		$t0, ' '
	bne		$s1, $t0, endwhile

	add		$s0, $s0, 1

	j 		while
endwhile:


	# print resulting string
	move 	$a0, $s0
	li		$v0, 4
	syscall

	# main returns EXIT_SUCCESS
	li 		$v0, 0

	#epilogue
	lw		$ra, ($sp)	
	addi	$sp, $sp, 4
	
	lw		$fp, ($sp)
	addi	$sp, $sp, 4
	
	jr $ra