#include <assert.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>


int main(void) {
	int status;
	pid_t pid;

	/* Cat test */
	/*int fd = open("file.txt", O_WRONLY|O_TRUNC|O_CREAT);
	write(fd, "file contents\n", 14);
	close(fd);*/

	pid = fork();
	if (pid == -1) {
		perror("PARENT: fork failed");
		//printf("Fork failed %s\n", strerror(errno));
		return EXIT_FAILURE;
	} else if (pid == 0) {
		/* in child */
		char *argv[3] = {"/bin/cat", "file.txt", NULL};
		printf("CHILD: will execve cat\n");
    	execv("/bin/catmhjemhjgfGjherg", argv);
    	
    	/*execv returns only if fails*/
    	perror("CHILD: couldn't execve cat");
    	return EXIT_FAILURE;
	} else {
		//parent 
		printf("PARENT: child pid is %d\n", pid);
		
		pid = waitpid(pid, &status, 0);
		if (pid == -1) {
			perror("PARENT: waitpid failed");
			return EXIT_FAILURE;
		} else if (WIFEXITED(status)) {
			printf("PARENT: child exited with status %d\n", WEXITSTATUS(status));
		} else if (WIFSIGNALED(status)) {
			printf("PARENT: child was signalled with number %d\n", WTERMSIG(status));
		}
	}


    
    return EXIT_SUCCESS;
}
