
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  13:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  16:	83 39 03             	cmpl   $0x3,(%ecx)
  19:	74 14                	je     2f <main+0x2f>
    printf(2, "Usage: ln old new\n");
  1b:	83 ec 08             	sub    $0x8,%esp
  1e:	68 44 07 00 00       	push   $0x744
  23:	6a 02                	push   $0x2
  25:	e8 5d 04 00 00       	call   487 <printf>
    exit();
  2a:	e8 c7 02 00 00       	call   2f6 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2f:	83 ec 08             	sub    $0x8,%esp
  32:	ff 73 08             	pushl  0x8(%ebx)
  35:	ff 73 04             	pushl  0x4(%ebx)
  38:	e8 19 03 00 00       	call   356 <link>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	85 c0                	test   %eax,%eax
  42:	78 05                	js     49 <main+0x49>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  44:	e8 ad 02 00 00       	call   2f6 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  49:	ff 73 08             	pushl  0x8(%ebx)
  4c:	ff 73 04             	pushl  0x4(%ebx)
  4f:	68 57 07 00 00       	push   $0x757
  54:	6a 02                	push   $0x2
  56:	e8 2c 04 00 00       	call   487 <printf>
  5b:	83 c4 10             	add    $0x10,%esp
  5e:	eb e4                	jmp    44 <main+0x44>

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  65:	89 e5                	mov    %esp,%ebp
  67:	56                   	push   %esi
  68:	53                   	push   %ebx
  69:	8b 75 08             	mov    0x8(%ebp),%esi
  6c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6f:	89 f0                	mov    %esi,%eax
  71:	89 d1                	mov    %edx,%ecx
  73:	83 c2 01             	add    $0x1,%edx
  76:	89 c3                	mov    %eax,%ebx
  78:	83 c0 01             	add    $0x1,%eax
  7b:	0f b6 09             	movzbl (%ecx),%ecx
  7e:	88 0b                	mov    %cl,(%ebx)
  80:	84 c9                	test   %cl,%cl
  82:	75 ed                	jne    71 <strcpy+0x11>
    ;
  return os;
}
  84:	89 f0                	mov    %esi,%eax
  86:	5b                   	pop    %ebx
  87:	5e                   	pop    %esi
  88:	5d                   	pop    %ebp
  89:	c3                   	ret    

0000008a <strcmp>:

int
strcmp(const char *p, const char *q)
{
  8a:	f3 0f 1e fb          	endbr32 
  8e:	55                   	push   %ebp
  8f:	89 e5                	mov    %esp,%ebp
  91:	8b 4d 08             	mov    0x8(%ebp),%ecx
  94:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  97:	0f b6 01             	movzbl (%ecx),%eax
  9a:	84 c0                	test   %al,%al
  9c:	74 0c                	je     aa <strcmp+0x20>
  9e:	3a 02                	cmp    (%edx),%al
  a0:	75 08                	jne    aa <strcmp+0x20>
    p++, q++;
  a2:	83 c1 01             	add    $0x1,%ecx
  a5:	83 c2 01             	add    $0x1,%edx
  a8:	eb ed                	jmp    97 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
  aa:	0f b6 c0             	movzbl %al,%eax
  ad:	0f b6 12             	movzbl (%edx),%edx
  b0:	29 d0                	sub    %edx,%eax
}
  b2:	5d                   	pop    %ebp
  b3:	c3                   	ret    

000000b4 <strlen>:

uint
strlen(char *s)
{
  b4:	f3 0f 1e fb          	endbr32 
  b8:	55                   	push   %ebp
  b9:	89 e5                	mov    %esp,%ebp
  bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  be:	b8 00 00 00 00       	mov    $0x0,%eax
  c3:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  c7:	74 05                	je     ce <strlen+0x1a>
  c9:	83 c0 01             	add    $0x1,%eax
  cc:	eb f5                	jmp    c3 <strlen+0xf>
    ;
  return n;
}
  ce:	5d                   	pop    %ebp
  cf:	c3                   	ret    

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
  db:	89 d7                	mov    %edx,%edi
  dd:	8b 4d 10             	mov    0x10(%ebp),%ecx
  e0:	8b 45 0c             	mov    0xc(%ebp),%eax
  e3:	fc                   	cld    
  e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  e6:	89 d0                	mov    %edx,%eax
  e8:	5f                   	pop    %edi
  e9:	5d                   	pop    %ebp
  ea:	c3                   	ret    

000000eb <strchr>:

