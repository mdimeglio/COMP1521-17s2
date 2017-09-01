   .data
array:
   .word  1, 4, 3, 100, 5, 8, 9, 2, 8, 6
size:
   .word 10
	.text

	.globl main
main:
	# prologue
	addi	$sp, $sp, -4
	sw		$fp, ($sp)
	move	$fp, $sp

	addi	$sp, $sp, -4
	sw		$ra, ($sp)

	la   $a0, array
   	lw   $a1, size
   	jal  max

   	move	$a0, $v0
   	li		$v0, 1
   	syscall

	#epilogue
	lw		$ra, ($sp)	
	addi	$sp, $sp, 4
	
	lw		$fp, ($sp)
	addi	$sp, $sp, 4
	
	jr $ra


# int max(int vec[], int len)
# $v0 - big
# $a0 - vec
# $a1 - len
# $s0 - i

max:
	#prologue
	addi 	$sp, $sp, -4
	sw		$fp, ($sp)
	move 	$fp, $sp

	addi 	$sp, $sp, -8
	sw		$ra, -4($fp)
	sw		$s0, -8($fp)

	#body
	lw		$v0, ($a0)
	li 		$s0, 1
for:
	bge		$s0, $a1, endfor

	#for body
	mul		$t0, $s0, 4
	add		$t0, $t0, $a0
	lw		$t1, ($t0)

if:
	bge		$v0, $t1, endif

	#if body
	move	$v0, $t1

endif:

	addi 	$s0, $s0, 1
	j		for
endfor:


	#epilogue
	lw		$ra, -4($fp)
	lw		$s0, -8($fp)
	move	$sp, $fp
	lw		$fp, ($sp)
	addi	$sp, $sp, 4

	jr		$ra

