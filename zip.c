#include "types.h"
#include "user.h"
#include "fcntl.h"

char buffer[1];

void encode(int fd){
  char curr = buffer[0];
  int run = 0;
  int count = 1;
  int n;

  while((n = read(fd, buffer, 1)) > 0){
    if(run == 0){
      curr = buffer[0];
      run = 1;
    }
    else{
      if(curr == buffer[0]){
        count++;
      }
      else{
        printf(1, "%x %x ", count, curr);
        curr = buffer[0];
        count = 1;
      }
    }
  }

  printf(1, "%x %x %x\n", count, curr, '\n');

  if(n < 0){
    printf(1, "zip: file read error\n");
    exit();
  }
  exit();
}

int main(int argc, char *argv[]){
  if(argc < 2){
    printf(1, "zip: not enough arguments\n");
    exit();
  }
  if(argc > 2){
    printf(1, "zip: too many arguments\n");
    exit();
  }

  int fd;
  if((fd = open(argv[1], 0)) < 0){
    printf(1, "zip: cannot open %s\n", argv[1]);
    exit();
  }
  else{
      encode(fd);
      close(fd);
  }
  exit();
}