char*
strchr(const char *s, char c)
{
  eb:	f3 0f 1e fb          	endbr32 
  ef:	55                   	push   %ebp
  f0:	89 e5                	mov    %esp,%ebp
  f2:	8b 45 08             	mov    0x8(%ebp),%eax
  f5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  f9:	0f b6 10             	movzbl (%eax),%edx
  fc:	84 d2                	test   %dl,%dl
  fe:	74 09                	je     109 <strchr+0x1e>
    if(*s == c)
 100:	38 ca                	cmp    %cl,%dl
 102:	74 0a                	je     10e <strchr+0x23>
  for(; *s; s++)
 104:	83 c0 01             	add    $0x1,%eax
 107:	eb f0                	jmp    f9 <strchr+0xe>
      return (char*)s;
  return 0;
 109:	b8 00 00 00 00       	mov    $0x0,%eax
}
 10e:	5d                   	pop    %ebp
 10f:	c3                   	ret    

00000110 <gets>:

char*
gets(char *buf, int max)
{
 110:	f3 0f 1e fb          	endbr32 
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	57                   	push   %edi
 118:	56                   	push   %esi
 119:	53                   	push   %ebx
 11a:	83 ec 1c             	sub    $0x1c,%esp
 11d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 120:	bb 00 00 00 00       	mov    $0x0,%ebx
 125:	89 de                	mov    %ebx,%esi
 127:	83 c3 01             	add    $0x1,%ebx
 12a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 12d:	7d 2e                	jge    15d <gets+0x4d>
    cc = read(0, &c, 1);
 12f:	83 ec 04             	sub    $0x4,%esp
 132:	6a 01                	push   $0x1
 134:	8d 45 e7             	lea    -0x19(%ebp),%eax
 137:	50                   	push   %eax
 138:	6a 00                	push   $0x0
 13a:	e8 cf 01 00 00       	call   30e <read>
    if(cc < 1)
 13f:	83 c4 10             	add    $0x10,%esp
 142:	85 c0                	test   %eax,%eax
 144:	7e 17                	jle    15d <gets+0x4d>
      break;
    buf[i++] = c;
 146:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 14a:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 14d:	3c 0a                	cmp    $0xa,%al
 14f:	0f 94 c2             	sete   %dl
 152:	3c 0d                	cmp    $0xd,%al
 154:	0f 94 c0             	sete   %al
 157:	08 c2                	or     %al,%dl
 159:	74 ca                	je     125 <gets+0x15>
    buf[i++] = c;
 15b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 15d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 161:	89 f8                	mov    %edi,%eax
 163:	8d 65 f4             	lea    -0xc(%ebp),%esp
 166:	5b                   	pop    %ebx
 167:	5e                   	pop    %esi
 168:	5f                   	pop    %edi
 169:	5d                   	pop    %ebp
 16a:	c3                   	ret    

0000016b <stat>:

int
stat(char *n, struct stat *st)
{
 16b:	f3 0f 1e fb          	endbr32 
 16f:	55                   	push   %ebp
 170:	89 e5                	mov    %esp,%ebp
 172:	56                   	push   %esi
 173:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 174:	83 ec 08             	sub    $0x8,%esp
 177:	6a 00                	push   $0x0
 179:	ff 75 08             	pushl  0x8(%ebp)
 17c:	e8 b5 01 00 00       	call   336 <open>
  if(fd < 0)
 181:	83 c4 10             	add    $0x10,%esp
 184:	85 c0                	test   %eax,%eax
 186:	78 24                	js     1ac <stat+0x41>
 188:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 18a:	83 ec 08             	sub    $0x8,%esp
 18d:	ff 75 0c             	pushl  0xc(%ebp)
 190:	50                   	push   %eax
 191:	e8 b8 01 00 00       	call   34e <fstat>
 196:	89 c6                	mov    %eax,%esi
  close(fd);
 198:	89 1c 24             	mov    %ebx,(%esp)
 19b:	e8 7e 01 00 00       	call   31e <close>
  return r;
 1a0:	83 c4 10             	add    $0x10,%esp
}
 1a3:	89 f0                	mov    %esi,%eax
 1a5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1a8:	5b                   	pop    %ebx
 1a9:	5e                   	pop    %esi
 1aa:	5d                   	pop    %ebp
 1ab:	c3                   	ret    
    return -1;
 1ac:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1b1:	eb f0                	jmp    1a3 <stat+0x38>

000001b3 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 1b3:	f3 0f 1e fb          	endbr32 
 1b7:	55                   	push   %ebp
 1b8:	89 e5                	mov    %esp,%ebp
 1ba:	57                   	push   %edi
 1bb:	56                   	push   %esi
 1bc:	53                   	push   %ebx
 1bd:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 1c0:	0f b6 02             	movzbl (%edx),%eax
 1c3:	3c 20                	cmp    $0x20,%al
 1c5:	75 05                	jne    1cc <atoi+0x19>
 1c7:	83 c2 01             	add    $0x1,%edx
 1ca:	eb f4                	jmp    1c0 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 1cc:	3c 2d                	cmp    $0x2d,%al
 1ce:	74 1d                	je     1ed <atoi+0x3a>
 1d0:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 1d5:	3c 2b                	cmp    $0x2b,%al
 1d7:	0f 94 c1             	sete   %cl
 1da:	3c 2d                	cmp    $0x2d,%al
 1dc:	0f 94 c0             	sete   %al
 1df:	08 c1                	or     %al,%cl
 1e1:	74 03                	je     1e6 <atoi+0x33>
    s++;
 1e3:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 1e6:	b8 00 00 00 00       	mov    $0x0,%eax
 1eb:	eb 17                	jmp    204 <atoi+0x51>
 1ed:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 1f2:	eb e1                	jmp    1d5 <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 1f4:	8d 34 80             	lea    (%eax,%eax,4),%esi
 1f7:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 1fa:	83 c2 01             	add    $0x1,%edx
 1fd:	0f be c9             	movsbl %cl,%ecx
 200:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 204:	0f b6 0a             	movzbl (%edx),%ecx
 207:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 20a:	80 fb 09             	cmp    $0x9,%bl
 20d:	76 e5                	jbe    1f4 <atoi+0x41>
  return sign*n;
 20f:	0f af c7             	imul   %edi,%eax
}
 212:	5b                   	pop    %ebx
 213:	5e                   	pop    %esi
 214:	5f                   	pop    %edi
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    

