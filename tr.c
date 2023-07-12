#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

char* replace(char* replaced, char* replacing, char* string){
    int i;
    int j;
    for (i = 0; i < strlen(string); ++i) {
        for(j = 0; j < strlen(replaced); ++j) {
            if (replaced[j] == string[i]) {
                string[i] = replacing[j];
            }
        }
    }
    return string;
}

char* remove(char* deleted, char* string){
    int i;
    int j;
    int k;
    int len = strlen(string);
    for (i = 0; i < len; ++i) {
        for(j = 0; j < strlen(deleted); ++j) {
            if(string[i] == deleted[j]){
                for (k = i; k < len; ++k){
                    string[k] = string[k+1];
                }
                len--;
                i--;
            }
        }
    }
    return string;
}

int main(int argc, char* argv[]) {
    malloc(3 * sizeof(char*));

    int n;
    char buffer[100];
    int count = 200;

    n = read(0, buffer,  count);
    if(argc == 3){
        if(count == 0){
            exit();
        }
        if(strcmp(argv[1],"-d") == 0){
            while (n>0){
                printf(1,"%s", remove(argv[2], buffer));
                memset(buffer, 0, sizeof(buffer));
                n = read(0, buffer,  count);
                    if (n == 0){
                        exit();
                        break;
                    }
                }        
        }
        else if(strlen(argv[1]) == strlen(argv[2])){
            while (n>0){
                printf(1,"%s", replace(argv[1], argv[2], buffer)); 
                memset(buffer, 0, sizeof(buffer));
                n = read(0, buffer,  count);
                if (n == 0){
                        exit();
                        break;
                }
            }
        }
        else if(strlen(argv[1]) != strlen(argv[2])){
            printf(1,"STRING1 and STRING2 must have the same length");
            exit();
    }
    else {
            printf(1,"Wrong number of arguments");
            exit();
        }
    }
}  