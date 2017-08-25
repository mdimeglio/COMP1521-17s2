#include <stdio.h>

int main() {
	short a = 0x703C;
	short b = 0x8FC1; //0x703F
	short c = a + b;
	printf("%d\n", c);
	return 0;
}