00000217 <atoo>:

int
atoo(const char *s)
{
 217:	f3 0f 1e fb          	endbr32 
 21b:	55                   	push   %ebp
 21c:	89 e5                	mov    %esp,%ebp
 21e:	57                   	push   %edi
 21f:	56                   	push   %esi
 220:	53                   	push   %ebx
 221:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 224:	0f b6 0a             	movzbl (%edx),%ecx
 227:	80 f9 20             	cmp    $0x20,%cl
 22a:	75 05                	jne    231 <atoo+0x1a>
 22c:	83 c2 01             	add    $0x1,%edx
 22f:	eb f3                	jmp    224 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 231:	80 f9 2d             	cmp    $0x2d,%cl
 234:	74 23                	je     259 <atoo+0x42>
 236:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 23b:	80 f9 2b             	cmp    $0x2b,%cl
 23e:	0f 94 c0             	sete   %al
 241:	89 c6                	mov    %eax,%esi
 243:	80 f9 2d             	cmp    $0x2d,%cl
 246:	0f 94 c0             	sete   %al
 249:	89 f3                	mov    %esi,%ebx
 24b:	08 c3                	or     %al,%bl
 24d:	74 03                	je     252 <atoo+0x3b>
    s++;
 24f:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 252:	b8 00 00 00 00       	mov    $0x0,%eax
 257:	eb 11                	jmp    26a <atoo+0x53>
 259:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 25e:	eb db                	jmp    23b <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 260:	83 c2 01             	add    $0x1,%edx
 263:	0f be c9             	movsbl %cl,%ecx
 266:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 26a:	0f b6 0a             	movzbl (%edx),%ecx
 26d:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 270:	80 fb 07             	cmp    $0x7,%bl
 273:	76 eb                	jbe    260 <atoo+0x49>
  return sign*n;
 275:	0f af c7             	imul   %edi,%eax
}
 278:	5b                   	pop    %ebx
 279:	5e                   	pop    %esi
 27a:	5f                   	pop    %edi
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    

0000027d <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 27d:	f3 0f 1e fb          	endbr32 
 281:	55                   	push   %ebp
 282:	89 e5                	mov    %esp,%ebp
 284:	53                   	push   %ebx
 285:	8b 55 08             	mov    0x8(%ebp),%edx
 288:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 28b:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 28e:	eb 09                	jmp    299 <strncmp+0x1c>
      n--, p++, q++;
 290:	83 e8 01             	sub    $0x1,%eax
 293:	83 c2 01             	add    $0x1,%edx
 296:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 299:	85 c0                	test   %eax,%eax
 29b:	74 0b                	je     2a8 <strncmp+0x2b>
 29d:	0f b6 1a             	movzbl (%edx),%ebx
 2a0:	84 db                	test   %bl,%bl
 2a2:	74 04                	je     2a8 <strncmp+0x2b>
 2a4:	3a 19                	cmp    (%ecx),%bl
 2a6:	74 e8                	je     290 <strncmp+0x13>
    if(n == 0)
 2a8:	85 c0                	test   %eax,%eax
 2aa:	74 0b                	je     2b7 <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 2ac:	0f b6 02             	movzbl (%edx),%eax
 2af:	0f b6 11             	movzbl (%ecx),%edx
 2b2:	29 d0                	sub    %edx,%eax
}
 2b4:	5b                   	pop    %ebx
 2b5:	5d                   	pop    %ebp
 2b6:	c3                   	ret    
      return 0;
 2b7:	b8 00 00 00 00       	mov    $0x0,%eax
 2bc:	eb f6                	jmp    2b4 <strncmp+0x37>

