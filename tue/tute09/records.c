
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>


struct X {
	char name[20];
	int value;
};

int update(int fd, int k, struct X new)
{
   off_t pos = k*sizeof(struct X);
   size_t nbytes = sizeof(struct X);
   if (lseek(fd, pos, SEEK_SET) != pos) return -1;
   if (write(fd, &new, nbytes) != nbytes) return -1;
   return 0;
}

int load(int fd, int k, struct X *ret)
{
   off_t pos = k*sizeof(struct X);
   size_t nbytes = sizeof(struct X);
   if (lseek(fd, pos, SEEK_SET) != pos) return -1;
   if (read(fd, ret, nbytes) != nbytes) return -1;
   return 0;
}

void printStruct(struct X s) {
	printf("[name: %s, value: %d]\n", s.name, s.value);
}


int main(int argc, char *argv[]) {
	if (argc != 2) {
		fprintf(stderr, "Usage: %s <filename>", argv[0]);
		return EXIT_FAILURE;
	}

	int fd = open(argv[1], O_RDWR|O_CREAT);
	if (fd < 0) {
		perror("Couldn't open file");
		return EXIT_FAILURE;
	}

	while (1) {
		int rec_num;
		
		printf("Record number:");
		if (scanf("%d", &rec_num) != 1) break;

		printf("Record %d: ", rec_num);
		struct X rec;
		if (load(fd, rec_num, &rec)) {
			printf("Couldn't read or doesn't exist.\n");
		}

		printStruct(rec);

		printf("Update? (Y|N)");
		char c;
		if (scanf("%c", &c) != 1) break;

		if (c == 'Y') {
			printf("Enter name:");
			fgets(rec.name, 20, stdin);

			printf("Enter number");
			scanf("%d", &rec.value);

			if (update(fd, rec_num, rec)) {
				perror("Couldn't update record");
				return EXIT_FAILURE;
			}
		}
	}



	return EXIT_SUCCESS;
}