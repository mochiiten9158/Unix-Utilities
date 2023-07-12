
_tester:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include <types.h>
#include <user.h>

int main (int argc, char * argv[])
{
   0:	f3 0f 1e fb          	endbr32 
    return 0;
}
   4:	31 c0                	xor    %eax,%eax
   6:	c3                   	ret    
   7:	66 90                	xchg   %ax,%ax
   9:	66 90                	xchg   %ax,%ax
   b:	66 90                	xchg   %ax,%ax
   d:	66 90                	xchg   %ax,%ax
   f:	90                   	nop

00000010 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  10:	f3 0f 1e fb          	endbr32 
  14:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  15:	31 c0                	xor    %eax,%eax
{
  17:	89 e5                	mov    %esp,%ebp
  19:	53                   	push   %ebx
  1a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
  20:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  24:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  27:	83 c0 01             	add    $0x1,%eax
  2a:	84 d2                	test   %dl,%dl
  2c:	75 f2                	jne    20 <strcpy+0x10>
    ;
  return os;
}
  2e:	89 c8                	mov    %ecx,%eax
  30:	5b                   	pop    %ebx
  31:	5d                   	pop    %ebp
  32:	c3                   	ret    
  33:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000040 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  40:	f3 0f 1e fb          	endbr32 
  44:	55                   	push   %ebp
  45:	89 e5                	mov    %esp,%ebp
  47:	53                   	push   %ebx
  48:	8b 4d 08             	mov    0x8(%ebp),%ecx
  4b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  4e:	0f b6 01             	movzbl (%ecx),%eax
  51:	0f b6 1a             	movzbl (%edx),%ebx
  54:	84 c0                	test   %al,%al
  56:	75 19                	jne    71 <strcmp+0x31>
  58:	eb 26                	jmp    80 <strcmp+0x40>
  5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  60:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  64:	83 c1 01             	add    $0x1,%ecx
  67:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  6a:	0f b6 1a             	movzbl (%edx),%ebx
  6d:	84 c0                	test   %al,%al
  6f:	74 0f                	je     80 <strcmp+0x40>
  71:	38 d8                	cmp    %bl,%al
  73:	74 eb                	je     60 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  75:	29 d8                	sub    %ebx,%eax
}
  77:	5b                   	pop    %ebx
  78:	5d                   	pop    %ebp
  79:	c3                   	ret    
  7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  80:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  82:	29 d8                	sub    %ebx,%eax
}
  84:	5b                   	pop    %ebx
  85:	5d                   	pop    %ebp
  86:	c3                   	ret    
  87:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8e:	66 90                	xchg   %ax,%ax

00000090 <strlen>:

uint
strlen(const char *s)
{
  90:	f3 0f 1e fb          	endbr32 
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  9a:	80 3a 00             	cmpb   $0x0,(%edx)
  9d:	74 21                	je     c0 <strlen+0x30>
  9f:	31 c0                	xor    %eax,%eax
  a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  a8:	83 c0 01             	add    $0x1,%eax
  ab:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  af:	89 c1                	mov    %eax,%ecx
  b1:	75 f5                	jne    a8 <strlen+0x18>
    ;
  return n;
}
  b3:	89 c8                	mov    %ecx,%eax
  b5:	5d                   	pop    %ebp
  b6:	c3                   	ret    
  b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  be:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
  c0:	31 c9                	xor    %ecx,%ecx
}
  c2:	5d                   	pop    %ebp
  c3:	89 c8                	mov    %ecx,%eax
  c5:	c3                   	ret    
  c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  cd:	8d 76 00             	lea    0x0(%esi),%esi

000000d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  d0:	f3 0f 1e fb          	endbr32 
  d4:	55                   	push   %ebp
  d5:	89 e5                	mov    %esp,%ebp
  d7:	57                   	push   %edi
  d8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  db:	8b 4d 10             	mov    0x10(%ebp),%ecx
  de:	8b 45 0c             	mov    0xc(%ebp),%eax
  e1:	89 d7                	mov    %edx,%edi
  e3:	fc                   	cld    
  e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  e6:	89 d0                	mov    %edx,%eax
  e8:	5f                   	pop    %edi
  e9:	5d                   	pop    %ebp
  ea:	c3                   	ret    
  eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ef:	90                   	nop

000000f0 <strchr>:

