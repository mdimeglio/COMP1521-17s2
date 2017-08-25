	.data
x:	.word 10
y:	.word 30

main_ret: .space 4

# int x = 10;
# int y = 30;


# $a0 - local variable z
# $s0 - x
# $s1 - y
	.text

	.globl main
main:
	
	sw  $ra, main_ret

	lw	$s0, x
	lw  $s1, y

	bge $s0, $s1, else

	add	$a0, $s0, 1000
	mul	$a0, $a0, $s1

	j	endif
else:

	add	$a0, $s1, 1000
	mul	$a0, $a0, $s0

endif:

	li $v0, 1	#syscall number for print_int
	syscall

	move	$v0, $0

	lw 	$ra, main_ret
	jr	$ra


# int main( ) {
# 	int z;
# 	if (x < y) {
# 		z = (x + 1000)*y;
# 	} else {
# 		z =  (y + 1000)*x;
# 	}
# 	putInt(z);
# 	return 0;
# }
# Discuss:
# - Draw picture of memory with text, data, stack segments and addresses, as well as the registers.
# - Explain what registers are/main memory and their relationship. Computers can only operate on data stored in registers, we need main memory because not all of our program’s data can fit in registers at once (usually).
# - Explain what directives and labels are in our assembly code.
# - Explain how the assembly instructions in the text segment get compiled to machine code - a sequence of 32bit numbers which encode which instruction is to run, which registers it acts on, and any immediate values to be used - which are loaded into the text segment when the program runs.
# - Explain how we can allocate space for global variables in the data segment using the directives .byte, .word, .space and show picture corresponding to the program above.
# - Explain how to read the instruction summary - R_d is destination, R_s and R_t are the first and second operands.
# - Explain addressing modes - using label + immediate, using indirect from register + immediate. Note the la, lw, lb, sw, sb, li instructions. Explain that some instructions, such as la are pseudo instructions - and show what it becomes in Qtspim. Explain why this is the case.
# - Explain how to use labels, branch conditions to achieve control flow.
# - Explain how a system call works - registers a0-a4 for arguments, v0 for sys call number, result returned in v0. 
