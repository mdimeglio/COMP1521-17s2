	.data
main_ret: .space 4

	.text

# int main( ) {
# 	int x = getInt();
# 	int y = getInt();
# 	putInt(func(x, y));
# }
# $s0 - x
# $s1 - y
	.globl main
main:
	
	sw  $ra, main_ret

	li 		$v0, 5
	syscall
	move	$s0, $v0

	li 		$v0, 5
	syscall
	move	$s1, $v0

	move	$a0, $s0
	move	$a1, $s1
	jal		func

	move	$a0, $v0
	li 		$v0, 1		#syscall number for print_int
	syscall

	move	$v0, $0

	lw 	$ra, main_ret
	jr	$ra


# int func(int x, int y) {
# 	if (x < y) {
# 		return (x + 1000)*y;
# 	} else {
# 		return (y + 1000)*x;
# 	}
# }
# $a0 - x
# $a1 - y
# $v0 return value
func:
	bge $a0, $a1, else

	add	$v0, $a0, 1000
	mul	$v0, $v0, $a1

	j	endif
else:

	add	$v0, $a1, 1000
	mul	$v0, $v0, $a0

endif:
	jr	$ra