char*
strchr(const char *s, char c)
{
  f0:	f3 0f 1e fb          	endbr32 
  f4:	55                   	push   %ebp
  f5:	89 e5                	mov    %esp,%ebp
  f7:	8b 45 08             	mov    0x8(%ebp),%eax
  fa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  fe:	0f b6 10             	movzbl (%eax),%edx
 101:	84 d2                	test   %dl,%dl
 103:	75 16                	jne    11b <strchr+0x2b>
 105:	eb 21                	jmp    128 <strchr+0x38>
 107:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10e:	66 90                	xchg   %ax,%ax
 110:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 114:	83 c0 01             	add    $0x1,%eax
 117:	84 d2                	test   %dl,%dl
 119:	74 0d                	je     128 <strchr+0x38>
    if(*s == c)
 11b:	38 d1                	cmp    %dl,%cl
 11d:	75 f1                	jne    110 <strchr+0x20>
      return (char*)s;
  return 0;
}
 11f:	5d                   	pop    %ebp
 120:	c3                   	ret    
 121:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 128:	31 c0                	xor    %eax,%eax
}
 12a:	5d                   	pop    %ebp
 12b:	c3                   	ret    
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000130 <gets>:

char*
gets(char *buf, int max)
{
 130:	f3 0f 1e fb          	endbr32 
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	57                   	push   %edi
 138:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 139:	31 f6                	xor    %esi,%esi
{
 13b:	53                   	push   %ebx
 13c:	89 f3                	mov    %esi,%ebx
 13e:	83 ec 1c             	sub    $0x1c,%esp
 141:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 144:	eb 33                	jmp    179 <gets+0x49>
 146:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 150:	83 ec 04             	sub    $0x4,%esp
 153:	8d 45 e7             	lea    -0x19(%ebp),%eax
 156:	6a 01                	push   $0x1
 158:	50                   	push   %eax
 159:	6a 00                	push   $0x0
 15b:	e8 2b 01 00 00       	call   28b <read>
    if(cc < 1)
 160:	83 c4 10             	add    $0x10,%esp
 163:	85 c0                	test   %eax,%eax
 165:	7e 1c                	jle    183 <gets+0x53>
      break;
    buf[i++] = c;
 167:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 16b:	83 c7 01             	add    $0x1,%edi
 16e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 171:	3c 0a                	cmp    $0xa,%al
 173:	74 23                	je     198 <gets+0x68>
 175:	3c 0d                	cmp    $0xd,%al
 177:	74 1f                	je     198 <gets+0x68>
  for(i=0; i+1 < max; ){
 179:	83 c3 01             	add    $0x1,%ebx
 17c:	89 fe                	mov    %edi,%esi
 17e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 181:	7c cd                	jl     150 <gets+0x20>
 183:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 185:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 188:	c6 03 00             	movb   $0x0,(%ebx)
}
 18b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 18e:	5b                   	pop    %ebx
 18f:	5e                   	pop    %esi
 190:	5f                   	pop    %edi
 191:	5d                   	pop    %ebp
 192:	c3                   	ret    
 193:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 197:	90                   	nop
 198:	8b 75 08             	mov    0x8(%ebp),%esi
 19b:	8b 45 08             	mov    0x8(%ebp),%eax
 19e:	01 de                	add    %ebx,%esi
 1a0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1a2:	c6 03 00             	movb   $0x0,(%ebx)
}
 1a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1a8:	5b                   	pop    %ebx
 1a9:	5e                   	pop    %esi
 1aa:	5f                   	pop    %edi
 1ab:	5d                   	pop    %ebp
 1ac:	c3                   	ret    
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1b0:	f3 0f 1e fb          	endbr32 
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	56                   	push   %esi
 1b8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b9:	83 ec 08             	sub    $0x8,%esp
 1bc:	6a 00                	push   $0x0
 1be:	ff 75 08             	pushl  0x8(%ebp)
 1c1:	e8 ed 00 00 00       	call   2b3 <open>
  if(fd < 0)
 1c6:	83 c4 10             	add    $0x10,%esp
 1c9:	85 c0                	test   %eax,%eax
 1cb:	78 2b                	js     1f8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 1cd:	83 ec 08             	sub    $0x8,%esp
 1d0:	ff 75 0c             	pushl  0xc(%ebp)
 1d3:	89 c3                	mov    %eax,%ebx
 1d5:	50                   	push   %eax
 1d6:	e8 f0 00 00 00       	call   2cb <fstat>
  close(fd);
 1db:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1de:	89 c6                	mov    %eax,%esi
  close(fd);
 1e0:	e8 b6 00 00 00       	call   29b <close>
  return r;
 1e5:	83 c4 10             	add    $0x10,%esp
}
 1e8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1eb:	89 f0                	mov    %esi,%eax
 1ed:	5b                   	pop    %ebx
 1ee:	5e                   	pop    %esi
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    
 1f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 1f8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1fd:	eb e9                	jmp    1e8 <stat+0x38>
 1ff:	90                   	nop