000002be <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 2be:	f3 0f 1e fb          	endbr32 
 2c2:	55                   	push   %ebp
 2c3:	89 e5                	mov    %esp,%ebp
 2c5:	56                   	push   %esi
 2c6:	53                   	push   %ebx
 2c7:	8b 75 08             	mov    0x8(%ebp),%esi
 2ca:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2cd:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 2d0:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2d2:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2d5:	85 c0                	test   %eax,%eax
 2d7:	7e 0f                	jle    2e8 <memmove+0x2a>
    *dst++ = *src++;
 2d9:	0f b6 01             	movzbl (%ecx),%eax
 2dc:	88 02                	mov    %al,(%edx)
 2de:	8d 49 01             	lea    0x1(%ecx),%ecx
 2e1:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2e4:	89 d8                	mov    %ebx,%eax
 2e6:	eb ea                	jmp    2d2 <memmove+0x14>
  return vdst;
}
 2e8:	89 f0                	mov    %esi,%eax
 2ea:	5b                   	pop    %ebx
 2eb:	5e                   	pop    %esi
 2ec:	5d                   	pop    %ebp
 2ed:	c3                   	ret    

000002ee <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ee:	b8 01 00 00 00       	mov    $0x1,%eax
 2f3:	cd 40                	int    $0x40
 2f5:	c3                   	ret    

000002f6 <exit>:
SYSCALL(exit)
 2f6:	b8 02 00 00 00       	mov    $0x2,%eax
 2fb:	cd 40                	int    $0x40
 2fd:	c3                   	ret    

000002fe <wait>:
SYSCALL(wait)
 2fe:	b8 03 00 00 00       	mov    $0x3,%eax
 303:	cd 40                	int    $0x40
 305:	c3                   	ret    

00000306 <pipe>:
SYSCALL(pipe)
 306:	b8 04 00 00 00       	mov    $0x4,%eax
 30b:	cd 40                	int    $0x40
 30d:	c3                   	ret    

0000030e <read>:
SYSCALL(read)
 30e:	b8 05 00 00 00       	mov    $0x5,%eax
 313:	cd 40                	int    $0x40
 315:	c3                   	ret    

00000316 <write>:
SYSCALL(write)
 316:	b8 10 00 00 00       	mov    $0x10,%eax
 31b:	cd 40                	int    $0x40
 31d:	c3                   	ret    

0000031e <close>:
SYSCALL(close)
 31e:	b8 15 00 00 00       	mov    $0x15,%eax
 323:	cd 40                	int    $0x40
 325:	c3                   	ret    

00000326 <kill>:
SYSCALL(kill)
 326:	b8 06 00 00 00       	mov    $0x6,%eax
 32b:	cd 40                	int    $0x40
 32d:	c3                   	ret    

0000032e <exec>:
SYSCALL(exec)
 32e:	b8 07 00 00 00       	mov    $0x7,%eax
 333:	cd 40                	int    $0x40
 335:	c3                   	ret    

00000336 <open>:
SYSCALL(open)
 336:	b8 0f 00 00 00       	mov    $0xf,%eax
 33b:	cd 40                	int    $0x40
 33d:	c3                   	ret    

0000033e <mknod>:
SYSCALL(mknod)
 33e:	b8 11 00 00 00       	mov    $0x11,%eax
 343:	cd 40                	int    $0x40
 345:	c3                   	ret    

00000346 <unlink>:
SYSCALL(unlink)
 346:	b8 12 00 00 00       	mov    $0x12,%eax
 34b:	cd 40                	int    $0x40
 34d:	c3                   	ret    

0000034e <fstat>:
SYSCALL(fstat)
 34e:	b8 08 00 00 00       	mov    $0x8,%eax
 353:	cd 40                	int    $0x40
 355:	c3                   	ret    

00000356 <link>:
SYSCALL(link)
 356:	b8 13 00 00 00       	mov    $0x13,%eax
 35b:	cd 40                	int    $0x40
 35d:	c3                   	ret    

0000035e <mkdir>:
SYSCALL(mkdir)
 35e:	b8 14 00 00 00       	mov    $0x14,%eax
 363:	cd 40                	int    $0x40
 365:	c3                   	ret    

