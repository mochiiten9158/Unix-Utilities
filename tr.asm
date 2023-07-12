
_tr:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
        }
    }
    return string;
}

int main(int argc, char* argv[]) {
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	53                   	push   %ebx

    int n;
    char buffer[100];
    int count = 200;

    n = read(0, buffer,  count);
  14:	8d 5d 84             	lea    -0x7c(%ebp),%ebx
int main(int argc, char* argv[]) {
  17:	51                   	push   %ecx
  18:	81 ec 94 00 00 00    	sub    $0x94,%esp
  1e:	8b 39                	mov    (%ecx),%edi
  20:	8b 71 04             	mov    0x4(%ecx),%esi
    malloc(3 * sizeof(char*));
  23:	6a 0c                	push   $0xc
  25:	e8 96 08 00 00       	call   8c0 <malloc>
    n = read(0, buffer,  count);
  2a:	83 c4 0c             	add    $0xc,%esp
  2d:	68 c8 00 00 00       	push   $0xc8
  32:	53                   	push   %ebx
  33:	6a 00                	push   $0x0
  35:	e8 e1 04 00 00       	call   51b <read>
    if(argc == 3){
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	83 ff 03             	cmp    $0x3,%edi
  40:	74 0e                	je     50 <main+0x50>
    else {
            printf(1,"Wrong number of arguments");
            exit();
        }
    }
  42:	8d 65 f0             	lea    -0x10(%ebp),%esp
  45:	31 c0                	xor    %eax,%eax
  47:	59                   	pop    %ecx
  48:	5b                   	pop    %ebx
  49:	5e                   	pop    %esi
  4a:	5f                   	pop    %edi
  4b:	5d                   	pop    %ebp
  4c:	8d 61 fc             	lea    -0x4(%ecx),%esp
  4f:	c3                   	ret    
  50:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
        if(strcmp(argv[1],"-d") == 0){
  56:	50                   	push   %eax
  57:	50                   	push   %eax
  58:	68 c8 09 00 00       	push   $0x9c8
  5d:	ff 76 04             	pushl  0x4(%esi)
  60:	e8 6b 02 00 00       	call   2d0 <strcmp>
  65:	83 c4 10             	add    $0x10,%esp
  68:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
  6e:	85 c0                	test   %eax,%eax
  70:	75 51                	jne    c3 <main+0xc3>
  72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            while (n>0){
  78:	85 d2                	test   %edx,%edx
  7a:	7e c6                	jle    42 <main+0x42>
                printf(1,"%s", remove(argv[2], buffer));
  7c:	83 ec 08             	sub    $0x8,%esp
  7f:	53                   	push   %ebx
  80:	ff 76 08             	pushl  0x8(%esi)
  83:	e8 78 01 00 00       	call   200 <remove>
  88:	83 c4 0c             	add    $0xc,%esp
  8b:	50                   	push   %eax
  8c:	68 cb 09 00 00       	push   $0x9cb
  91:	6a 01                	push   $0x1
  93:	e8 c8 05 00 00       	call   660 <printf>
                memset(buffer, 0, sizeof(buffer));
  98:	83 c4 0c             	add    $0xc,%esp
  9b:	6a 64                	push   $0x64
  9d:	6a 00                	push   $0x0
  9f:	53                   	push   %ebx
  a0:	e8 bb 02 00 00       	call   360 <memset>
                n = read(0, buffer,  count);
  a5:	83 c4 0c             	add    $0xc,%esp
  a8:	68 c8 00 00 00       	push   $0xc8
  ad:	53                   	push   %ebx
  ae:	6a 00                	push   $0x0
  b0:	e8 66 04 00 00       	call   51b <read>
                    if (n == 0){
  b5:	83 c4 10             	add    $0x10,%esp
                n = read(0, buffer,  count);
  b8:	89 c2                	mov    %eax,%edx
                    if (n == 0){
  ba:	85 c0                	test   %eax,%eax
  bc:	75 ba                	jne    78 <main+0x78>
                        exit();
  be:	e8 40 04 00 00       	call   503 <exit>
        else if(strlen(argv[1]) == strlen(argv[2])){
  c3:	83 ec 0c             	sub    $0xc,%esp
  c6:	ff 76 04             	pushl  0x4(%esi)
  c9:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%ebp)
  cf:	e8 4c 02 00 00       	call   320 <strlen>
  d4:	89 c7                	mov    %eax,%edi
  d6:	58                   	pop    %eax
  d7:	ff 76 08             	pushl  0x8(%esi)
  da:	e8 41 02 00 00       	call   320 <strlen>
  df:	83 c4 10             	add    $0x10,%esp
  e2:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
  e8:	39 c7                	cmp    %eax,%edi
  ea:	75 4d                	jne    139 <main+0x139>
            while (n>0){
  ec:	85 d2                	test   %edx,%edx
  ee:	0f 8e 4e ff ff ff    	jle    42 <main+0x42>
                printf(1,"%s", replace(argv[1], argv[2], buffer)); 
  f4:	57                   	push   %edi
  f5:	53                   	push   %ebx
  f6:	ff 76 08             	pushl  0x8(%esi)
  f9:	ff 76 04             	pushl  0x4(%esi)
  fc:	e8 7f 00 00 00       	call   180 <replace>
 101:	83 c4 0c             	add    $0xc,%esp
 104:	50                   	push   %eax
 105:	68 cb 09 00 00       	push   $0x9cb
 10a:	6a 01                	push   $0x1
 10c:	e8 4f 05 00 00       	call   660 <printf>
                memset(buffer, 0, sizeof(buffer));
 111:	83 c4 0c             	add    $0xc,%esp
 114:	6a 64                	push   $0x64
 116:	6a 00                	push   $0x0
 118:	53                   	push   %ebx
 119:	e8 42 02 00 00       	call   360 <memset>
                n = read(0, buffer,  count);
 11e:	83 c4 0c             	add    $0xc,%esp
 121:	68 c8 00 00 00       	push   $0xc8
 126:	53                   	push   %ebx
 127:	6a 00                	push   $0x0
 129:	e8 ed 03 00 00       	call   51b <read>
                if (n == 0){
 12e:	83 c4 10             	add    $0x10,%esp
                n = read(0, buffer,  count);
 131:	89 c2                	mov    %eax,%edx
                if (n == 0){
 133:	85 c0                	test   %eax,%eax
 135:	75 b5                	jne    ec <main+0xec>
 137:	eb 85                	jmp    be <main+0xbe>
        else if(strlen(argv[1]) != strlen(argv[2])){
 139:	83 ec 0c             	sub    $0xc,%esp
 13c:	ff 76 04             	pushl  0x4(%esi)
 13f:	e8 dc 01 00 00       	call   320 <strlen>
 144:	59                   	pop    %ecx
 145:	ff 76 08             	pushl  0x8(%esi)
 148:	89 c3                	mov    %eax,%ebx
 14a:	e8 d1 01 00 00       	call   320 <strlen>
 14f:	83 c4 10             	add    $0x10,%esp
 152:	39 c3                	cmp    %eax,%ebx
 154:	74 13                	je     169 <main+0x169>
            printf(1,"STRING1 and STRING2 must have the same length");
 156:	52                   	push   %edx
 157:	52                   	push   %edx
 158:	68 e8 09 00 00       	push   $0x9e8
 15d:	6a 01                	push   $0x1
 15f:	e8 fc 04 00 00       	call   660 <printf>
            exit();
 164:	e8 9a 03 00 00       	call   503 <exit>
            printf(1,"Wrong number of arguments");
 169:	50                   	push   %eax
 16a:	50                   	push   %eax
 16b:	68 ce 09 00 00       	push   $0x9ce
 170:	6a 01                	push   $0x1
 172:	e8 e9 04 00 00       	call   660 <printf>
            exit();
 177:	e8 87 03 00 00       	call   503 <exit>
 17c:	66 90                	xchg   %ax,%ax
 17e:	66 90                	xchg   %ax,%ax

00000180 <replace>:
char* replace(char* replaced, char* replacing, char* string){
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	57                   	push   %edi
 188:	56                   	push   %esi
 189:	53                   	push   %ebx
 18a:	83 ec 0c             	sub    $0xc,%esp
 18d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    for (i = 0; i < strlen(string); ++i) {
 190:	8b 75 10             	mov    0x10(%ebp),%esi
 193:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 197:	90                   	nop
 198:	83 ec 0c             	sub    $0xc,%esp
 19b:	ff 75 10             	pushl  0x10(%ebp)
 19e:	e8 7d 01 00 00       	call   320 <strlen>
 1a3:	83 c4 10             	add    $0x10,%esp
 1a6:	89 c2                	mov    %eax,%edx
 1a8:	89 f0                	mov    %esi,%eax
 1aa:	2b 45 10             	sub    0x10(%ebp),%eax
 1ad:	39 c2                	cmp    %eax,%edx
 1af:	76 37                	jbe    1e8 <replace+0x68>
        for(j = 0; j < strlen(replaced); ++j) {
 1b1:	31 ff                	xor    %edi,%edi
 1b3:	eb 17                	jmp    1cc <replace+0x4c>
 1b5:	8d 76 00             	lea    0x0(%esi),%esi
            if (replaced[j] == string[i]) {
 1b8:	0f b6 06             	movzbl (%esi),%eax
 1bb:	38 04 3b             	cmp    %al,(%ebx,%edi,1)
 1be:	75 09                	jne    1c9 <replace+0x49>
                string[i] = replacing[j];
 1c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c3:	0f b6 04 38          	movzbl (%eax,%edi,1),%eax
 1c7:	88 06                	mov    %al,(%esi)
        for(j = 0; j < strlen(replaced); ++j) {
 1c9:	83 c7 01             	add    $0x1,%edi
 1cc:	83 ec 0c             	sub    $0xc,%esp
 1cf:	53                   	push   %ebx
 1d0:	e8 4b 01 00 00       	call   320 <strlen>
 1d5:	83 c4 10             	add    $0x10,%esp
 1d8:	39 f8                	cmp    %edi,%eax
 1da:	77 dc                	ja     1b8 <replace+0x38>
    for (i = 0; i < strlen(string); ++i) {
 1dc:	83 c6 01             	add    $0x1,%esi
 1df:	eb b7                	jmp    198 <replace+0x18>
 1e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
}
 1e8:	8b 45 10             	mov    0x10(%ebp),%eax
 1eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ee:	5b                   	pop    %ebx
 1ef:	5e                   	pop    %esi
 1f0:	5f                   	pop    %edi
 1f1:	5d                   	pop    %ebp
 1f2:	c3                   	ret    
 1f3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000200 <remove>:
char* remove(char* deleted, char* string){
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	57                   	push   %edi
 208:	56                   	push   %esi
 209:	31 f6                	xor    %esi,%esi
 20b:	53                   	push   %ebx
 20c:	83 ec 28             	sub    $0x28,%esp
    int len = strlen(string);
 20f:	ff 75 0c             	pushl  0xc(%ebp)
char* remove(char* deleted, char* string){
 212:	8b 5d 08             	mov    0x8(%ebp),%ebx
    int len = strlen(string);
 215:	e8 06 01 00 00       	call   320 <strlen>
    for (i = 0; i < len; ++i) {
 21a:	83 c4 10             	add    $0x10,%esp
    int len = strlen(string);
 21d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for (i = 0; i < len; ++i) {
 220:	85 c0                	test   %eax,%eax
 222:	7e 66                	jle    28a <remove+0x8a>
 224:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        for(j = 0; j < strlen(deleted); ++j) {
 228:	31 ff                	xor    %edi,%edi
 22a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 22d:	89 fb                	mov    %edi,%ebx
 22f:	8b 7d 08             	mov    0x8(%ebp),%edi
 232:	eb 07                	jmp    23b <remove+0x3b>
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 238:	83 c3 01             	add    $0x1,%ebx
 23b:	83 ec 0c             	sub    $0xc,%esp
 23e:	57                   	push   %edi
 23f:	e8 dc 00 00 00       	call   320 <strlen>
 244:	83 c4 10             	add    $0x10,%esp
 247:	39 d8                	cmp    %ebx,%eax
 249:	76 35                	jbe    280 <remove+0x80>
            if(string[i] == deleted[j]){
 24b:	8b 45 0c             	mov    0xc(%ebp),%eax
 24e:	0f b6 0c 1f          	movzbl (%edi,%ebx,1),%ecx
 252:	01 f0                	add    %esi,%eax
 254:	38 08                	cmp    %cl,(%eax)
 256:	75 e0                	jne    238 <remove+0x38>
                for (k = i; k < len; ++k){
 258:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 25b:	39 d6                	cmp    %edx,%esi
 25d:	7d 17                	jge    276 <remove+0x76>
 25f:	03 55 0c             	add    0xc(%ebp),%edx
 262:	89 d1                	mov    %edx,%ecx
 264:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
                    string[k] = string[k+1];
 268:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 26c:	83 c0 01             	add    $0x1,%eax
 26f:	88 50 ff             	mov    %dl,-0x1(%eax)
                for (k = i; k < len; ++k){
 272:	39 c8                	cmp    %ecx,%eax
 274:	75 f2                	jne    268 <remove+0x68>
                len--;
 276:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                i--;
 27a:	83 ee 01             	sub    $0x1,%esi
 27d:	eb b9                	jmp    238 <remove+0x38>
 27f:	90                   	nop
 280:	89 fb                	mov    %edi,%ebx
    for (i = 0; i < len; ++i) {
 282:	83 c6 01             	add    $0x1,%esi
 285:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
 288:	7f 9e                	jg     228 <remove+0x28>
}
 28a:	8b 45 0c             	mov    0xc(%ebp),%eax
 28d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 290:	5b                   	pop    %ebx
 291:	5e                   	pop    %esi
 292:	5f                   	pop    %edi
 293:	5d                   	pop    %ebp
 294:	c3                   	ret    
 295:	66 90                	xchg   %ax,%ax
 297:	66 90                	xchg   %ax,%ax
 299:	66 90                	xchg   %ax,%ax
 29b:	66 90                	xchg   %ax,%ax
 29d:	66 90                	xchg   %ax,%ax
 29f:	90                   	nop

000002a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2a0:	f3 0f 1e fb          	endbr32 
 2a4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2a5:	31 c0                	xor    %eax,%eax
{
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	53                   	push   %ebx
 2aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2ad:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 2b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 2b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 2b7:	83 c0 01             	add    $0x1,%eax
 2ba:	84 d2                	test   %dl,%dl
 2bc:	75 f2                	jne    2b0 <strcpy+0x10>
    ;
  return os;
}
 2be:	89 c8                	mov    %ecx,%eax
 2c0:	5b                   	pop    %ebx
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    
 2c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	53                   	push   %ebx
 2d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2db:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2de:	0f b6 01             	movzbl (%ecx),%eax
 2e1:	0f b6 1a             	movzbl (%edx),%ebx
 2e4:	84 c0                	test   %al,%al
 2e6:	75 19                	jne    301 <strcmp+0x31>
 2e8:	eb 26                	jmp    310 <strcmp+0x40>
 2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2f0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 2f4:	83 c1 01             	add    $0x1,%ecx
 2f7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2fa:	0f b6 1a             	movzbl (%edx),%ebx
 2fd:	84 c0                	test   %al,%al
 2ff:	74 0f                	je     310 <strcmp+0x40>
 301:	38 d8                	cmp    %bl,%al
 303:	74 eb                	je     2f0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 305:	29 d8                	sub    %ebx,%eax
}
 307:	5b                   	pop    %ebx
 308:	5d                   	pop    %ebp
 309:	c3                   	ret    
 30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 310:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 312:	29 d8                	sub    %ebx,%eax
}
 314:	5b                   	pop    %ebx
 315:	5d                   	pop    %ebp
 316:	c3                   	ret    
 317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31e:	66 90                	xchg   %ax,%ax

00000320 <strlen>:

uint
strlen(const char *s)
{
 320:	f3 0f 1e fb          	endbr32 
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 32a:	80 3a 00             	cmpb   $0x0,(%edx)
 32d:	74 21                	je     350 <strlen+0x30>
 32f:	31 c0                	xor    %eax,%eax
 331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 338:	83 c0 01             	add    $0x1,%eax
 33b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 33f:	89 c1                	mov    %eax,%ecx
 341:	75 f5                	jne    338 <strlen+0x18>
    ;
  return n;
}
 343:	89 c8                	mov    %ecx,%eax
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    
 347:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 350:	31 c9                	xor    %ecx,%ecx
}
 352:	5d                   	pop    %ebp
 353:	89 c8                	mov    %ecx,%eax
 355:	c3                   	ret    
 356:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35d:	8d 76 00             	lea    0x0(%esi),%esi

00000360 <memset>:

void*
memset(void *dst, int c, uint n)
{
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	57                   	push   %edi
 368:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 36b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 36e:	8b 45 0c             	mov    0xc(%ebp),%eax
 371:	89 d7                	mov    %edx,%edi
 373:	fc                   	cld    
 374:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 376:	89 d0                	mov    %edx,%eax
 378:	5f                   	pop    %edi
 379:	5d                   	pop    %ebp
 37a:	c3                   	ret    
 37b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop

00000380 <strchr>:

char*
strchr(const char *s, char c)
{
 380:	f3 0f 1e fb          	endbr32 
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	8b 45 08             	mov    0x8(%ebp),%eax
 38a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 38e:	0f b6 10             	movzbl (%eax),%edx
 391:	84 d2                	test   %dl,%dl
 393:	75 16                	jne    3ab <strchr+0x2b>
 395:	eb 21                	jmp    3b8 <strchr+0x38>
 397:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39e:	66 90                	xchg   %ax,%ax
 3a0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 3a4:	83 c0 01             	add    $0x1,%eax
 3a7:	84 d2                	test   %dl,%dl
 3a9:	74 0d                	je     3b8 <strchr+0x38>
    if(*s == c)
 3ab:	38 d1                	cmp    %dl,%cl
 3ad:	75 f1                	jne    3a0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 3af:	5d                   	pop    %ebp
 3b0:	c3                   	ret    
 3b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 3b8:	31 c0                	xor    %eax,%eax
}
 3ba:	5d                   	pop    %ebp
 3bb:	c3                   	ret    
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <gets>:

char*
gets(char *buf, int max)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	57                   	push   %edi
 3c8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3c9:	31 f6                	xor    %esi,%esi
{
 3cb:	53                   	push   %ebx
 3cc:	89 f3                	mov    %esi,%ebx
 3ce:	83 ec 1c             	sub    $0x1c,%esp
 3d1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 3d4:	eb 33                	jmp    409 <gets+0x49>
 3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 3e0:	83 ec 04             	sub    $0x4,%esp
 3e3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3e6:	6a 01                	push   $0x1
 3e8:	50                   	push   %eax
 3e9:	6a 00                	push   $0x0
 3eb:	e8 2b 01 00 00       	call   51b <read>
    if(cc < 1)
 3f0:	83 c4 10             	add    $0x10,%esp
 3f3:	85 c0                	test   %eax,%eax
 3f5:	7e 1c                	jle    413 <gets+0x53>
      break;
    buf[i++] = c;
 3f7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3fb:	83 c7 01             	add    $0x1,%edi
 3fe:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 401:	3c 0a                	cmp    $0xa,%al
 403:	74 23                	je     428 <gets+0x68>
 405:	3c 0d                	cmp    $0xd,%al
 407:	74 1f                	je     428 <gets+0x68>
  for(i=0; i+1 < max; ){
 409:	83 c3 01             	add    $0x1,%ebx
 40c:	89 fe                	mov    %edi,%esi
 40e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 411:	7c cd                	jl     3e0 <gets+0x20>
 413:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 415:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 418:	c6 03 00             	movb   $0x0,(%ebx)
}
 41b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 41e:	5b                   	pop    %ebx
 41f:	5e                   	pop    %esi
 420:	5f                   	pop    %edi
 421:	5d                   	pop    %ebp
 422:	c3                   	ret    
 423:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 427:	90                   	nop
 428:	8b 75 08             	mov    0x8(%ebp),%esi
 42b:	8b 45 08             	mov    0x8(%ebp),%eax
 42e:	01 de                	add    %ebx,%esi
 430:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 432:	c6 03 00             	movb   $0x0,(%ebx)
}
 435:	8d 65 f4             	lea    -0xc(%ebp),%esp
 438:	5b                   	pop    %ebx
 439:	5e                   	pop    %esi
 43a:	5f                   	pop    %edi
 43b:	5d                   	pop    %ebp
 43c:	c3                   	ret    
 43d:	8d 76 00             	lea    0x0(%esi),%esi

00000440 <stat>:

int
stat(const char *n, struct stat *st)
{
 440:	f3 0f 1e fb          	endbr32 
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	56                   	push   %esi
 448:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 449:	83 ec 08             	sub    $0x8,%esp
 44c:	6a 00                	push   $0x0
 44e:	ff 75 08             	pushl  0x8(%ebp)
 451:	e8 ed 00 00 00       	call   543 <open>
  if(fd < 0)
 456:	83 c4 10             	add    $0x10,%esp
 459:	85 c0                	test   %eax,%eax
 45b:	78 2b                	js     488 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 45d:	83 ec 08             	sub    $0x8,%esp
 460:	ff 75 0c             	pushl  0xc(%ebp)
 463:	89 c3                	mov    %eax,%ebx
 465:	50                   	push   %eax
 466:	e8 f0 00 00 00       	call   55b <fstat>
  close(fd);
 46b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 46e:	89 c6                	mov    %eax,%esi
  close(fd);
 470:	e8 b6 00 00 00       	call   52b <close>
  return r;
 475:	83 c4 10             	add    $0x10,%esp
}
 478:	8d 65 f8             	lea    -0x8(%ebp),%esp
 47b:	89 f0                	mov    %esi,%eax
 47d:	5b                   	pop    %ebx
 47e:	5e                   	pop    %esi
 47f:	5d                   	pop    %ebp
 480:	c3                   	ret    
 481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 488:	be ff ff ff ff       	mov    $0xffffffff,%esi
 48d:	eb e9                	jmp    478 <stat+0x38>
 48f:	90                   	nop

00000490 <atoi>:

int
atoi(const char *s)
{
 490:	f3 0f 1e fb          	endbr32 
 494:	55                   	push   %ebp
 495:	89 e5                	mov    %esp,%ebp
 497:	53                   	push   %ebx
 498:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 49b:	0f be 02             	movsbl (%edx),%eax
 49e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 4a1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 4a4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 4a9:	77 1a                	ja     4c5 <atoi+0x35>
 4ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop
    n = n*10 + *s++ - '0';
 4b0:	83 c2 01             	add    $0x1,%edx
 4b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 4b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 4ba:	0f be 02             	movsbl (%edx),%eax
 4bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4c0:	80 fb 09             	cmp    $0x9,%bl
 4c3:	76 eb                	jbe    4b0 <atoi+0x20>
  return n;
}
 4c5:	89 c8                	mov    %ecx,%eax
 4c7:	5b                   	pop    %ebx
 4c8:	5d                   	pop    %ebp
 4c9:	c3                   	ret    
 4ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4d0:	f3 0f 1e fb          	endbr32 
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	57                   	push   %edi
 4d8:	8b 45 10             	mov    0x10(%ebp),%eax
 4db:	8b 55 08             	mov    0x8(%ebp),%edx
 4de:	56                   	push   %esi
 4df:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4e2:	85 c0                	test   %eax,%eax
 4e4:	7e 0f                	jle    4f5 <memmove+0x25>
 4e6:	01 d0                	add    %edx,%eax
  dst = vdst;
 4e8:	89 d7                	mov    %edx,%edi
 4ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 4f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 4f1:	39 f8                	cmp    %edi,%eax
 4f3:	75 fb                	jne    4f0 <memmove+0x20>
  return vdst;
}
 4f5:	5e                   	pop    %esi
 4f6:	89 d0                	mov    %edx,%eax
 4f8:	5f                   	pop    %edi
 4f9:	5d                   	pop    %ebp
 4fa:	c3                   	ret    

000004fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4fb:	b8 01 00 00 00       	mov    $0x1,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <exit>:
SYSCALL(exit)
 503:	b8 02 00 00 00       	mov    $0x2,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <wait>:
SYSCALL(wait)
 50b:	b8 03 00 00 00       	mov    $0x3,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <pipe>:
SYSCALL(pipe)
 513:	b8 04 00 00 00       	mov    $0x4,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <read>:
SYSCALL(read)
 51b:	b8 05 00 00 00       	mov    $0x5,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <write>:
SYSCALL(write)
 523:	b8 10 00 00 00       	mov    $0x10,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <close>:
SYSCALL(close)
 52b:	b8 15 00 00 00       	mov    $0x15,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <kill>:
SYSCALL(kill)
 533:	b8 06 00 00 00       	mov    $0x6,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <exec>:
SYSCALL(exec)
 53b:	b8 07 00 00 00       	mov    $0x7,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <open>:
SYSCALL(open)
 543:	b8 0f 00 00 00       	mov    $0xf,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <mknod>:
SYSCALL(mknod)
 54b:	b8 11 00 00 00       	mov    $0x11,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <unlink>:
SYSCALL(unlink)
 553:	b8 12 00 00 00       	mov    $0x12,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <fstat>:
SYSCALL(fstat)
 55b:	b8 08 00 00 00       	mov    $0x8,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <link>:
SYSCALL(link)
 563:	b8 13 00 00 00       	mov    $0x13,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <mkdir>:
SYSCALL(mkdir)
 56b:	b8 14 00 00 00       	mov    $0x14,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <chdir>:
SYSCALL(chdir)
 573:	b8 09 00 00 00       	mov    $0x9,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <dup>:
SYSCALL(dup)
 57b:	b8 0a 00 00 00       	mov    $0xa,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <getpid>:
SYSCALL(getpid)
 583:	b8 0b 00 00 00       	mov    $0xb,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <sbrk>:
SYSCALL(sbrk)
 58b:	b8 0c 00 00 00       	mov    $0xc,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <sleep>:
SYSCALL(sleep)
 593:	b8 0d 00 00 00       	mov    $0xd,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <uptime>:
SYSCALL(uptime)
 59b:	b8 0e 00 00 00       	mov    $0xe,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    
 5a3:	66 90                	xchg   %ax,%ax
 5a5:	66 90                	xchg   %ax,%ax
 5a7:	66 90                	xchg   %ax,%ax
 5a9:	66 90                	xchg   %ax,%ax
 5ab:	66 90                	xchg   %ax,%ax
 5ad:	66 90                	xchg   %ax,%ax
 5af:	90                   	nop

000005b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	57                   	push   %edi
 5b4:	56                   	push   %esi
 5b5:	53                   	push   %ebx
 5b6:	83 ec 3c             	sub    $0x3c,%esp
 5b9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5bc:	89 d1                	mov    %edx,%ecx
{
 5be:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5c1:	85 d2                	test   %edx,%edx
 5c3:	0f 89 7f 00 00 00    	jns    648 <printint+0x98>
 5c9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5cd:	74 79                	je     648 <printint+0x98>
    neg = 1;
 5cf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5d6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5d8:	31 db                	xor    %ebx,%ebx
 5da:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5e0:	89 c8                	mov    %ecx,%eax
 5e2:	31 d2                	xor    %edx,%edx
 5e4:	89 cf                	mov    %ecx,%edi
 5e6:	f7 75 c4             	divl   -0x3c(%ebp)
 5e9:	0f b6 92 20 0a 00 00 	movzbl 0xa20(%edx),%edx
 5f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5f3:	89 d8                	mov    %ebx,%eax
 5f5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5f8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5fb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5fe:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 601:	76 dd                	jbe    5e0 <printint+0x30>
  if(neg)
 603:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 606:	85 c9                	test   %ecx,%ecx
 608:	74 0c                	je     616 <printint+0x66>
    buf[i++] = '-';
 60a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 60f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 611:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 616:	8b 7d b8             	mov    -0x48(%ebp),%edi
 619:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 61d:	eb 07                	jmp    626 <printint+0x76>
 61f:	90                   	nop
 620:	0f b6 13             	movzbl (%ebx),%edx
 623:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 626:	83 ec 04             	sub    $0x4,%esp
 629:	88 55 d7             	mov    %dl,-0x29(%ebp)
 62c:	6a 01                	push   $0x1
 62e:	56                   	push   %esi
 62f:	57                   	push   %edi
 630:	e8 ee fe ff ff       	call   523 <write>
  while(--i >= 0)
 635:	83 c4 10             	add    $0x10,%esp
 638:	39 de                	cmp    %ebx,%esi
 63a:	75 e4                	jne    620 <printint+0x70>
    putc(fd, buf[i]);
}
 63c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 63f:	5b                   	pop    %ebx
 640:	5e                   	pop    %esi
 641:	5f                   	pop    %edi
 642:	5d                   	pop    %ebp
 643:	c3                   	ret    
 644:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 648:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 64f:	eb 87                	jmp    5d8 <printint+0x28>
 651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 658:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65f:	90                   	nop

00000660 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 660:	f3 0f 1e fb          	endbr32 
 664:	55                   	push   %ebp
 665:	89 e5                	mov    %esp,%ebp
 667:	57                   	push   %edi
 668:	56                   	push   %esi
 669:	53                   	push   %ebx
 66a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 66d:	8b 75 0c             	mov    0xc(%ebp),%esi
 670:	0f b6 1e             	movzbl (%esi),%ebx
 673:	84 db                	test   %bl,%bl
 675:	0f 84 b4 00 00 00    	je     72f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 67b:	8d 45 10             	lea    0x10(%ebp),%eax
 67e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 681:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 684:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 686:	89 45 d0             	mov    %eax,-0x30(%ebp)
 689:	eb 33                	jmp    6be <printf+0x5e>
 68b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 68f:	90                   	nop
 690:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 693:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 698:	83 f8 25             	cmp    $0x25,%eax
 69b:	74 17                	je     6b4 <printf+0x54>
  write(fd, &c, 1);
 69d:	83 ec 04             	sub    $0x4,%esp
 6a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6a3:	6a 01                	push   $0x1
 6a5:	57                   	push   %edi
 6a6:	ff 75 08             	pushl  0x8(%ebp)
 6a9:	e8 75 fe ff ff       	call   523 <write>
 6ae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 6b1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6b4:	0f b6 1e             	movzbl (%esi),%ebx
 6b7:	83 c6 01             	add    $0x1,%esi
 6ba:	84 db                	test   %bl,%bl
 6bc:	74 71                	je     72f <printf+0xcf>
    c = fmt[i] & 0xff;
 6be:	0f be cb             	movsbl %bl,%ecx
 6c1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6c4:	85 d2                	test   %edx,%edx
 6c6:	74 c8                	je     690 <printf+0x30>
      }
    } else if(state == '%'){
 6c8:	83 fa 25             	cmp    $0x25,%edx
 6cb:	75 e7                	jne    6b4 <printf+0x54>
      if(c == 'd'){
 6cd:	83 f8 64             	cmp    $0x64,%eax
 6d0:	0f 84 9a 00 00 00    	je     770 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6d6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6dc:	83 f9 70             	cmp    $0x70,%ecx
 6df:	74 5f                	je     740 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6e1:	83 f8 73             	cmp    $0x73,%eax
 6e4:	0f 84 d6 00 00 00    	je     7c0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6ea:	83 f8 63             	cmp    $0x63,%eax
 6ed:	0f 84 8d 00 00 00    	je     780 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6f3:	83 f8 25             	cmp    $0x25,%eax
 6f6:	0f 84 b4 00 00 00    	je     7b0 <printf+0x150>
  write(fd, &c, 1);
 6fc:	83 ec 04             	sub    $0x4,%esp
 6ff:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 703:	6a 01                	push   $0x1
 705:	57                   	push   %edi
 706:	ff 75 08             	pushl  0x8(%ebp)
 709:	e8 15 fe ff ff       	call   523 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 70e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 711:	83 c4 0c             	add    $0xc,%esp
 714:	6a 01                	push   $0x1
 716:	83 c6 01             	add    $0x1,%esi
 719:	57                   	push   %edi
 71a:	ff 75 08             	pushl  0x8(%ebp)
 71d:	e8 01 fe ff ff       	call   523 <write>
  for(i = 0; fmt[i]; i++){
 722:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 726:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 729:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 72b:	84 db                	test   %bl,%bl
 72d:	75 8f                	jne    6be <printf+0x5e>
    }
  }
}
 72f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 732:	5b                   	pop    %ebx
 733:	5e                   	pop    %esi
 734:	5f                   	pop    %edi
 735:	5d                   	pop    %ebp
 736:	c3                   	ret    
 737:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 73e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 740:	83 ec 0c             	sub    $0xc,%esp
 743:	b9 10 00 00 00       	mov    $0x10,%ecx
 748:	6a 00                	push   $0x0
 74a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 74d:	8b 45 08             	mov    0x8(%ebp),%eax
 750:	8b 13                	mov    (%ebx),%edx
 752:	e8 59 fe ff ff       	call   5b0 <printint>
        ap++;
 757:	89 d8                	mov    %ebx,%eax
 759:	83 c4 10             	add    $0x10,%esp
      state = 0;
 75c:	31 d2                	xor    %edx,%edx
        ap++;
 75e:	83 c0 04             	add    $0x4,%eax
 761:	89 45 d0             	mov    %eax,-0x30(%ebp)
 764:	e9 4b ff ff ff       	jmp    6b4 <printf+0x54>
 769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 770:	83 ec 0c             	sub    $0xc,%esp
 773:	b9 0a 00 00 00       	mov    $0xa,%ecx
 778:	6a 01                	push   $0x1
 77a:	eb ce                	jmp    74a <printf+0xea>
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 780:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 783:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 786:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 788:	6a 01                	push   $0x1
        ap++;
 78a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 78d:	57                   	push   %edi
 78e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 791:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 794:	e8 8a fd ff ff       	call   523 <write>
        ap++;
 799:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 79c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 79f:	31 d2                	xor    %edx,%edx
 7a1:	e9 0e ff ff ff       	jmp    6b4 <printf+0x54>
 7a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ad:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 7b0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 7b3:	83 ec 04             	sub    $0x4,%esp
 7b6:	e9 59 ff ff ff       	jmp    714 <printf+0xb4>
 7bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7bf:	90                   	nop
        s = (char*)*ap;
 7c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7c3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7c5:	83 c0 04             	add    $0x4,%eax
 7c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7cb:	85 db                	test   %ebx,%ebx
 7cd:	74 17                	je     7e6 <printf+0x186>
        while(*s != 0){
 7cf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7d2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7d4:	84 c0                	test   %al,%al
 7d6:	0f 84 d8 fe ff ff    	je     6b4 <printf+0x54>
 7dc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7df:	89 de                	mov    %ebx,%esi
 7e1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7e4:	eb 1a                	jmp    800 <printf+0x1a0>
          s = "(null)";
 7e6:	bb 16 0a 00 00       	mov    $0xa16,%ebx
        while(*s != 0){
 7eb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7ee:	b8 28 00 00 00       	mov    $0x28,%eax
 7f3:	89 de                	mov    %ebx,%esi
 7f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ff:	90                   	nop
  write(fd, &c, 1);
 800:	83 ec 04             	sub    $0x4,%esp
          s++;
 803:	83 c6 01             	add    $0x1,%esi
 806:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 809:	6a 01                	push   $0x1
 80b:	57                   	push   %edi
 80c:	53                   	push   %ebx
 80d:	e8 11 fd ff ff       	call   523 <write>
        while(*s != 0){
 812:	0f b6 06             	movzbl (%esi),%eax
 815:	83 c4 10             	add    $0x10,%esp
 818:	84 c0                	test   %al,%al
 81a:	75 e4                	jne    800 <printf+0x1a0>
 81c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 81f:	31 d2                	xor    %edx,%edx
 821:	e9 8e fe ff ff       	jmp    6b4 <printf+0x54>
 826:	66 90                	xchg   %ax,%ax
 828:	66 90                	xchg   %ax,%ax
 82a:	66 90                	xchg   %ax,%ax
 82c:	66 90                	xchg   %ax,%ax
 82e:	66 90                	xchg   %ax,%ax

00000830 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 830:	f3 0f 1e fb          	endbr32 
 834:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 835:	a1 48 0d 00 00       	mov    0xd48,%eax
{
 83a:	89 e5                	mov    %esp,%ebp
 83c:	57                   	push   %edi
 83d:	56                   	push   %esi
 83e:	53                   	push   %ebx
 83f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 842:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 844:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 847:	39 c8                	cmp    %ecx,%eax
 849:	73 15                	jae    860 <free+0x30>
 84b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 84f:	90                   	nop
 850:	39 d1                	cmp    %edx,%ecx
 852:	72 14                	jb     868 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 854:	39 d0                	cmp    %edx,%eax
 856:	73 10                	jae    868 <free+0x38>
{
 858:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 85a:	8b 10                	mov    (%eax),%edx
 85c:	39 c8                	cmp    %ecx,%eax
 85e:	72 f0                	jb     850 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 860:	39 d0                	cmp    %edx,%eax
 862:	72 f4                	jb     858 <free+0x28>
 864:	39 d1                	cmp    %edx,%ecx
 866:	73 f0                	jae    858 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 868:	8b 73 fc             	mov    -0x4(%ebx),%esi
 86b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 86e:	39 fa                	cmp    %edi,%edx
 870:	74 1e                	je     890 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 872:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 875:	8b 50 04             	mov    0x4(%eax),%edx
 878:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 87b:	39 f1                	cmp    %esi,%ecx
 87d:	74 28                	je     8a7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 87f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 881:	5b                   	pop    %ebx
  freep = p;
 882:	a3 48 0d 00 00       	mov    %eax,0xd48
}
 887:	5e                   	pop    %esi
 888:	5f                   	pop    %edi
 889:	5d                   	pop    %ebp
 88a:	c3                   	ret    
 88b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 88f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 890:	03 72 04             	add    0x4(%edx),%esi
 893:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 896:	8b 10                	mov    (%eax),%edx
 898:	8b 12                	mov    (%edx),%edx
 89a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 89d:	8b 50 04             	mov    0x4(%eax),%edx
 8a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8a3:	39 f1                	cmp    %esi,%ecx
 8a5:	75 d8                	jne    87f <free+0x4f>
    p->s.size += bp->s.size;
 8a7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 8aa:	a3 48 0d 00 00       	mov    %eax,0xd48
    p->s.size += bp->s.size;
 8af:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8b2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8b5:	89 10                	mov    %edx,(%eax)
}
 8b7:	5b                   	pop    %ebx
 8b8:	5e                   	pop    %esi
 8b9:	5f                   	pop    %edi
 8ba:	5d                   	pop    %ebp
 8bb:	c3                   	ret    
 8bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8c0:	f3 0f 1e fb          	endbr32 
 8c4:	55                   	push   %ebp
 8c5:	89 e5                	mov    %esp,%ebp
 8c7:	57                   	push   %edi
 8c8:	56                   	push   %esi
 8c9:	53                   	push   %ebx
 8ca:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8cd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8d0:	8b 3d 48 0d 00 00    	mov    0xd48,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d6:	8d 70 07             	lea    0x7(%eax),%esi
 8d9:	c1 ee 03             	shr    $0x3,%esi
 8dc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8df:	85 ff                	test   %edi,%edi
 8e1:	0f 84 a9 00 00 00    	je     990 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 8e9:	8b 48 04             	mov    0x4(%eax),%ecx
 8ec:	39 f1                	cmp    %esi,%ecx
 8ee:	73 6d                	jae    95d <malloc+0x9d>
 8f0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 8f6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8fb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8fe:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 905:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 908:	eb 17                	jmp    921 <malloc+0x61>
 90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 910:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 912:	8b 4a 04             	mov    0x4(%edx),%ecx
 915:	39 f1                	cmp    %esi,%ecx
 917:	73 4f                	jae    968 <malloc+0xa8>
 919:	8b 3d 48 0d 00 00    	mov    0xd48,%edi
 91f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 921:	39 c7                	cmp    %eax,%edi
 923:	75 eb                	jne    910 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 925:	83 ec 0c             	sub    $0xc,%esp
 928:	ff 75 e4             	pushl  -0x1c(%ebp)
 92b:	e8 5b fc ff ff       	call   58b <sbrk>
  if(p == (char*)-1)
 930:	83 c4 10             	add    $0x10,%esp
 933:	83 f8 ff             	cmp    $0xffffffff,%eax
 936:	74 1b                	je     953 <malloc+0x93>
  hp->s.size = nu;
 938:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 93b:	83 ec 0c             	sub    $0xc,%esp
 93e:	83 c0 08             	add    $0x8,%eax
 941:	50                   	push   %eax
 942:	e8 e9 fe ff ff       	call   830 <free>
  return freep;
 947:	a1 48 0d 00 00       	mov    0xd48,%eax
      if((p = morecore(nunits)) == 0)
 94c:	83 c4 10             	add    $0x10,%esp
 94f:	85 c0                	test   %eax,%eax
 951:	75 bd                	jne    910 <malloc+0x50>
        return 0;
  }
}
 953:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 956:	31 c0                	xor    %eax,%eax
}
 958:	5b                   	pop    %ebx
 959:	5e                   	pop    %esi
 95a:	5f                   	pop    %edi
 95b:	5d                   	pop    %ebp
 95c:	c3                   	ret    
    if(p->s.size >= nunits){
 95d:	89 c2                	mov    %eax,%edx
 95f:	89 f8                	mov    %edi,%eax
 961:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 968:	39 ce                	cmp    %ecx,%esi
 96a:	74 54                	je     9c0 <malloc+0x100>
        p->s.size -= nunits;
 96c:	29 f1                	sub    %esi,%ecx
 96e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 971:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 974:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 977:	a3 48 0d 00 00       	mov    %eax,0xd48
}
 97c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 97f:	8d 42 08             	lea    0x8(%edx),%eax
}
 982:	5b                   	pop    %ebx
 983:	5e                   	pop    %esi
 984:	5f                   	pop    %edi
 985:	5d                   	pop    %ebp
 986:	c3                   	ret    
 987:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 98e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 990:	c7 05 48 0d 00 00 4c 	movl   $0xd4c,0xd48
 997:	0d 00 00 
    base.s.size = 0;
 99a:	bf 4c 0d 00 00       	mov    $0xd4c,%edi
    base.s.ptr = freep = prevp = &base;
 99f:	c7 05 4c 0d 00 00 4c 	movl   $0xd4c,0xd4c
 9a6:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 9ab:	c7 05 50 0d 00 00 00 	movl   $0x0,0xd50
 9b2:	00 00 00 
    if(p->s.size >= nunits){
 9b5:	e9 36 ff ff ff       	jmp    8f0 <malloc+0x30>
 9ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9c0:	8b 0a                	mov    (%edx),%ecx
 9c2:	89 08                	mov    %ecx,(%eax)
 9c4:	eb b1                	jmp    977 <malloc+0xb7>
