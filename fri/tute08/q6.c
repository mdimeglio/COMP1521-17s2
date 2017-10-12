#include <stdio.h>
#include <unistd.h> //O_RDONLY
#include <stdlib.h>
#include <string.h> //strerror
//#include <err.h>
#include <fcntl.h>
#include <errno.h> //errno


typedef struct _graphics {
   int   x;  // x coordinate
   int   y;  // y coordinate
   char  r;  // red level
   char  g;  // green level
   char  b;  // blue level
} Graphics;

void display(int device, Graphics item);

int main(void)
{
   int pic = open("Picture", O_RDONLY);
   if (pic < 0) {
   	  fprintf(stderr, "No picture. %s\n", strerror(errno));
   }

   int dev = open("/dev/display", O_WRONLY);
   if (dev < 0) {
   	  perror("No display.");
   }
 
   Graphics point;
   size_t gsize = sizeof(Graphics);
   while (read(pic, &point, gsize) == gsize) {
      display(dev, point);
   }
 
  close(pic);
  close(dev);
  return 0;
}

void display(int device, Graphics item) {

}