00000366 <chdir>:
SYSCALL(chdir)
 366:	b8 09 00 00 00       	mov    $0x9,%eax
 36b:	cd 40                	int    $0x40
 36d:	c3                   	ret    

0000036e <dup>:
SYSCALL(dup)
 36e:	b8 0a 00 00 00       	mov    $0xa,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret    

00000376 <getpid>:
SYSCALL(getpid)
 376:	b8 0b 00 00 00       	mov    $0xb,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret    

0000037e <sbrk>:
SYSCALL(sbrk)
 37e:	b8 0c 00 00 00       	mov    $0xc,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <sleep>:
SYSCALL(sleep)
 386:	b8 0d 00 00 00       	mov    $0xd,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <uptime>:
SYSCALL(uptime)
 38e:	b8 0e 00 00 00       	mov    $0xe,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <halt>:
SYSCALL(halt)
 396:	b8 16 00 00 00       	mov    $0x16,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <date>:
SYSCALL(date)
 39e:	b8 17 00 00 00       	mov    $0x17,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <getuid>:
SYSCALL(getuid)
 3a6:	b8 18 00 00 00       	mov    $0x18,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <getgid>:
SYSCALL(getgid)
 3ae:	b8 19 00 00 00       	mov    $0x19,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <getppid>:
SYSCALL(getppid)
 3b6:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <setuid>:
SYSCALL(setuid)
 3be:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <setgid>:
SYSCALL(setgid)
 3c6:	b8 1c 00 00 00       	mov    $0x1c,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <getprocs>:
SYSCALL(getprocs)
 3ce:	b8 1d 00 00 00       	mov    $0x1d,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <setpriority>:
SYSCALL(setpriority)
 3d6:	b8 1e 00 00 00       	mov    $0x1e,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <getpriority>:
SYSCALL(getpriority)
 3de:	b8 1f 00 00 00       	mov    $0x1f,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3e6:	55                   	push   %ebp
 3e7:	89 e5                	mov    %esp,%ebp
 3e9:	83 ec 1c             	sub    $0x1c,%esp
 3ec:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3ef:	6a 01                	push   $0x1
 3f1:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3f4:	52                   	push   %edx
 3f5:	50                   	push   %eax
 3f6:	e8 1b ff ff ff       	call   316 <write>
}
 3fb:	83 c4 10             	add    $0x10,%esp
 3fe:	c9                   	leave  
 3ff:	c3                   	ret    

00000400 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	83 ec 2c             	sub    $0x2c,%esp
 409:	89 45 d0             	mov    %eax,-0x30(%ebp)
 40c:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 40e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 412:	0f 95 c2             	setne  %dl
 415:	89 f0                	mov    %esi,%eax
 417:	c1 e8 1f             	shr    $0x1f,%eax
 41a:	84 c2                	test   %al,%dl
 41c:	74 42                	je     460 <printint+0x60>
    neg = 1;
    x = -xx;
 41e:	f7 de                	neg    %esi
    neg = 1;
 420:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 427:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 42c:	89 f0                	mov    %esi,%eax
 42e:	ba 00 00 00 00       	mov    $0x0,%edx
 433:	f7 f1                	div    %ecx
 435:	89 df                	mov    %ebx,%edi
 437:	83 c3 01             	add    $0x1,%ebx
 43a:	0f b6 92 74 07 00 00 	movzbl 0x774(%edx),%edx
 441:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 445:	89 f2                	mov    %esi,%edx
 447:	89 c6                	mov    %eax,%esi
 449:	39 d1                	cmp    %edx,%ecx
 44b:	76 df                	jbe    42c <printint+0x2c>
  if(neg)
 44d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 451:	74 2f                	je     482 <printint+0x82>
    buf[i++] = '-';
 453:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 458:	8d 5f 02             	lea    0x2(%edi),%ebx
 45b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 45e:	eb 15                	jmp    475 <printint+0x75>
  neg = 0;
 460:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 467:	eb be                	jmp    427 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 469:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 46e:	89 f0                	mov    %esi,%eax
 470:	e8 71 ff ff ff       	call   3e6 <putc>
  while(--i >= 0)
 475:	83 eb 01             	sub    $0x1,%ebx
 478:	79 ef                	jns    469 <printint+0x69>
}
 47a:	83 c4 2c             	add    $0x2c,%esp
 47d:	5b                   	pop    %ebx
 47e:	5e                   	pop    %esi
 47f:	5f                   	pop    %edi
 480:	5d                   	pop    %ebp
 481:	c3                   	ret    
 482:	8b 75 d0             	mov    -0x30(%ebp),%esi
 485:	eb ee                	jmp    475 <printint+0x75>

