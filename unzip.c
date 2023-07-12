#include "types.h"
#include "user.h"
#include "fcntl.h"

int hextodecnum (char *str){
  uint ret = 0;
  while(*str){
    uint ch = *str++;
    if(ch >= '0' && ch <= '9'){
      ch = ch - '0';
    }
    else if (ch >= 'A' && ch <= 'F'){
      ch = ch - 'A' + 10;
    }
    ret = (ret << 4) | (ch & 0xF);
  }
  return ret;
}

char buffer[1];

void decode(int fd){
  int mode = 0;
  char charstr[] = "00";
  int chr;
  char countstr[] = "0000";
  int count;
  int i = 0;
  int n;
  while((n = read(fd, buffer, 1)) > 0){
    if(buffer[0] != ' '){
      if(mode == 0 && i < 4){
        countstr[0] = countstr[1];
        countstr[1] = countstr[2];
        countstr[2] = countstr[3];
        countstr[3] = buffer[0];
      }
      else if(mode == 1 && i < 2){
        charstr[0] = charstr[1];
        charstr[1] = buffer[0];
      }
      i++;
    }
    else{
      i = 0;
      if(mode == 0){
        count = hextodecnum(countstr);
        countstr[0] = '0';
        countstr[1] = '0';
        countstr[2] = '0';
        countstr[3] = '0';
        mode = 1;
      }
      else if(mode == 1){
        chr = hextodecnum(charstr);
        charstr[0] = '0';
        charstr[1] = '0';
        for(int j = 0; j < count; j++){
          printf(1, "%c", chr);
        }
        mode = 0;
      }
    }
  }
  printf(1, "\n");
  exit();
}

int
main(int argc, char *argv[]){
  if(argc < 2){
    printf(1, "unzip: not enough arguments\n");
    exit();
  }

  if(argc > 2){
    printf(1, "unzip: too many arguments\n");
    exit();
  }

  int fd;
  if((fd = open(argv[1], 0)) < 0){
    printf(1, "unzip: cannot open %s\n", argv[1]);
    exit();
  }
  else{
    decode(fd);
    close(fd);
  }
  exit();
}