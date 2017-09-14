

	.data
list:  .word node1
node1: .word 6, node2
node2: .word 4, node3
node3: .word 100, node4
node4: .word 2, 0

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

	lw		$a0, list
	jal		max

	move	$a0, $v0
	li		$v0, 1
	syscall

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


max:
   # prologue
   addi $sp, $sp, -4
   sw   $fp, ($sp)
   la   $fp, ($sp)
   addi $sp, $sp, -4
   sw   $ra, ($sp)
   
   # body
   #  if (list == NULL) return -1;
   #  int max = list->value;
   #  Node *curr = list;
   #  while (curr != NULL) {
   #     if (curr->value > max) max = curr->value;
   #     curr = curr->next;
   #  }
   #  return max;

   # $v0 - max
   # $a0 - curr

   bne	$a0, 0, endif
   li	$v0, -1
   j 	epilogue
endif:

	lw	$v0, ($a0)

while:
	beq	$a0, 0, endwhile

	lw	$t1, ($a0)
	bge	$v0, $t1, endif2
	move	$v0, $t1

endif2:
	lw	$a0, 4($a0)
	j  	while
endwhile:


   # epilogue
epilogue:
   lw   $ra, ($sp)
   addi $sp, $sp, 4
   lw   $fp, ($sp)
   addi $sp, $sp, 4
   jr   $ra