00000487 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 487:	f3 0f 1e fb          	endbr32 
 48b:	55                   	push   %ebp
 48c:	89 e5                	mov    %esp,%ebp
 48e:	57                   	push   %edi
 48f:	56                   	push   %esi
 490:	53                   	push   %ebx
 491:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 494:	8d 45 10             	lea    0x10(%ebp),%eax
 497:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 49a:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 49f:	bb 00 00 00 00       	mov    $0x0,%ebx
 4a4:	eb 14                	jmp    4ba <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4a6:	89 fa                	mov    %edi,%edx
 4a8:	8b 45 08             	mov    0x8(%ebp),%eax
 4ab:	e8 36 ff ff ff       	call   3e6 <putc>
 4b0:	eb 05                	jmp    4b7 <printf+0x30>
      }
    } else if(state == '%'){
 4b2:	83 fe 25             	cmp    $0x25,%esi
 4b5:	74 25                	je     4dc <printf+0x55>
  for(i = 0; fmt[i]; i++){
 4b7:	83 c3 01             	add    $0x1,%ebx
 4ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 4bd:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4c1:	84 c0                	test   %al,%al
 4c3:	0f 84 23 01 00 00    	je     5ec <printf+0x165>
    c = fmt[i] & 0xff;
 4c9:	0f be f8             	movsbl %al,%edi
 4cc:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4cf:	85 f6                	test   %esi,%esi
 4d1:	75 df                	jne    4b2 <printf+0x2b>
      if(c == '%'){
 4d3:	83 f8 25             	cmp    $0x25,%eax
 4d6:	75 ce                	jne    4a6 <printf+0x1f>
        state = '%';
 4d8:	89 c6                	mov    %eax,%esi
 4da:	eb db                	jmp    4b7 <printf+0x30>
      if(c == 'd'){
 4dc:	83 f8 64             	cmp    $0x64,%eax
 4df:	74 49                	je     52a <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4e1:	83 f8 78             	cmp    $0x78,%eax
 4e4:	0f 94 c1             	sete   %cl
 4e7:	83 f8 70             	cmp    $0x70,%eax
 4ea:	0f 94 c2             	sete   %dl
 4ed:	08 d1                	or     %dl,%cl
 4ef:	75 63                	jne    554 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4f1:	83 f8 73             	cmp    $0x73,%eax
 4f4:	0f 84 84 00 00 00    	je     57e <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4fa:	83 f8 63             	cmp    $0x63,%eax
 4fd:	0f 84 b7 00 00 00    	je     5ba <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 503:	83 f8 25             	cmp    $0x25,%eax
 506:	0f 84 cc 00 00 00    	je     5d8 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 50c:	ba 25 00 00 00       	mov    $0x25,%edx
 511:	8b 45 08             	mov    0x8(%ebp),%eax
 514:	e8 cd fe ff ff       	call   3e6 <putc>
        putc(fd, c);
 519:	89 fa                	mov    %edi,%edx
 51b:	8b 45 08             	mov    0x8(%ebp),%eax
 51e:	e8 c3 fe ff ff       	call   3e6 <putc>
      }
      state = 0;
 523:	be 00 00 00 00       	mov    $0x0,%esi
 528:	eb 8d                	jmp    4b7 <printf+0x30>
        printint(fd, *ap, 10, 1);
 52a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 52d:	8b 17                	mov    (%edi),%edx
 52f:	83 ec 0c             	sub    $0xc,%esp
 532:	6a 01                	push   $0x1
 534:	b9 0a 00 00 00       	mov    $0xa,%ecx
 539:	8b 45 08             	mov    0x8(%ebp),%eax
 53c:	e8 bf fe ff ff       	call   400 <printint>
        ap++;
 541:	83 c7 04             	add    $0x4,%edi
 544:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 547:	83 c4 10             	add    $0x10,%esp
      state = 0;
 54a:	be 00 00 00 00       	mov    $0x0,%esi
 54f:	e9 63 ff ff ff       	jmp    4b7 <printf+0x30>
        printint(fd, *ap, 16, 0);
 554:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 557:	8b 17                	mov    (%edi),%edx
 559:	83 ec 0c             	sub    $0xc,%esp
 55c:	6a 00                	push   $0x0
 55e:	b9 10 00 00 00       	mov    $0x10,%ecx
 563:	8b 45 08             	mov    0x8(%ebp),%eax
 566:	e8 95 fe ff ff       	call   400 <printint>
        ap++;
 56b:	83 c7 04             	add    $0x4,%edi
 56e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 571:	83 c4 10             	add    $0x10,%esp
      state = 0;
 574:	be 00 00 00 00       	mov    $0x0,%esi
 579:	e9 39 ff ff ff       	jmp    4b7 <printf+0x30>
        s = (char*)*ap;
 57e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 581:	8b 30                	mov    (%eax),%esi
        ap++;
 583:	83 c0 04             	add    $0x4,%eax
 586:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 589:	85 f6                	test   %esi,%esi
 58b:	75 28                	jne    5b5 <printf+0x12e>
          s = "(null)";
 58d:	be 6b 07 00 00       	mov    $0x76b,%esi
 592:	8b 7d 08             	mov    0x8(%ebp),%edi
 595:	eb 0d                	jmp    5a4 <printf+0x11d>
          putc(fd, *s);
 597:	0f be d2             	movsbl %dl,%edx
 59a:	89 f8                	mov    %edi,%eax
 59c:	e8 45 fe ff ff       	call   3e6 <putc>
          s++;
 5a1:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5a4:	0f b6 16             	movzbl (%esi),%edx
 5a7:	84 d2                	test   %dl,%dl
 5a9:	75 ec                	jne    597 <printf+0x110>
      state = 0;
 5ab:	be 00 00 00 00       	mov    $0x0,%esi
 5b0:	e9 02 ff ff ff       	jmp    4b7 <printf+0x30>
 5b5:	8b 7d 08             	mov    0x8(%ebp),%edi
 5b8:	eb ea                	jmp    5a4 <printf+0x11d>
        putc(fd, *ap);
 5ba:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5bd:	0f be 17             	movsbl (%edi),%edx
 5c0:	8b 45 08             	mov    0x8(%ebp),%eax
 5c3:	e8 1e fe ff ff       	call   3e6 <putc>
        ap++;
 5c8:	83 c7 04             	add    $0x4,%edi
 5cb:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5ce:	be 00 00 00 00       	mov    $0x0,%esi
 5d3:	e9 df fe ff ff       	jmp    4b7 <printf+0x30>
        putc(fd, c);
 5d8:	89 fa                	mov    %edi,%edx
 5da:	8b 45 08             	mov    0x8(%ebp),%eax
 5dd:	e8 04 fe ff ff       	call   3e6 <putc>
      state = 0;
 5e2:	be 00 00 00 00       	mov    $0x0,%esi
 5e7:	e9 cb fe ff ff       	jmp    4b7 <printf+0x30>
    }
  }
}
 5ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ef:	5b                   	pop    %ebx
 5f0:	5e                   	pop    %esi
 5f1:	5f                   	pop    %edi
 5f2:	5d                   	pop    %ebp
 5f3:	c3                   	ret    

