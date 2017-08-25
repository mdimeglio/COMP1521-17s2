	.data

aa:	.word 0x42
bb:	.word 0x666
cc:	.word 1
	.word 3
	.word 5
	.word 7


	.text
	.globl main

main:
	# allocate frame on stack for used registers and local variables
	sub		$sp, $sp, 4
	# save the $ra register to the stack
	sw		$ra, 0($sp)

	
	la 		$t0, aa 	# a.

	lw 		$t0, bb 	# b.

	lb 		$t0, bb 	# c.

	lw 		$t0, aa + 4 # d.

	la 		$t1, cc		# e.
	lw 		$t0, ($t1)

	la 		$t1, cc		# f.
	lw 		$t0, 8($t1)

	li 		$t1, 8		# g.
	lw 		$t0, cc($t1)

	la 		$t1, cc		# h.
	lw 		$t0, 2($t1)

	# restore the $ra register from the stack
	lw		$ra, 0($sp)
	# deallocate main's function frame
	add		$sp, $sp, 4

	# main function end
	jr		$ra