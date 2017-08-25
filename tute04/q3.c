#include <stdio.h>
/*
int main() {
	int x = 0x12345678;
	char y = 'a';
	char *p = &y + 1;

	printf("x: %p, y: %p\n", &x, &y);
	printf("*p: %x\n", *p);
}*/


/*int main() {
	float y = 2.5;
	int x = 0x12345678;
	int *p = &x + 1;

	printf("x: %p, y: %p\n", &x, &y);
	printf("*p: %x\n", *p);
}*/



int main() {
	int x = 1<<31;
	x >>= 31;

	unsigned int y = 1u<<31;
	y >>= 31;

	printf ("x: %x, y: %x\n", x, y);
}