000005f4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5f4:	f3 0f 1e fb          	endbr32 
 5f8:	55                   	push   %ebp
 5f9:	89 e5                	mov    %esp,%ebp
 5fb:	57                   	push   %edi
 5fc:	56                   	push   %esi
 5fd:	53                   	push   %ebx
 5fe:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 601:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 604:	a1 74 0a 00 00       	mov    0xa74,%eax
 609:	eb 02                	jmp    60d <free+0x19>
 60b:	89 d0                	mov    %edx,%eax
 60d:	39 c8                	cmp    %ecx,%eax
 60f:	73 04                	jae    615 <free+0x21>
 611:	39 08                	cmp    %ecx,(%eax)
 613:	77 12                	ja     627 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 615:	8b 10                	mov    (%eax),%edx
 617:	39 c2                	cmp    %eax,%edx
 619:	77 f0                	ja     60b <free+0x17>
 61b:	39 c8                	cmp    %ecx,%eax
 61d:	72 08                	jb     627 <free+0x33>
 61f:	39 ca                	cmp    %ecx,%edx
 621:	77 04                	ja     627 <free+0x33>
 623:	89 d0                	mov    %edx,%eax
 625:	eb e6                	jmp    60d <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 627:	8b 73 fc             	mov    -0x4(%ebx),%esi
 62a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 62d:	8b 10                	mov    (%eax),%edx
 62f:	39 d7                	cmp    %edx,%edi
 631:	74 19                	je     64c <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 633:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 636:	8b 50 04             	mov    0x4(%eax),%edx
 639:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 63c:	39 ce                	cmp    %ecx,%esi
 63e:	74 1b                	je     65b <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 640:	89 08                	mov    %ecx,(%eax)
  freep = p;
 642:	a3 74 0a 00 00       	mov    %eax,0xa74
}
 647:	5b                   	pop    %ebx
 648:	5e                   	pop    %esi
 649:	5f                   	pop    %edi
 64a:	5d                   	pop    %ebp
 64b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 64c:	03 72 04             	add    0x4(%edx),%esi
 64f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 652:	8b 10                	mov    (%eax),%edx
 654:	8b 12                	mov    (%edx),%edx
 656:	89 53 f8             	mov    %edx,-0x8(%ebx)
 659:	eb db                	jmp    636 <free+0x42>
    p->s.size += bp->s.size;
 65b:	03 53 fc             	add    -0x4(%ebx),%edx
 65e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 661:	8b 53 f8             	mov    -0x8(%ebx),%edx
 664:	89 10                	mov    %edx,(%eax)
 666:	eb da                	jmp    642 <free+0x4e>

