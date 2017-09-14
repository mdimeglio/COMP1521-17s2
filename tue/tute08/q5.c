#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

struct X {
	int n;
	char c;
};

int addStruct(char *fileName, struct X data);

int main() {
	struct X a = {0x32333435, 'A'};
	struct X b = {0x61626364, 'B'};
	if (addStruct("structs.txt", a) < 0) {
		perror("Couldn't write struct a");
		return EXIT_FAILURE;
	}
	if(addStruct("structs.txt", b) < 0) {
		perror("Couldn't write struct b");
		return EXIT_FAILURE;
	}
	return EXIT_SUCCESS;
}

int addStruct(char *fileName, struct X data)
{
   int fd = open(fileName, O_CREAT|O_APPEND|O_WRONLY);
   if (fd < 0) return -1;

   int nw = write(fd, &data, sizeof(struct X));
   int status = (nw != sizeof(struct X)) ? -1 : 1;
   close(fd);

   return status;
}