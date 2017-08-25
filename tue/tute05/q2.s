	.data

# value to put in the word
a:	.word   42

# number of bytes to allocate
g:	.space  4			
c:	.asciiz "abcde"

# ensures the following bytes aligned to a 2B boundary
	.align  2
d:	.byte   1, 2, 3, 4
e:	.word   1, 2, 3, 4
f:	.space  1