00000668 <morecore>:

static Header*
morecore(uint nu)
{
 668:	55                   	push   %ebp
 669:	89 e5                	mov    %esp,%ebp
 66b:	53                   	push   %ebx
 66c:	83 ec 04             	sub    $0x4,%esp
 66f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 671:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 676:	77 05                	ja     67d <morecore+0x15>
    nu = 4096;
 678:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 67d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 684:	83 ec 0c             	sub    $0xc,%esp
 687:	50                   	push   %eax
 688:	e8 f1 fc ff ff       	call   37e <sbrk>
  if(p == (char*)-1)
 68d:	83 c4 10             	add    $0x10,%esp
 690:	83 f8 ff             	cmp    $0xffffffff,%eax
 693:	74 1c                	je     6b1 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 695:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 698:	83 c0 08             	add    $0x8,%eax
 69b:	83 ec 0c             	sub    $0xc,%esp
 69e:	50                   	push   %eax
 69f:	e8 50 ff ff ff       	call   5f4 <free>
  return freep;
 6a4:	a1 74 0a 00 00       	mov    0xa74,%eax
 6a9:	83 c4 10             	add    $0x10,%esp
}
 6ac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6af:	c9                   	leave  
 6b0:	c3                   	ret    
    return 0;
 6b1:	b8 00 00 00 00       	mov    $0x0,%eax
 6b6:	eb f4                	jmp    6ac <morecore+0x44>

000006b8 <malloc>:

void*
malloc(uint nbytes)
{
 6b8:	f3 0f 1e fb          	endbr32 
 6bc:	55                   	push   %ebp
 6bd:	89 e5                	mov    %esp,%ebp
 6bf:	53                   	push   %ebx
 6c0:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c3:	8b 45 08             	mov    0x8(%ebp),%eax
 6c6:	8d 58 07             	lea    0x7(%eax),%ebx
 6c9:	c1 eb 03             	shr    $0x3,%ebx
 6cc:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6cf:	8b 0d 74 0a 00 00    	mov    0xa74,%ecx
 6d5:	85 c9                	test   %ecx,%ecx
 6d7:	74 04                	je     6dd <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6d9:	8b 01                	mov    (%ecx),%eax
 6db:	eb 4b                	jmp    728 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 6dd:	c7 05 74 0a 00 00 78 	movl   $0xa78,0xa74
 6e4:	0a 00 00 
 6e7:	c7 05 78 0a 00 00 78 	movl   $0xa78,0xa78
 6ee:	0a 00 00 
    base.s.size = 0;
 6f1:	c7 05 7c 0a 00 00 00 	movl   $0x0,0xa7c
 6f8:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6fb:	b9 78 0a 00 00       	mov    $0xa78,%ecx
 700:	eb d7                	jmp    6d9 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 702:	74 1a                	je     71e <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 704:	29 da                	sub    %ebx,%edx
 706:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 709:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 70c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 70f:	89 0d 74 0a 00 00    	mov    %ecx,0xa74
      return (void*)(p + 1);
 715:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 718:	83 c4 04             	add    $0x4,%esp
 71b:	5b                   	pop    %ebx
 71c:	5d                   	pop    %ebp
 71d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 71e:	8b 10                	mov    (%eax),%edx
 720:	89 11                	mov    %edx,(%ecx)
 722:	eb eb                	jmp    70f <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 724:	89 c1                	mov    %eax,%ecx
 726:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 728:	8b 50 04             	mov    0x4(%eax),%edx
 72b:	39 da                	cmp    %ebx,%edx
 72d:	73 d3                	jae    702 <malloc+0x4a>
    if(p == freep)
 72f:	39 05 74 0a 00 00    	cmp    %eax,0xa74
 735:	75 ed                	jne    724 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 737:	89 d8                	mov    %ebx,%eax
 739:	e8 2a ff ff ff       	call   668 <morecore>
 73e:	85 c0                	test   %eax,%eax
 740:	75 e2                	jne    724 <malloc+0x6c>
 742:	eb d4                	jmp    718 <malloc+0x60>
