
_unzip:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "\n");
  exit();
}

int
main(int argc, char *argv[]){
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  13:	8b 01                	mov    (%ecx),%eax
  15:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc < 2){
  18:	83 f8 01             	cmp    $0x1,%eax
  1b:	7e 34                	jle    51 <main+0x51>
    printf(1, "unzip: not enough arguments\n");
    exit();
  }

  if(argc > 2){
  1d:	83 f8 02             	cmp    $0x2,%eax
  20:	74 13                	je     35 <main+0x35>
    printf(1, "unzip: too many arguments\n");
  22:	51                   	push   %ecx
  23:	51                   	push   %ecx
  24:	68 c8 09 00 00       	push   $0x9c8
  29:	6a 01                	push   $0x1
  2b:	e8 10 06 00 00       	call   640 <printf>
    exit();
  30:	e8 ae 04 00 00       	call   4e3 <exit>
  }

  int fd;
  if((fd = open(argv[1], 0)) < 0){
  35:	52                   	push   %edx
  36:	52                   	push   %edx
  37:	6a 00                	push   $0x0
  39:	ff 73 04             	pushl  0x4(%ebx)
  3c:	e8 e2 04 00 00       	call   523 <open>
  41:	83 c4 10             	add    $0x10,%esp
  44:	85 c0                	test   %eax,%eax
  46:	78 1c                	js     64 <main+0x64>
    printf(1, "unzip: cannot open %s\n", argv[1]);
    exit();
  }
  else{
    decode(fd);
  48:	83 ec 0c             	sub    $0xc,%esp
  4b:	50                   	push   %eax
  4c:	e8 7f 00 00 00       	call   d0 <decode>
    printf(1, "unzip: not enough arguments\n");
  51:	53                   	push   %ebx
  52:	53                   	push   %ebx
  53:	68 ab 09 00 00       	push   $0x9ab
  58:	6a 01                	push   $0x1
  5a:	e8 e1 05 00 00       	call   640 <printf>
    exit();
  5f:	e8 7f 04 00 00       	call   4e3 <exit>
    printf(1, "unzip: cannot open %s\n", argv[1]);
  64:	50                   	push   %eax
  65:	ff 73 04             	pushl  0x4(%ebx)
  68:	68 e3 09 00 00       	push   $0x9e3
  6d:	6a 01                	push   $0x1
  6f:	e8 cc 05 00 00       	call   640 <printf>
    exit();
  74:	e8 6a 04 00 00       	call   4e3 <exit>
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <hextodecnum>:
int hextodecnum (char *str){
  80:	f3 0f 1e fb          	endbr32 
  84:	55                   	push   %ebp
  uint ret = 0;
  85:	31 c0                	xor    %eax,%eax
int hextodecnum (char *str){
  87:	89 e5                	mov    %esp,%ebp
  89:	56                   	push   %esi
  8a:	53                   	push   %ebx
  8b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  while(*str){
  8e:	0f b6 13             	movzbl (%ebx),%edx
  91:	84 d2                	test   %dl,%dl
  93:	74 2e                	je     c3 <hextodecnum+0x43>
  95:	8d 76 00             	lea    0x0(%esi),%esi
    uint ch = *str++;
  98:	0f be ca             	movsbl %dl,%ecx
  9b:	83 c3 01             	add    $0x1,%ebx
    if(ch >= '0' && ch <= '9'){
  9e:	8d 71 d0             	lea    -0x30(%ecx),%esi
  a1:	83 fe 09             	cmp    $0x9,%esi
  a4:	76 11                	jbe    b7 <hextodecnum+0x37>
    else if (ch >= 'A' && ch <= 'F'){
  a6:	8d 71 bf             	lea    -0x41(%ecx),%esi
  a9:	83 e2 0f             	and    $0xf,%edx
  ac:	83 e9 37             	sub    $0x37,%ecx
  af:	83 fe 06             	cmp    $0x6,%esi
  b2:	89 d6                	mov    %edx,%esi
  b4:	0f 42 f1             	cmovb  %ecx,%esi
  while(*str){
  b7:	0f b6 13             	movzbl (%ebx),%edx
    ret = (ret << 4) | (ch & 0xF);
  ba:	c1 e0 04             	shl    $0x4,%eax
  bd:	09 f0                	or     %esi,%eax
  while(*str){
  bf:	84 d2                	test   %dl,%dl
  c1:	75 d5                	jne    98 <hextodecnum+0x18>
}
  c3:	5b                   	pop    %ebx
  c4:	5e                   	pop    %esi
  c5:	5d                   	pop    %ebp
  c6:	c3                   	ret    
  c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ce:	66 90                	xchg   %ax,%ax

000000d0 <decode>:
void decode(int fd){
  d0:	f3 0f 1e fb          	endbr32 
  d4:	55                   	push   %ebp
  char charstr[] = "00";
  d5:	b8 30 30 00 00       	mov    $0x3030,%eax
void decode(int fd){
  da:	89 e5                	mov    %esp,%ebp
  dc:	57                   	push   %edi
  int mode = 0;
  dd:	31 ff                	xor    %edi,%edi
void decode(int fd){
  df:	56                   	push   %esi
  e0:	53                   	push   %ebx
  int i = 0;
  e1:	31 db                	xor    %ebx,%ebx
void decode(int fd){
  e3:	83 ec 2c             	sub    $0x2c,%esp
  char charstr[] = "00";
  e6:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
void decode(int fd){
  ea:	8b 75 08             	mov    0x8(%ebp),%esi
  char charstr[] = "00";
  ed:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
  char countstr[] = "0000";
  f1:	c7 45 e3 30 30 30 30 	movl   $0x30303030,-0x1d(%ebp)
  f8:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  while((n = read(fd, buffer, 1)) > 0){
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 100:	83 ec 04             	sub    $0x4,%esp
 103:	6a 01                	push   $0x1
 105:	68 08 0d 00 00       	push   $0xd08
 10a:	56                   	push   %esi
 10b:	e8 eb 03 00 00       	call   4fb <read>
 110:	83 c4 10             	add    $0x10,%esp
 113:	85 c0                	test   %eax,%eax
 115:	0f 8e e5 00 00 00    	jle    200 <decode+0x130>
    if(buffer[0] != ' '){
 11b:	0f b6 15 08 0d 00 00 	movzbl 0xd08,%edx
 122:	80 fa 20             	cmp    $0x20,%dl
 125:	74 31                	je     158 <decode+0x88>
      if(mode == 0 && i < 4){
 127:	85 ff                	test   %edi,%edi
 129:	0f 85 b1 00 00 00    	jne    1e0 <decode+0x110>
 12f:	83 fb 03             	cmp    $0x3,%ebx
 132:	0f 8f a8 00 00 00    	jg     1e0 <decode+0x110>
        countstr[0] = countstr[1];
 138:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
 13c:	88 45 e3             	mov    %al,-0x1d(%ebp)
        countstr[1] = countstr[2];
 13f:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
 143:	88 45 e4             	mov    %al,-0x1c(%ebp)
        countstr[2] = countstr[3];
 146:	0f b6 45 e6          	movzbl -0x1a(%ebp),%eax
        countstr[3] = buffer[0];
 14a:	88 55 e6             	mov    %dl,-0x1a(%ebp)
        countstr[2] = countstr[3];
 14d:	88 45 e5             	mov    %al,-0x1b(%ebp)
      i++;
 150:	83 c3 01             	add    $0x1,%ebx
 153:	eb ab                	jmp    100 <decode+0x30>
 155:	8d 76 00             	lea    0x0(%esi),%esi
      if(mode == 0){
 158:	85 ff                	test   %edi,%edi
 15a:	0f 84 b8 00 00 00    	je     218 <decode+0x148>
  while(*str){
 160:	0f be 45 e0          	movsbl -0x20(%ebp),%eax
  uint ret = 0;
 164:	31 db                	xor    %ebx,%ebx
  while(*str){
 166:	8d 4d e0             	lea    -0x20(%ebp),%ecx
 169:	84 c0                	test   %al,%al
 16b:	74 26                	je     193 <decode+0xc3>
    if(ch >= '0' && ch <= '9'){
 16d:	8d 50 d0             	lea    -0x30(%eax),%edx
    uint ch = *str++;
 170:	83 c1 01             	add    $0x1,%ecx
    if(ch >= '0' && ch <= '9'){
 173:	83 fa 09             	cmp    $0x9,%edx
 176:	76 0c                	jbe    184 <decode+0xb4>
    else if (ch >= 'A' && ch <= 'F'){
 178:	8d 78 bf             	lea    -0x41(%eax),%edi
      ch = ch - 'A' + 10;
 17b:	8d 50 c9             	lea    -0x37(%eax),%edx
 17e:	83 ff 06             	cmp    $0x6,%edi
 181:	0f 43 d0             	cmovae %eax,%edx
  while(*str){
 184:	0f be 01             	movsbl (%ecx),%eax
    ret = (ret << 4) | (ch & 0xF);
 187:	c1 e3 04             	shl    $0x4,%ebx
 18a:	83 e2 0f             	and    $0xf,%edx
 18d:	09 d3                	or     %edx,%ebx
  while(*str){
 18f:	84 c0                	test   %al,%al
 191:	75 da                	jne    16d <decode+0x9d>
        for(int j = 0; j < count; j++){
 193:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        charstr[0] = '0';
 196:	66 c7 45 e0 30 30    	movw   $0x3030,-0x20(%ebp)
        for(int j = 0; j < count; j++){
 19c:	85 c0                	test   %eax,%eax
 19e:	0f 8e c5 00 00 00    	jle    269 <decode+0x199>
 1a4:	31 ff                	xor    %edi,%edi
 1a6:	89 75 08             	mov    %esi,0x8(%ebp)
 1a9:	89 fe                	mov    %edi,%esi
 1ab:	89 df                	mov    %ebx,%edi
 1ad:	89 c3                	mov    %eax,%ebx
 1af:	90                   	nop
          printf(1, "%c", chr);
 1b0:	83 ec 04             	sub    $0x4,%esp
        for(int j = 0; j < count; j++){
 1b3:	83 c6 01             	add    $0x1,%esi
          printf(1, "%c", chr);
 1b6:	57                   	push   %edi
 1b7:	68 a8 09 00 00       	push   $0x9a8
 1bc:	6a 01                	push   $0x1
 1be:	e8 7d 04 00 00       	call   640 <printf>
        for(int j = 0; j < count; j++){
 1c3:	83 c4 10             	add    $0x10,%esp
 1c6:	39 f3                	cmp    %esi,%ebx
 1c8:	75 e6                	jne    1b0 <decode+0xe0>
 1ca:	8b 75 08             	mov    0x8(%ebp),%esi
      i = 0;
 1cd:	31 db                	xor    %ebx,%ebx
        mode = 0;
 1cf:	31 ff                	xor    %edi,%edi
 1d1:	e9 2a ff ff ff       	jmp    100 <decode+0x30>
 1d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
      else if(mode == 1 && i < 2){
 1e0:	83 fb 01             	cmp    $0x1,%ebx
 1e3:	0f 8f 67 ff ff ff    	jg     150 <decode+0x80>
 1e9:	85 ff                	test   %edi,%edi
 1eb:	0f 84 5f ff ff ff    	je     150 <decode+0x80>
        charstr[0] = charstr[1];
 1f1:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
        charstr[1] = buffer[0];
 1f5:	88 55 e1             	mov    %dl,-0x1f(%ebp)
        charstr[0] = charstr[1];
 1f8:	88 45 e0             	mov    %al,-0x20(%ebp)
        charstr[1] = buffer[0];
 1fb:	e9 50 ff ff ff       	jmp    150 <decode+0x80>
  printf(1, "\n");
 200:	83 ec 08             	sub    $0x8,%esp
 203:	68 f8 09 00 00       	push   $0x9f8
 208:	6a 01                	push   $0x1
 20a:	e8 31 04 00 00       	call   640 <printf>
  exit();
 20f:	e8 cf 02 00 00       	call   4e3 <exit>
 214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(*str){
 218:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  uint ret = 0;
 21c:	31 d2                	xor    %edx,%edx
  while(*str){
 21e:	84 c0                	test   %al,%al
 220:	74 31                	je     253 <decode+0x183>
 222:	8d 5d e3             	lea    -0x1d(%ebp),%ebx
 225:	8d 76 00             	lea    0x0(%esi),%esi
    uint ch = *str++;
 228:	0f be c8             	movsbl %al,%ecx
 22b:	83 c3 01             	add    $0x1,%ebx
    if(ch >= '0' && ch <= '9'){
 22e:	8d 79 d0             	lea    -0x30(%ecx),%edi
 231:	83 ff 09             	cmp    $0x9,%edi
 234:	76 11                	jbe    247 <decode+0x177>
    else if (ch >= 'A' && ch <= 'F'){
 236:	8d 79 bf             	lea    -0x41(%ecx),%edi
 239:	83 e0 0f             	and    $0xf,%eax
 23c:	83 e9 37             	sub    $0x37,%ecx
 23f:	83 ff 06             	cmp    $0x6,%edi
 242:	0f 42 c1             	cmovb  %ecx,%eax
 245:	89 c7                	mov    %eax,%edi
  while(*str){
 247:	0f b6 03             	movzbl (%ebx),%eax
    ret = (ret << 4) | (ch & 0xF);
 24a:	c1 e2 04             	shl    $0x4,%edx
 24d:	09 fa                	or     %edi,%edx
  while(*str){
 24f:	84 c0                	test   %al,%al
 251:	75 d5                	jne    228 <decode+0x158>
  return ret;
 253:	89 55 d4             	mov    %edx,-0x2c(%ebp)
      i = 0;
 256:	31 db                	xor    %ebx,%ebx
        mode = 1;
 258:	bf 01 00 00 00       	mov    $0x1,%edi
        countstr[0] = '0';
 25d:	c7 45 e3 30 30 30 30 	movl   $0x30303030,-0x1d(%ebp)
        mode = 1;
 264:	e9 97 fe ff ff       	jmp    100 <decode+0x30>
      i = 0;
 269:	31 db                	xor    %ebx,%ebx
        mode = 0;
 26b:	31 ff                	xor    %edi,%edi
 26d:	e9 8e fe ff ff       	jmp    100 <decode+0x30>
 272:	66 90                	xchg   %ax,%ax
 274:	66 90                	xchg   %ax,%ax
 276:	66 90                	xchg   %ax,%ax
 278:	66 90                	xchg   %ax,%ax
 27a:	66 90                	xchg   %ax,%ax
 27c:	66 90                	xchg   %ax,%ax
 27e:	66 90                	xchg   %ax,%ax

00000280 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 280:	f3 0f 1e fb          	endbr32 
 284:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 285:	31 c0                	xor    %eax,%eax
{
 287:	89 e5                	mov    %esp,%ebp
 289:	53                   	push   %ebx
 28a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 28d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 290:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 294:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 297:	83 c0 01             	add    $0x1,%eax
 29a:	84 d2                	test   %dl,%dl
 29c:	75 f2                	jne    290 <strcpy+0x10>
    ;
  return os;
}
 29e:	89 c8                	mov    %ecx,%eax
 2a0:	5b                   	pop    %ebx
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    
 2a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	53                   	push   %ebx
 2b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2bb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2be:	0f b6 01             	movzbl (%ecx),%eax
 2c1:	0f b6 1a             	movzbl (%edx),%ebx
 2c4:	84 c0                	test   %al,%al
 2c6:	75 19                	jne    2e1 <strcmp+0x31>
 2c8:	eb 26                	jmp    2f0 <strcmp+0x40>
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2d0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 2d4:	83 c1 01             	add    $0x1,%ecx
 2d7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 2da:	0f b6 1a             	movzbl (%edx),%ebx
 2dd:	84 c0                	test   %al,%al
 2df:	74 0f                	je     2f0 <strcmp+0x40>
 2e1:	38 d8                	cmp    %bl,%al
 2e3:	74 eb                	je     2d0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 2e5:	29 d8                	sub    %ebx,%eax
}
 2e7:	5b                   	pop    %ebx
 2e8:	5d                   	pop    %ebp
 2e9:	c3                   	ret    
 2ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2f0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 2f2:	29 d8                	sub    %ebx,%eax
}
 2f4:	5b                   	pop    %ebx
 2f5:	5d                   	pop    %ebp
 2f6:	c3                   	ret    
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax

00000300 <strlen>:

uint
strlen(const char *s)
{
 300:	f3 0f 1e fb          	endbr32 
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 30a:	80 3a 00             	cmpb   $0x0,(%edx)
 30d:	74 21                	je     330 <strlen+0x30>
 30f:	31 c0                	xor    %eax,%eax
 311:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 318:	83 c0 01             	add    $0x1,%eax
 31b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 31f:	89 c1                	mov    %eax,%ecx
 321:	75 f5                	jne    318 <strlen+0x18>
    ;
  return n;
}
 323:	89 c8                	mov    %ecx,%eax
 325:	5d                   	pop    %ebp
 326:	c3                   	ret    
 327:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 330:	31 c9                	xor    %ecx,%ecx
}
 332:	5d                   	pop    %ebp
 333:	89 c8                	mov    %ecx,%eax
 335:	c3                   	ret    
 336:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33d:	8d 76 00             	lea    0x0(%esi),%esi

00000340 <memset>:

void*
memset(void *dst, int c, uint n)
{
 340:	f3 0f 1e fb          	endbr32 
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	57                   	push   %edi
 348:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 34b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 34e:	8b 45 0c             	mov    0xc(%ebp),%eax
 351:	89 d7                	mov    %edx,%edi
 353:	fc                   	cld    
 354:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 356:	89 d0                	mov    %edx,%eax
 358:	5f                   	pop    %edi
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret    
 35b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 35f:	90                   	nop

00000360 <strchr>:

char*
strchr(const char *s, char c)
{
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	8b 45 08             	mov    0x8(%ebp),%eax
 36a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 36e:	0f b6 10             	movzbl (%eax),%edx
 371:	84 d2                	test   %dl,%dl
 373:	75 16                	jne    38b <strchr+0x2b>
 375:	eb 21                	jmp    398 <strchr+0x38>
 377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37e:	66 90                	xchg   %ax,%ax
 380:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 384:	83 c0 01             	add    $0x1,%eax
 387:	84 d2                	test   %dl,%dl
 389:	74 0d                	je     398 <strchr+0x38>
    if(*s == c)
 38b:	38 d1                	cmp    %dl,%cl
 38d:	75 f1                	jne    380 <strchr+0x20>
      return (char*)s;
  return 0;
}
 38f:	5d                   	pop    %ebp
 390:	c3                   	ret    
 391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 398:	31 c0                	xor    %eax,%eax
}
 39a:	5d                   	pop    %ebp
 39b:	c3                   	ret    
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <gets>:

char*
gets(char *buf, int max)
{
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	57                   	push   %edi
 3a8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3a9:	31 f6                	xor    %esi,%esi
{
 3ab:	53                   	push   %ebx
 3ac:	89 f3                	mov    %esi,%ebx
 3ae:	83 ec 1c             	sub    $0x1c,%esp
 3b1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 3b4:	eb 33                	jmp    3e9 <gets+0x49>
 3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 3c0:	83 ec 04             	sub    $0x4,%esp
 3c3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3c6:	6a 01                	push   $0x1
 3c8:	50                   	push   %eax
 3c9:	6a 00                	push   $0x0
 3cb:	e8 2b 01 00 00       	call   4fb <read>
    if(cc < 1)
 3d0:	83 c4 10             	add    $0x10,%esp
 3d3:	85 c0                	test   %eax,%eax
 3d5:	7e 1c                	jle    3f3 <gets+0x53>
      break;
    buf[i++] = c;
 3d7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3db:	83 c7 01             	add    $0x1,%edi
 3de:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 3e1:	3c 0a                	cmp    $0xa,%al
 3e3:	74 23                	je     408 <gets+0x68>
 3e5:	3c 0d                	cmp    $0xd,%al
 3e7:	74 1f                	je     408 <gets+0x68>
  for(i=0; i+1 < max; ){
 3e9:	83 c3 01             	add    $0x1,%ebx
 3ec:	89 fe                	mov    %edi,%esi
 3ee:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3f1:	7c cd                	jl     3c0 <gets+0x20>
 3f3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 3f5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 3f8:	c6 03 00             	movb   $0x0,(%ebx)
}
 3fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3fe:	5b                   	pop    %ebx
 3ff:	5e                   	pop    %esi
 400:	5f                   	pop    %edi
 401:	5d                   	pop    %ebp
 402:	c3                   	ret    
 403:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 407:	90                   	nop
 408:	8b 75 08             	mov    0x8(%ebp),%esi
 40b:	8b 45 08             	mov    0x8(%ebp),%eax
 40e:	01 de                	add    %ebx,%esi
 410:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 412:	c6 03 00             	movb   $0x0,(%ebx)
}
 415:	8d 65 f4             	lea    -0xc(%ebp),%esp
 418:	5b                   	pop    %ebx
 419:	5e                   	pop    %esi
 41a:	5f                   	pop    %edi
 41b:	5d                   	pop    %ebp
 41c:	c3                   	ret    
 41d:	8d 76 00             	lea    0x0(%esi),%esi

00000420 <stat>:

int
stat(const char *n, struct stat *st)
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	56                   	push   %esi
 428:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 429:	83 ec 08             	sub    $0x8,%esp
 42c:	6a 00                	push   $0x0
 42e:	ff 75 08             	pushl  0x8(%ebp)
 431:	e8 ed 00 00 00       	call   523 <open>
  if(fd < 0)
 436:	83 c4 10             	add    $0x10,%esp
 439:	85 c0                	test   %eax,%eax
 43b:	78 2b                	js     468 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 43d:	83 ec 08             	sub    $0x8,%esp
 440:	ff 75 0c             	pushl  0xc(%ebp)
 443:	89 c3                	mov    %eax,%ebx
 445:	50                   	push   %eax
 446:	e8 f0 00 00 00       	call   53b <fstat>
  close(fd);
 44b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 44e:	89 c6                	mov    %eax,%esi
  close(fd);
 450:	e8 b6 00 00 00       	call   50b <close>
  return r;
 455:	83 c4 10             	add    $0x10,%esp
}
 458:	8d 65 f8             	lea    -0x8(%ebp),%esp
 45b:	89 f0                	mov    %esi,%eax
 45d:	5b                   	pop    %ebx
 45e:	5e                   	pop    %esi
 45f:	5d                   	pop    %ebp
 460:	c3                   	ret    
 461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 468:	be ff ff ff ff       	mov    $0xffffffff,%esi
 46d:	eb e9                	jmp    458 <stat+0x38>
 46f:	90                   	nop

00000470 <atoi>:

int
atoi(const char *s)
{
 470:	f3 0f 1e fb          	endbr32 
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
 477:	53                   	push   %ebx
 478:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 47b:	0f be 02             	movsbl (%edx),%eax
 47e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 481:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 484:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 489:	77 1a                	ja     4a5 <atoi+0x35>
 48b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop
    n = n*10 + *s++ - '0';
 490:	83 c2 01             	add    $0x1,%edx
 493:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 496:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 49a:	0f be 02             	movsbl (%edx),%eax
 49d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4a0:	80 fb 09             	cmp    $0x9,%bl
 4a3:	76 eb                	jbe    490 <atoi+0x20>
  return n;
}
 4a5:	89 c8                	mov    %ecx,%eax
 4a7:	5b                   	pop    %ebx
 4a8:	5d                   	pop    %ebp
 4a9:	c3                   	ret    
 4aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4b0:	f3 0f 1e fb          	endbr32 
 4b4:	55                   	push   %ebp
 4b5:	89 e5                	mov    %esp,%ebp
 4b7:	57                   	push   %edi
 4b8:	8b 45 10             	mov    0x10(%ebp),%eax
 4bb:	8b 55 08             	mov    0x8(%ebp),%edx
 4be:	56                   	push   %esi
 4bf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4c2:	85 c0                	test   %eax,%eax
 4c4:	7e 0f                	jle    4d5 <memmove+0x25>
 4c6:	01 d0                	add    %edx,%eax
  dst = vdst;
 4c8:	89 d7                	mov    %edx,%edi
 4ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 4d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 4d1:	39 f8                	cmp    %edi,%eax
 4d3:	75 fb                	jne    4d0 <memmove+0x20>
  return vdst;
}
 4d5:	5e                   	pop    %esi
 4d6:	89 d0                	mov    %edx,%eax
 4d8:	5f                   	pop    %edi
 4d9:	5d                   	pop    %ebp
 4da:	c3                   	ret    

000004db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4db:	b8 01 00 00 00       	mov    $0x1,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <exit>:
SYSCALL(exit)
 4e3:	b8 02 00 00 00       	mov    $0x2,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <wait>:
SYSCALL(wait)
 4eb:	b8 03 00 00 00       	mov    $0x3,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <pipe>:
SYSCALL(pipe)
 4f3:	b8 04 00 00 00       	mov    $0x4,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <read>:
SYSCALL(read)
 4fb:	b8 05 00 00 00       	mov    $0x5,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <write>:
SYSCALL(write)
 503:	b8 10 00 00 00       	mov    $0x10,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <close>:
SYSCALL(close)
 50b:	b8 15 00 00 00       	mov    $0x15,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <kill>:
SYSCALL(kill)
 513:	b8 06 00 00 00       	mov    $0x6,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <exec>:
SYSCALL(exec)
 51b:	b8 07 00 00 00       	mov    $0x7,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <open>:
SYSCALL(open)
 523:	b8 0f 00 00 00       	mov    $0xf,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <mknod>:
SYSCALL(mknod)
 52b:	b8 11 00 00 00       	mov    $0x11,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <unlink>:
SYSCALL(unlink)
 533:	b8 12 00 00 00       	mov    $0x12,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <fstat>:
SYSCALL(fstat)
 53b:	b8 08 00 00 00       	mov    $0x8,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <link>:
SYSCALL(link)
 543:	b8 13 00 00 00       	mov    $0x13,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <mkdir>:
SYSCALL(mkdir)
 54b:	b8 14 00 00 00       	mov    $0x14,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <chdir>:
SYSCALL(chdir)
 553:	b8 09 00 00 00       	mov    $0x9,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <dup>:
SYSCALL(dup)
 55b:	b8 0a 00 00 00       	mov    $0xa,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <getpid>:
SYSCALL(getpid)
 563:	b8 0b 00 00 00       	mov    $0xb,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <sbrk>:
SYSCALL(sbrk)
 56b:	b8 0c 00 00 00       	mov    $0xc,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <sleep>:
SYSCALL(sleep)
 573:	b8 0d 00 00 00       	mov    $0xd,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <uptime>:
SYSCALL(uptime)
 57b:	b8 0e 00 00 00       	mov    $0xe,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    
 583:	66 90                	xchg   %ax,%ax
 585:	66 90                	xchg   %ax,%ax
 587:	66 90                	xchg   %ax,%ax
 589:	66 90                	xchg   %ax,%ax
 58b:	66 90                	xchg   %ax,%ax
 58d:	66 90                	xchg   %ax,%ax
 58f:	90                   	nop

00000590 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	83 ec 3c             	sub    $0x3c,%esp
 599:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 59c:	89 d1                	mov    %edx,%ecx
{
 59e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5a1:	85 d2                	test   %edx,%edx
 5a3:	0f 89 7f 00 00 00    	jns    628 <printint+0x98>
 5a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5ad:	74 79                	je     628 <printint+0x98>
    neg = 1;
 5af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5b8:	31 db                	xor    %ebx,%ebx
 5ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5c0:	89 c8                	mov    %ecx,%eax
 5c2:	31 d2                	xor    %edx,%edx
 5c4:	89 cf                	mov    %ecx,%edi
 5c6:	f7 75 c4             	divl   -0x3c(%ebp)
 5c9:	0f b6 92 04 0a 00 00 	movzbl 0xa04(%edx),%edx
 5d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5d3:	89 d8                	mov    %ebx,%eax
 5d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5e1:	76 dd                	jbe    5c0 <printint+0x30>
  if(neg)
 5e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5e6:	85 c9                	test   %ecx,%ecx
 5e8:	74 0c                	je     5f6 <printint+0x66>
    buf[i++] = '-';
 5ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 5f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 5f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 5f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 5fd:	eb 07                	jmp    606 <printint+0x76>
 5ff:	90                   	nop
 600:	0f b6 13             	movzbl (%ebx),%edx
 603:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 606:	83 ec 04             	sub    $0x4,%esp
 609:	88 55 d7             	mov    %dl,-0x29(%ebp)
 60c:	6a 01                	push   $0x1
 60e:	56                   	push   %esi
 60f:	57                   	push   %edi
 610:	e8 ee fe ff ff       	call   503 <write>
  while(--i >= 0)
 615:	83 c4 10             	add    $0x10,%esp
 618:	39 de                	cmp    %ebx,%esi
 61a:	75 e4                	jne    600 <printint+0x70>
    putc(fd, buf[i]);
}
 61c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61f:	5b                   	pop    %ebx
 620:	5e                   	pop    %esi
 621:	5f                   	pop    %edi
 622:	5d                   	pop    %ebp
 623:	c3                   	ret    
 624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 628:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 62f:	eb 87                	jmp    5b8 <printint+0x28>
 631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop

00000640 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 640:	f3 0f 1e fb          	endbr32 
 644:	55                   	push   %ebp
 645:	89 e5                	mov    %esp,%ebp
 647:	57                   	push   %edi
 648:	56                   	push   %esi
 649:	53                   	push   %ebx
 64a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 64d:	8b 75 0c             	mov    0xc(%ebp),%esi
 650:	0f b6 1e             	movzbl (%esi),%ebx
 653:	84 db                	test   %bl,%bl
 655:	0f 84 b4 00 00 00    	je     70f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 65b:	8d 45 10             	lea    0x10(%ebp),%eax
 65e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 661:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 664:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 666:	89 45 d0             	mov    %eax,-0x30(%ebp)
 669:	eb 33                	jmp    69e <printf+0x5e>
 66b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop
 670:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 673:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 678:	83 f8 25             	cmp    $0x25,%eax
 67b:	74 17                	je     694 <printf+0x54>
  write(fd, &c, 1);
 67d:	83 ec 04             	sub    $0x4,%esp
 680:	88 5d e7             	mov    %bl,-0x19(%ebp)
 683:	6a 01                	push   $0x1
 685:	57                   	push   %edi
 686:	ff 75 08             	pushl  0x8(%ebp)
 689:	e8 75 fe ff ff       	call   503 <write>
 68e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 691:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 694:	0f b6 1e             	movzbl (%esi),%ebx
 697:	83 c6 01             	add    $0x1,%esi
 69a:	84 db                	test   %bl,%bl
 69c:	74 71                	je     70f <printf+0xcf>
    c = fmt[i] & 0xff;
 69e:	0f be cb             	movsbl %bl,%ecx
 6a1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 6a4:	85 d2                	test   %edx,%edx
 6a6:	74 c8                	je     670 <printf+0x30>
      }
    } else if(state == '%'){
 6a8:	83 fa 25             	cmp    $0x25,%edx
 6ab:	75 e7                	jne    694 <printf+0x54>
      if(c == 'd'){
 6ad:	83 f8 64             	cmp    $0x64,%eax
 6b0:	0f 84 9a 00 00 00    	je     750 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6b6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 6bc:	83 f9 70             	cmp    $0x70,%ecx
 6bf:	74 5f                	je     720 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6c1:	83 f8 73             	cmp    $0x73,%eax
 6c4:	0f 84 d6 00 00 00    	je     7a0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6ca:	83 f8 63             	cmp    $0x63,%eax
 6cd:	0f 84 8d 00 00 00    	je     760 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6d3:	83 f8 25             	cmp    $0x25,%eax
 6d6:	0f 84 b4 00 00 00    	je     790 <printf+0x150>
  write(fd, &c, 1);
 6dc:	83 ec 04             	sub    $0x4,%esp
 6df:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6e3:	6a 01                	push   $0x1
 6e5:	57                   	push   %edi
 6e6:	ff 75 08             	pushl  0x8(%ebp)
 6e9:	e8 15 fe ff ff       	call   503 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 6ee:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 6f1:	83 c4 0c             	add    $0xc,%esp
 6f4:	6a 01                	push   $0x1
 6f6:	83 c6 01             	add    $0x1,%esi
 6f9:	57                   	push   %edi
 6fa:	ff 75 08             	pushl  0x8(%ebp)
 6fd:	e8 01 fe ff ff       	call   503 <write>
  for(i = 0; fmt[i]; i++){
 702:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 706:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 709:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 70b:	84 db                	test   %bl,%bl
 70d:	75 8f                	jne    69e <printf+0x5e>
    }
  }
}
 70f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 712:	5b                   	pop    %ebx
 713:	5e                   	pop    %esi
 714:	5f                   	pop    %edi
 715:	5d                   	pop    %ebp
 716:	c3                   	ret    
 717:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 720:	83 ec 0c             	sub    $0xc,%esp
 723:	b9 10 00 00 00       	mov    $0x10,%ecx
 728:	6a 00                	push   $0x0
 72a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 72d:	8b 45 08             	mov    0x8(%ebp),%eax
 730:	8b 13                	mov    (%ebx),%edx
 732:	e8 59 fe ff ff       	call   590 <printint>
        ap++;
 737:	89 d8                	mov    %ebx,%eax
 739:	83 c4 10             	add    $0x10,%esp
      state = 0;
 73c:	31 d2                	xor    %edx,%edx
        ap++;
 73e:	83 c0 04             	add    $0x4,%eax
 741:	89 45 d0             	mov    %eax,-0x30(%ebp)
 744:	e9 4b ff ff ff       	jmp    694 <printf+0x54>
 749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 750:	83 ec 0c             	sub    $0xc,%esp
 753:	b9 0a 00 00 00       	mov    $0xa,%ecx
 758:	6a 01                	push   $0x1
 75a:	eb ce                	jmp    72a <printf+0xea>
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 760:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 763:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 766:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 768:	6a 01                	push   $0x1
        ap++;
 76a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 76d:	57                   	push   %edi
 76e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 771:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 774:	e8 8a fd ff ff       	call   503 <write>
        ap++;
 779:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 77c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 77f:	31 d2                	xor    %edx,%edx
 781:	e9 0e ff ff ff       	jmp    694 <printf+0x54>
 786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 790:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 793:	83 ec 04             	sub    $0x4,%esp
 796:	e9 59 ff ff ff       	jmp    6f4 <printf+0xb4>
 79b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop
        s = (char*)*ap;
 7a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7a3:	8b 18                	mov    (%eax),%ebx
        ap++;
 7a5:	83 c0 04             	add    $0x4,%eax
 7a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7ab:	85 db                	test   %ebx,%ebx
 7ad:	74 17                	je     7c6 <printf+0x186>
        while(*s != 0){
 7af:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7b2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7b4:	84 c0                	test   %al,%al
 7b6:	0f 84 d8 fe ff ff    	je     694 <printf+0x54>
 7bc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7bf:	89 de                	mov    %ebx,%esi
 7c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7c4:	eb 1a                	jmp    7e0 <printf+0x1a0>
          s = "(null)";
 7c6:	bb fa 09 00 00       	mov    $0x9fa,%ebx
        while(*s != 0){
 7cb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 7ce:	b8 28 00 00 00       	mov    $0x28,%eax
 7d3:	89 de                	mov    %ebx,%esi
 7d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop
  write(fd, &c, 1);
 7e0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7e3:	83 c6 01             	add    $0x1,%esi
 7e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7e9:	6a 01                	push   $0x1
 7eb:	57                   	push   %edi
 7ec:	53                   	push   %ebx
 7ed:	e8 11 fd ff ff       	call   503 <write>
        while(*s != 0){
 7f2:	0f b6 06             	movzbl (%esi),%eax
 7f5:	83 c4 10             	add    $0x10,%esp
 7f8:	84 c0                	test   %al,%al
 7fa:	75 e4                	jne    7e0 <printf+0x1a0>
 7fc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 7ff:	31 d2                	xor    %edx,%edx
 801:	e9 8e fe ff ff       	jmp    694 <printf+0x54>
 806:	66 90                	xchg   %ax,%ax
 808:	66 90                	xchg   %ax,%ax
 80a:	66 90                	xchg   %ax,%ax
 80c:	66 90                	xchg   %ax,%ax
 80e:	66 90                	xchg   %ax,%ax

00000810 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 810:	f3 0f 1e fb          	endbr32 
 814:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 815:	a1 fc 0c 00 00       	mov    0xcfc,%eax
{
 81a:	89 e5                	mov    %esp,%ebp
 81c:	57                   	push   %edi
 81d:	56                   	push   %esi
 81e:	53                   	push   %ebx
 81f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 822:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 824:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 827:	39 c8                	cmp    %ecx,%eax
 829:	73 15                	jae    840 <free+0x30>
 82b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 82f:	90                   	nop
 830:	39 d1                	cmp    %edx,%ecx
 832:	72 14                	jb     848 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 834:	39 d0                	cmp    %edx,%eax
 836:	73 10                	jae    848 <free+0x38>
{
 838:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 83a:	8b 10                	mov    (%eax),%edx
 83c:	39 c8                	cmp    %ecx,%eax
 83e:	72 f0                	jb     830 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 840:	39 d0                	cmp    %edx,%eax
 842:	72 f4                	jb     838 <free+0x28>
 844:	39 d1                	cmp    %edx,%ecx
 846:	73 f0                	jae    838 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 848:	8b 73 fc             	mov    -0x4(%ebx),%esi
 84b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 84e:	39 fa                	cmp    %edi,%edx
 850:	74 1e                	je     870 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 852:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 855:	8b 50 04             	mov    0x4(%eax),%edx
 858:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 85b:	39 f1                	cmp    %esi,%ecx
 85d:	74 28                	je     887 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 85f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 861:	5b                   	pop    %ebx
  freep = p;
 862:	a3 fc 0c 00 00       	mov    %eax,0xcfc
}
 867:	5e                   	pop    %esi
 868:	5f                   	pop    %edi
 869:	5d                   	pop    %ebp
 86a:	c3                   	ret    
 86b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 86f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 870:	03 72 04             	add    0x4(%edx),%esi
 873:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 876:	8b 10                	mov    (%eax),%edx
 878:	8b 12                	mov    (%edx),%edx
 87a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 87d:	8b 50 04             	mov    0x4(%eax),%edx
 880:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 883:	39 f1                	cmp    %esi,%ecx
 885:	75 d8                	jne    85f <free+0x4f>
    p->s.size += bp->s.size;
 887:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 88a:	a3 fc 0c 00 00       	mov    %eax,0xcfc
    p->s.size += bp->s.size;
 88f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 892:	8b 53 f8             	mov    -0x8(%ebx),%edx
 895:	89 10                	mov    %edx,(%eax)
}
 897:	5b                   	pop    %ebx
 898:	5e                   	pop    %esi
 899:	5f                   	pop    %edi
 89a:	5d                   	pop    %ebp
 89b:	c3                   	ret    
 89c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8a0:	f3 0f 1e fb          	endbr32 
 8a4:	55                   	push   %ebp
 8a5:	89 e5                	mov    %esp,%ebp
 8a7:	57                   	push   %edi
 8a8:	56                   	push   %esi
 8a9:	53                   	push   %ebx
 8aa:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8ad:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8b0:	8b 3d fc 0c 00 00    	mov    0xcfc,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b6:	8d 70 07             	lea    0x7(%eax),%esi
 8b9:	c1 ee 03             	shr    $0x3,%esi
 8bc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 8bf:	85 ff                	test   %edi,%edi
 8c1:	0f 84 a9 00 00 00    	je     970 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 8c9:	8b 48 04             	mov    0x4(%eax),%ecx
 8cc:	39 f1                	cmp    %esi,%ecx
 8ce:	73 6d                	jae    93d <malloc+0x9d>
 8d0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 8d6:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8db:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8de:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 8e5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8e8:	eb 17                	jmp    901 <malloc+0x61>
 8ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 8f2:	8b 4a 04             	mov    0x4(%edx),%ecx
 8f5:	39 f1                	cmp    %esi,%ecx
 8f7:	73 4f                	jae    948 <malloc+0xa8>
 8f9:	8b 3d fc 0c 00 00    	mov    0xcfc,%edi
 8ff:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 901:	39 c7                	cmp    %eax,%edi
 903:	75 eb                	jne    8f0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 905:	83 ec 0c             	sub    $0xc,%esp
 908:	ff 75 e4             	pushl  -0x1c(%ebp)
 90b:	e8 5b fc ff ff       	call   56b <sbrk>
  if(p == (char*)-1)
 910:	83 c4 10             	add    $0x10,%esp
 913:	83 f8 ff             	cmp    $0xffffffff,%eax
 916:	74 1b                	je     933 <malloc+0x93>
  hp->s.size = nu;
 918:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 91b:	83 ec 0c             	sub    $0xc,%esp
 91e:	83 c0 08             	add    $0x8,%eax
 921:	50                   	push   %eax
 922:	e8 e9 fe ff ff       	call   810 <free>
  return freep;
 927:	a1 fc 0c 00 00       	mov    0xcfc,%eax
      if((p = morecore(nunits)) == 0)
 92c:	83 c4 10             	add    $0x10,%esp
 92f:	85 c0                	test   %eax,%eax
 931:	75 bd                	jne    8f0 <malloc+0x50>
        return 0;
  }
}
 933:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 936:	31 c0                	xor    %eax,%eax
}
 938:	5b                   	pop    %ebx
 939:	5e                   	pop    %esi
 93a:	5f                   	pop    %edi
 93b:	5d                   	pop    %ebp
 93c:	c3                   	ret    
    if(p->s.size >= nunits){
 93d:	89 c2                	mov    %eax,%edx
 93f:	89 f8                	mov    %edi,%eax
 941:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 948:	39 ce                	cmp    %ecx,%esi
 94a:	74 54                	je     9a0 <malloc+0x100>
        p->s.size -= nunits;
 94c:	29 f1                	sub    %esi,%ecx
 94e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 951:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 954:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 957:	a3 fc 0c 00 00       	mov    %eax,0xcfc
}
 95c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 95f:	8d 42 08             	lea    0x8(%edx),%eax
}
 962:	5b                   	pop    %ebx
 963:	5e                   	pop    %esi
 964:	5f                   	pop    %edi
 965:	5d                   	pop    %ebp
 966:	c3                   	ret    
 967:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 96e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 970:	c7 05 fc 0c 00 00 00 	movl   $0xd00,0xcfc
 977:	0d 00 00 
    base.s.size = 0;
 97a:	bf 00 0d 00 00       	mov    $0xd00,%edi
    base.s.ptr = freep = prevp = &base;
 97f:	c7 05 00 0d 00 00 00 	movl   $0xd00,0xd00
 986:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 989:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 98b:	c7 05 04 0d 00 00 00 	movl   $0x0,0xd04
 992:	00 00 00 
    if(p->s.size >= nunits){
 995:	e9 36 ff ff ff       	jmp    8d0 <malloc+0x30>
 99a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9a0:	8b 0a                	mov    (%edx),%ecx
 9a2:	89 08                	mov    %ecx,(%eax)
 9a4:	eb b1                	jmp    957 <malloc+0xb7>
