# struct node n1 = {5, NULL};
# struct node n2 = {6, &n1};
# stuct node *l = &n2;

	.data
n1: .word 5 .word 0
n2: .word 6 .word n1
l: .word n2

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

# struct node *insertNode(struct node *l, int n) {
# 	struct node *new = malloc(sizeof (struct node))
# 	new->data = n;
# 	new->next = l;
# 	return new;
# }


# int main() {
# 	struct node nodes[10];

# 	nodes[0].data = 3;
# 	nodes[0].next = &nodes[1];


# 	nodes[1].data = 5;
# 	nodes[1].next = NULL;
# }