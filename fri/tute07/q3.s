	.data
nrows: .word 6
ncols: .word 12
flag:  .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
       .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
       .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
       .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
       .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
       .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'

    .text

    .globl main
main:
	#prologue
	add		$sp, $sp, -4
	sw		$fp, ($sp)
	move	$fp, $sp
	add		$sp, $sp, -24
	
	sw 		$ra, -4($fp)
	sw 		$s0, -8($fp)
	sw		$s1, -12($fp)
	sw		$s2, -16($fp)
	sw		$s3, -20($fp)
	sw		$s4, -24($fp)
	
	#body

# for (int row = 0; row < nrows; row++) {
#    for (int col = 0; col < ncols; col++)
#       printf("%c", flag[row][col]);
#    printf("\n");
# }
	# $s0 - nrows
	# $s1 - ncols
	# $s2 - row
	# $s3 - col

	lw 	$s0, nrows
	lw	$s1, ncols

	#int row = 0;
	li 	$s2, 0
for1:
	#if (row == nrows) branch to endfor1
	beq		$s2, $s0, endfor1

	#body for 1
	# int col = 0;
	li 	$s3, 0
for2:
	#if (col == ncols) branch to endfor2
	beq		$s3, $s1, endfor2

	#body for 2
	# t0 = ncols * row
	mul		$t0, $s1, $s2
	# t0 = t0 + col
	add		$t0, $t0, $s3

	# load into a0 flag(t0)
	lb		$a0, flag($t0)

	#load into v0 11 (syscall number)
	li 		$v0, 11
	syscall


	#col++;
	add		$s3, $s3, 1
	
	j		for2
endfor2:
	li		$a0, '\n'
	li		$v0, 11
	syscall
	
	#row++;
	add		$s2, $s2, 1
	j 		for1
endfor1:

	li		$v0, 0

	#epilogue
	lw 		$ra, -4($fp)
	lw 		$s0, -8($fp)
	lw		$s1, -12($fp)
	lw		$s2, -16($fp)
	lw		$s3, -20($fp)
	lw		$s4, -24($fp)

	move	$sp, $fp
	lw		$fp, ($sp)
	add		$sp, $sp, 4
	
	jr 		$ra