00000200 <atoi>:

int
atoi(const char *s)
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	53                   	push   %ebx
 208:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 20b:	0f be 02             	movsbl (%edx),%eax
 20e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 211:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 214:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 219:	77 1a                	ja     235 <atoi+0x35>
 21b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 21f:	90                   	nop
    n = n*10 + *s++ - '0';
 220:	83 c2 01             	add    $0x1,%edx
 223:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 226:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 22a:	0f be 02             	movsbl (%edx),%eax
 22d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 230:	80 fb 09             	cmp    $0x9,%bl
 233:	76 eb                	jbe    220 <atoi+0x20>
  return n;
}
 235:	89 c8                	mov    %ecx,%eax
 237:	5b                   	pop    %ebx
 238:	5d                   	pop    %ebp
 239:	c3                   	ret    
 23a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000240 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 240:	f3 0f 1e fb          	endbr32 
 244:	55                   	push   %ebp
 245:	89 e5                	mov    %esp,%ebp
 247:	57                   	push   %edi
 248:	8b 45 10             	mov    0x10(%ebp),%eax
 24b:	8b 55 08             	mov    0x8(%ebp),%edx
 24e:	56                   	push   %esi
 24f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 252:	85 c0                	test   %eax,%eax
 254:	7e 0f                	jle    265 <memmove+0x25>
 256:	01 d0                	add    %edx,%eax
  dst = vdst;
 258:	89 d7                	mov    %edx,%edi
 25a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 260:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 261:	39 f8                	cmp    %edi,%eax
 263:	75 fb                	jne    260 <memmove+0x20>
  return vdst;
}
 265:	5e                   	pop    %esi
 266:	89 d0                	mov    %edx,%eax
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    

0000026b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 26b:	b8 01 00 00 00       	mov    $0x1,%eax
 270:	cd 40                	int    $0x40
 272:	c3                   	ret    

00000273 <exit>:
SYSCALL(exit)
 273:	b8 02 00 00 00       	mov    $0x2,%eax
 278:	cd 40                	int    $0x40
 27a:	c3                   	ret    

0000027b <wait>:
SYSCALL(wait)
 27b:	b8 03 00 00 00       	mov    $0x3,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <pipe>:
SYSCALL(pipe)
 283:	b8 04 00 00 00       	mov    $0x4,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <read>:
SYSCALL(read)
 28b:	b8 05 00 00 00       	mov    $0x5,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <write>:
SYSCALL(write)
 293:	b8 10 00 00 00       	mov    $0x10,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <close>:
SYSCALL(close)
 29b:	b8 15 00 00 00       	mov    $0x15,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <kill>:
SYSCALL(kill)
 2a3:	b8 06 00 00 00       	mov    $0x6,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <exec>:
SYSCALL(exec)
 2ab:	b8 07 00 00 00       	mov    $0x7,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <open>:
SYSCALL(open)
 2b3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <mknod>:
SYSCALL(mknod)
 2bb:	b8 11 00 00 00       	mov    $0x11,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <unlink>:
SYSCALL(unlink)
 2c3:	b8 12 00 00 00       	mov    $0x12,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <fstat>:
SYSCALL(fstat)
 2cb:	b8 08 00 00 00       	mov    $0x8,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <link>:
SYSCALL(link)
 2d3:	b8 13 00 00 00       	mov    $0x13,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <mkdir>:
SYSCALL(mkdir)
 2db:	b8 14 00 00 00       	mov    $0x14,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <chdir>:
SYSCALL(chdir)
 2e3:	b8 09 00 00 00       	mov    $0x9,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <dup>:
SYSCALL(dup)
 2eb:	b8 0a 00 00 00       	mov    $0xa,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <getpid>:
SYSCALL(getpid)
 2f3:	b8 0b 00 00 00       	mov    $0xb,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <sbrk>:
SYSCALL(sbrk)
 2fb:	b8 0c 00 00 00       	mov    $0xc,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <sleep>:
SYSCALL(sleep)
 303:	b8 0d 00 00 00       	mov    $0xd,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <uptime>:
SYSCALL(uptime)
 30b:	b8 0e 00 00 00       	mov    $0xe,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    
 313:	66 90                	xchg   %ax,%ax
 315:	66 90                	xchg   %ax,%ax
 317:	66 90                	xchg   %ax,%ax
 319:	66 90                	xchg   %ax,%ax
 31b:	66 90                	xchg   %ax,%ax
 31d:	66 90                	xchg   %ax,%ax
 31f:	90                   	nop

00000320 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	56                   	push   %esi
 325:	53                   	push   %ebx
 326:	83 ec 3c             	sub    $0x3c,%esp
 329:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 32c:	89 d1                	mov    %edx,%ecx
{
 32e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 331:	85 d2                	test   %edx,%edx
 333:	0f 89 7f 00 00 00    	jns    3b8 <printint+0x98>
 339:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 33d:	74 79                	je     3b8 <printint+0x98>
    neg = 1;
 33f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 346:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 348:	31 db                	xor    %ebx,%ebx
 34a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 34d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 350:	89 c8                	mov    %ecx,%eax
 352:	31 d2                	xor    %edx,%edx
 354:	89 cf                	mov    %ecx,%edi
 356:	f7 75 c4             	divl   -0x3c(%ebp)
 359:	0f b6 92 40 07 00 00 	movzbl 0x740(%edx),%edx
 360:	89 45 c0             	mov    %eax,-0x40(%ebp)
 363:	89 d8                	mov    %ebx,%eax
 365:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 368:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 36b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 36e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 371:	76 dd                	jbe    350 <printint+0x30>
  if(neg)
 373:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 376:	85 c9                	test   %ecx,%ecx
 378:	74 0c                	je     386 <printint+0x66>
    buf[i++] = '-';
 37a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 37f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 381:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 386:	8b 7d b8             	mov    -0x48(%ebp),%edi
 389:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 38d:	eb 07                	jmp    396 <printint+0x76>
 38f:	90                   	nop
 390:	0f b6 13             	movzbl (%ebx),%edx
 393:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 396:	83 ec 04             	sub    $0x4,%esp
 399:	88 55 d7             	mov    %dl,-0x29(%ebp)
 39c:	6a 01                	push   $0x1
 39e:	56                   	push   %esi
 39f:	57                   	push   %edi
 3a0:	e8 ee fe ff ff       	call   293 <write>
  while(--i >= 0)
 3a5:	83 c4 10             	add    $0x10,%esp
 3a8:	39 de                	cmp    %ebx,%esi
 3aa:	75 e4                	jne    390 <printint+0x70>
    putc(fd, buf[i]);
}
 3ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3af:	5b                   	pop    %ebx
 3b0:	5e                   	pop    %esi
 3b1:	5f                   	pop    %edi
 3b2:	5d                   	pop    %ebp
 3b3:	c3                   	ret    
 3b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3b8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 3bf:	eb 87                	jmp    348 <printint+0x28>
 3c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3d0:	f3 0f 1e fb          	endbr32 
 3d4:	55                   	push   %ebp
 3d5:	89 e5                	mov    %esp,%ebp
 3d7:	57                   	push   %edi
 3d8:	56                   	push   %esi
 3d9:	53                   	push   %ebx
 3da:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3dd:	8b 75 0c             	mov    0xc(%ebp),%esi
 3e0:	0f b6 1e             	movzbl (%esi),%ebx
 3e3:	84 db                	test   %bl,%bl
 3e5:	0f 84 b4 00 00 00    	je     49f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 3eb:	8d 45 10             	lea    0x10(%ebp),%eax
 3ee:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 3f1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 3f4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 3f6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 3f9:	eb 33                	jmp    42e <printf+0x5e>
 3fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop
 400:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 403:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 408:	83 f8 25             	cmp    $0x25,%eax
 40b:	74 17                	je     424 <printf+0x54>
  write(fd, &c, 1);
 40d:	83 ec 04             	sub    $0x4,%esp
 410:	88 5d e7             	mov    %bl,-0x19(%ebp)
 413:	6a 01                	push   $0x1
 415:	57                   	push   %edi
 416:	ff 75 08             	pushl  0x8(%ebp)
 419:	e8 75 fe ff ff       	call   293 <write>
 41e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 421:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 424:	0f b6 1e             	movzbl (%esi),%ebx
 427:	83 c6 01             	add    $0x1,%esi
 42a:	84 db                	test   %bl,%bl
 42c:	74 71                	je     49f <printf+0xcf>
    c = fmt[i] & 0xff;
 42e:	0f be cb             	movsbl %bl,%ecx
 431:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 434:	85 d2                	test   %edx,%edx
 436:	74 c8                	je     400 <printf+0x30>
      }
    } else if(state == '%'){
 438:	83 fa 25             	cmp    $0x25,%edx
 43b:	75 e7                	jne    424 <printf+0x54>
      if(c == 'd'){
 43d:	83 f8 64             	cmp    $0x64,%eax
 440:	0f 84 9a 00 00 00    	je     4e0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 446:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 44c:	83 f9 70             	cmp    $0x70,%ecx
 44f:	74 5f                	je     4b0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 451:	83 f8 73             	cmp    $0x73,%eax
 454:	0f 84 d6 00 00 00    	je     530 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 45a:	83 f8 63             	cmp    $0x63,%eax
 45d:	0f 84 8d 00 00 00    	je     4f0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 463:	83 f8 25             	cmp    $0x25,%eax
 466:	0f 84 b4 00 00 00    	je     520 <printf+0x150>
  write(fd, &c, 1);
 46c:	83 ec 04             	sub    $0x4,%esp
 46f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 473:	6a 01                	push   $0x1
 475:	57                   	push   %edi
 476:	ff 75 08             	pushl  0x8(%ebp)
 479:	e8 15 fe ff ff       	call   293 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 47e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 481:	83 c4 0c             	add    $0xc,%esp
 484:	6a 01                	push   $0x1
 486:	83 c6 01             	add    $0x1,%esi
 489:	57                   	push   %edi
 48a:	ff 75 08             	pushl  0x8(%ebp)
 48d:	e8 01 fe ff ff       	call   293 <write>
  for(i = 0; fmt[i]; i++){
 492:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 496:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 499:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 49b:	84 db                	test   %bl,%bl
 49d:	75 8f                	jne    42e <printf+0x5e>
    }
  }
}
 49f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a2:	5b                   	pop    %ebx
 4a3:	5e                   	pop    %esi
 4a4:	5f                   	pop    %edi
 4a5:	5d                   	pop    %ebp
 4a6:	c3                   	ret    
 4a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ae:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 4b0:	83 ec 0c             	sub    $0xc,%esp
 4b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4b8:	6a 00                	push   $0x0
 4ba:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4bd:	8b 45 08             	mov    0x8(%ebp),%eax
 4c0:	8b 13                	mov    (%ebx),%edx
 4c2:	e8 59 fe ff ff       	call   320 <printint>
        ap++;
 4c7:	89 d8                	mov    %ebx,%eax
 4c9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4cc:	31 d2                	xor    %edx,%edx
        ap++;
 4ce:	83 c0 04             	add    $0x4,%eax
 4d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4d4:	e9 4b ff ff ff       	jmp    424 <printf+0x54>
 4d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 4e0:	83 ec 0c             	sub    $0xc,%esp
 4e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4e8:	6a 01                	push   $0x1
 4ea:	eb ce                	jmp    4ba <printf+0xea>
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 4f0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 4f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 4f6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 4f8:	6a 01                	push   $0x1
        ap++;
 4fa:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 4fd:	57                   	push   %edi
 4fe:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 501:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 504:	e8 8a fd ff ff       	call   293 <write>
        ap++;
 509:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 50c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 50f:	31 d2                	xor    %edx,%edx
 511:	e9 0e ff ff ff       	jmp    424 <printf+0x54>
 516:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 520:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 523:	83 ec 04             	sub    $0x4,%esp
 526:	e9 59 ff ff ff       	jmp    484 <printf+0xb4>
 52b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop
        s = (char*)*ap;
 530:	8b 45 d0             	mov    -0x30(%ebp),%eax
 533:	8b 18                	mov    (%eax),%ebx
        ap++;
 535:	83 c0 04             	add    $0x4,%eax
 538:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 53b:	85 db                	test   %ebx,%ebx
 53d:	74 17                	je     556 <printf+0x186>
        while(*s != 0){
 53f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 542:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 544:	84 c0                	test   %al,%al
 546:	0f 84 d8 fe ff ff    	je     424 <printf+0x54>
 54c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 54f:	89 de                	mov    %ebx,%esi
 551:	8b 5d 08             	mov    0x8(%ebp),%ebx
 554:	eb 1a                	jmp    570 <printf+0x1a0>
          s = "(null)";
 556:	bb 38 07 00 00       	mov    $0x738,%ebx
        while(*s != 0){
 55b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 55e:	b8 28 00 00 00       	mov    $0x28,%eax
 563:	89 de                	mov    %ebx,%esi
 565:	8b 5d 08             	mov    0x8(%ebp),%ebx
 568:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop
  write(fd, &c, 1);
 570:	83 ec 04             	sub    $0x4,%esp
          s++;
 573:	83 c6 01             	add    $0x1,%esi
 576:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 579:	6a 01                	push   $0x1
 57b:	57                   	push   %edi
 57c:	53                   	push   %ebx
 57d:	e8 11 fd ff ff       	call   293 <write>
        while(*s != 0){
 582:	0f b6 06             	movzbl (%esi),%eax
 585:	83 c4 10             	add    $0x10,%esp
 588:	84 c0                	test   %al,%al
 58a:	75 e4                	jne    570 <printf+0x1a0>
 58c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 58f:	31 d2                	xor    %edx,%edx
 591:	e9 8e fe ff ff       	jmp    424 <printf+0x54>
 596:	66 90                	xchg   %ax,%ax
 598:	66 90                	xchg   %ax,%ax
 59a:	66 90                	xchg   %ax,%ax
 59c:	66 90                	xchg   %ax,%ax
 59e:	66 90                	xchg   %ax,%ax

000005a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5a0:	f3 0f 1e fb          	endbr32 
 5a4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5a5:	a1 d8 09 00 00       	mov    0x9d8,%eax
{
 5aa:	89 e5                	mov    %esp,%ebp
 5ac:	57                   	push   %edi
 5ad:	56                   	push   %esi
 5ae:	53                   	push   %ebx
 5af:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5b2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 5b4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5b7:	39 c8                	cmp    %ecx,%eax
 5b9:	73 15                	jae    5d0 <free+0x30>
 5bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5bf:	90                   	nop
 5c0:	39 d1                	cmp    %edx,%ecx
 5c2:	72 14                	jb     5d8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5c4:	39 d0                	cmp    %edx,%eax
 5c6:	73 10                	jae    5d8 <free+0x38>
{
 5c8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ca:	8b 10                	mov    (%eax),%edx
 5cc:	39 c8                	cmp    %ecx,%eax
 5ce:	72 f0                	jb     5c0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d0:	39 d0                	cmp    %edx,%eax
 5d2:	72 f4                	jb     5c8 <free+0x28>
 5d4:	39 d1                	cmp    %edx,%ecx
 5d6:	73 f0                	jae    5c8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5de:	39 fa                	cmp    %edi,%edx
 5e0:	74 1e                	je     600 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5e2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5e5:	8b 50 04             	mov    0x4(%eax),%edx
 5e8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5eb:	39 f1                	cmp    %esi,%ecx
 5ed:	74 28                	je     617 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5ef:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 5f1:	5b                   	pop    %ebx
  freep = p;
 5f2:	a3 d8 09 00 00       	mov    %eax,0x9d8
}
 5f7:	5e                   	pop    %esi
 5f8:	5f                   	pop    %edi
 5f9:	5d                   	pop    %ebp
 5fa:	c3                   	ret    
 5fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 600:	03 72 04             	add    0x4(%edx),%esi
 603:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 606:	8b 10                	mov    (%eax),%edx
 608:	8b 12                	mov    (%edx),%edx
 60a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 60d:	8b 50 04             	mov    0x4(%eax),%edx
 610:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 613:	39 f1                	cmp    %esi,%ecx
 615:	75 d8                	jne    5ef <free+0x4f>
    p->s.size += bp->s.size;
 617:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 61a:	a3 d8 09 00 00       	mov    %eax,0x9d8
    p->s.size += bp->s.size;
 61f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 622:	8b 53 f8             	mov    -0x8(%ebx),%edx
 625:	89 10                	mov    %edx,(%eax)
}
 627:	5b                   	pop    %ebx
 628:	5e                   	pop    %esi
 629:	5f                   	pop    %edi
 62a:	5d                   	pop    %ebp
 62b:	c3                   	ret    
 62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000630 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 630:	f3 0f 1e fb          	endbr32 
 634:	55                   	push   %ebp
 635:	89 e5                	mov    %esp,%ebp
 637:	57                   	push   %edi
 638:	56                   	push   %esi
 639:	53                   	push   %ebx
 63a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 63d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 640:	8b 3d d8 09 00 00    	mov    0x9d8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 646:	8d 70 07             	lea    0x7(%eax),%esi
 649:	c1 ee 03             	shr    $0x3,%esi
 64c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 64f:	85 ff                	test   %edi,%edi
 651:	0f 84 a9 00 00 00    	je     700 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 657:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 659:	8b 48 04             	mov    0x4(%eax),%ecx
 65c:	39 f1                	cmp    %esi,%ecx
 65e:	73 6d                	jae    6cd <malloc+0x9d>
 660:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 666:	bb 00 10 00 00       	mov    $0x1000,%ebx
 66b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 66e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 675:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 678:	eb 17                	jmp    691 <malloc+0x61>
 67a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 680:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 682:	8b 4a 04             	mov    0x4(%edx),%ecx
 685:	39 f1                	cmp    %esi,%ecx
 687:	73 4f                	jae    6d8 <malloc+0xa8>
 689:	8b 3d d8 09 00 00    	mov    0x9d8,%edi
 68f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 691:	39 c7                	cmp    %eax,%edi
 693:	75 eb                	jne    680 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 695:	83 ec 0c             	sub    $0xc,%esp
 698:	ff 75 e4             	pushl  -0x1c(%ebp)
 69b:	e8 5b fc ff ff       	call   2fb <sbrk>
  if(p == (char*)-1)
 6a0:	83 c4 10             	add    $0x10,%esp
 6a3:	83 f8 ff             	cmp    $0xffffffff,%eax
 6a6:	74 1b                	je     6c3 <malloc+0x93>
  hp->s.size = nu;
 6a8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6ab:	83 ec 0c             	sub    $0xc,%esp
 6ae:	83 c0 08             	add    $0x8,%eax
 6b1:	50                   	push   %eax
 6b2:	e8 e9 fe ff ff       	call   5a0 <free>
  return freep;
 6b7:	a1 d8 09 00 00       	mov    0x9d8,%eax
      if((p = morecore(nunits)) == 0)
 6bc:	83 c4 10             	add    $0x10,%esp
 6bf:	85 c0                	test   %eax,%eax
 6c1:	75 bd                	jne    680 <malloc+0x50>
        return 0;
  }
}
 6c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6c6:	31 c0                	xor    %eax,%eax
}
 6c8:	5b                   	pop    %ebx
 6c9:	5e                   	pop    %esi
 6ca:	5f                   	pop    %edi
 6cb:	5d                   	pop    %ebp
 6cc:	c3                   	ret    
    if(p->s.size >= nunits){
 6cd:	89 c2                	mov    %eax,%edx
 6cf:	89 f8                	mov    %edi,%eax
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 6d8:	39 ce                	cmp    %ecx,%esi
 6da:	74 54                	je     730 <malloc+0x100>
        p->s.size -= nunits;
 6dc:	29 f1                	sub    %esi,%ecx
 6de:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 6e1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 6e4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 6e7:	a3 d8 09 00 00       	mov    %eax,0x9d8
}
 6ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6ef:	8d 42 08             	lea    0x8(%edx),%eax
}
 6f2:	5b                   	pop    %ebx
 6f3:	5e                   	pop    %esi
 6f4:	5f                   	pop    %edi
 6f5:	5d                   	pop    %ebp
 6f6:	c3                   	ret    
 6f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fe:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 700:	c7 05 d8 09 00 00 dc 	movl   $0x9dc,0x9d8
 707:	09 00 00 
    base.s.size = 0;
 70a:	bf dc 09 00 00       	mov    $0x9dc,%edi
    base.s.ptr = freep = prevp = &base;
 70f:	c7 05 dc 09 00 00 dc 	movl   $0x9dc,0x9dc
 716:	09 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 719:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 71b:	c7 05 e0 09 00 00 00 	movl   $0x0,0x9e0
 722:	00 00 00 
    if(p->s.size >= nunits){
 725:	e9 36 ff ff ff       	jmp    660 <malloc+0x30>
 72a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 730:	8b 0a                	mov    (%edx),%ecx
 732:	89 08                	mov    %ecx,(%eax)
 734:	eb b1                	jmp    6e7 <malloc+0xb7>
