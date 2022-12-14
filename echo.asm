
_echo:     file format elf32-i386


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
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	53                   	push   %ebx
  14:	51                   	push   %ecx
  15:	83 ec 08             	sub    $0x8,%esp
  18:	8b 31                	mov    (%ecx),%esi
  1a:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  1d:	b8 01 00 00 00       	mov    $0x1,%eax
  22:	eb 1a                	jmp    3e <main+0x3e>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  24:	ba 3c 07 00 00       	mov    $0x73c,%edx
  29:	52                   	push   %edx
  2a:	ff 34 87             	pushl  (%edi,%eax,4)
  2d:	68 40 07 00 00       	push   $0x740
  32:	6a 01                	push   $0x1
  34:	e8 43 04 00 00       	call   47c <printf>
  39:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++)
  3c:	89 d8                	mov    %ebx,%eax
  3e:	39 f0                	cmp    %esi,%eax
  40:	7d 0e                	jge    50 <main+0x50>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  42:	8d 58 01             	lea    0x1(%eax),%ebx
  45:	39 f3                	cmp    %esi,%ebx
  47:	7d db                	jge    24 <main+0x24>
  49:	ba 3e 07 00 00       	mov    $0x73e,%edx
  4e:	eb d9                	jmp    29 <main+0x29>
  exit();
  50:	e8 96 02 00 00       	call   2eb <exit>

00000055 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  55:	f3 0f 1e fb          	endbr32 
  59:	55                   	push   %ebp
  5a:	89 e5                	mov    %esp,%ebp
  5c:	56                   	push   %esi
  5d:	53                   	push   %ebx
  5e:	8b 75 08             	mov    0x8(%ebp),%esi
  61:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  64:	89 f0                	mov    %esi,%eax
  66:	89 d1                	mov    %edx,%ecx
  68:	83 c2 01             	add    $0x1,%edx
  6b:	89 c3                	mov    %eax,%ebx
  6d:	83 c0 01             	add    $0x1,%eax
  70:	0f b6 09             	movzbl (%ecx),%ecx
  73:	88 0b                	mov    %cl,(%ebx)
  75:	84 c9                	test   %cl,%cl
  77:	75 ed                	jne    66 <strcpy+0x11>
    ;
  return os;
}
  79:	89 f0                	mov    %esi,%eax
  7b:	5b                   	pop    %ebx
  7c:	5e                   	pop    %esi
  7d:	5d                   	pop    %ebp
  7e:	c3                   	ret    

0000007f <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7f:	f3 0f 1e fb          	endbr32 
  83:	55                   	push   %ebp
  84:	89 e5                	mov    %esp,%ebp
  86:	8b 4d 08             	mov    0x8(%ebp),%ecx
  89:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  8c:	0f b6 01             	movzbl (%ecx),%eax
  8f:	84 c0                	test   %al,%al
  91:	74 0c                	je     9f <strcmp+0x20>
  93:	3a 02                	cmp    (%edx),%al
  95:	75 08                	jne    9f <strcmp+0x20>
    p++, q++;
  97:	83 c1 01             	add    $0x1,%ecx
  9a:	83 c2 01             	add    $0x1,%edx
  9d:	eb ed                	jmp    8c <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
  9f:	0f b6 c0             	movzbl %al,%eax
  a2:	0f b6 12             	movzbl (%edx),%edx
  a5:	29 d0                	sub    %edx,%eax
}
  a7:	5d                   	pop    %ebp
  a8:	c3                   	ret    

000000a9 <strlen>:

uint
strlen(char *s)
{
  a9:	f3 0f 1e fb          	endbr32 
  ad:	55                   	push   %ebp
  ae:	89 e5                	mov    %esp,%ebp
  b0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  b3:	b8 00 00 00 00       	mov    $0x0,%eax
  b8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  bc:	74 05                	je     c3 <strlen+0x1a>
  be:	83 c0 01             	add    $0x1,%eax
  c1:	eb f5                	jmp    b8 <strlen+0xf>
    ;
  return n;
}
  c3:	5d                   	pop    %ebp
  c4:	c3                   	ret    

000000c5 <memset>:

void*
memset(void *dst, int c, uint n)
{
  c5:	f3 0f 1e fb          	endbr32 
  c9:	55                   	push   %ebp
  ca:	89 e5                	mov    %esp,%ebp
  cc:	57                   	push   %edi
  cd:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  d0:	89 d7                	mov    %edx,%edi
  d2:	8b 4d 10             	mov    0x10(%ebp),%ecx
  d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  d8:	fc                   	cld    
  d9:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  db:	89 d0                	mov    %edx,%eax
  dd:	5f                   	pop    %edi
  de:	5d                   	pop    %ebp
  df:	c3                   	ret    

000000e0 <strchr>:

char*
strchr(const char *s, char c)
{
  e0:	f3 0f 1e fb          	endbr32 
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	8b 45 08             	mov    0x8(%ebp),%eax
  ea:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  ee:	0f b6 10             	movzbl (%eax),%edx
  f1:	84 d2                	test   %dl,%dl
  f3:	74 09                	je     fe <strchr+0x1e>
    if(*s == c)
  f5:	38 ca                	cmp    %cl,%dl
  f7:	74 0a                	je     103 <strchr+0x23>
  for(; *s; s++)
  f9:	83 c0 01             	add    $0x1,%eax
  fc:	eb f0                	jmp    ee <strchr+0xe>
      return (char*)s;
  return 0;
  fe:	b8 00 00 00 00       	mov    $0x0,%eax
}
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    

00000105 <gets>:

char*
gets(char *buf, int max)
{
 105:	f3 0f 1e fb          	endbr32 
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	57                   	push   %edi
 10d:	56                   	push   %esi
 10e:	53                   	push   %ebx
 10f:	83 ec 1c             	sub    $0x1c,%esp
 112:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 115:	bb 00 00 00 00       	mov    $0x0,%ebx
 11a:	89 de                	mov    %ebx,%esi
 11c:	83 c3 01             	add    $0x1,%ebx
 11f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 122:	7d 2e                	jge    152 <gets+0x4d>
    cc = read(0, &c, 1);
 124:	83 ec 04             	sub    $0x4,%esp
 127:	6a 01                	push   $0x1
 129:	8d 45 e7             	lea    -0x19(%ebp),%eax
 12c:	50                   	push   %eax
 12d:	6a 00                	push   $0x0
 12f:	e8 cf 01 00 00       	call   303 <read>
    if(cc < 1)
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	7e 17                	jle    152 <gets+0x4d>
      break;
    buf[i++] = c;
 13b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 13f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 142:	3c 0a                	cmp    $0xa,%al
 144:	0f 94 c2             	sete   %dl
 147:	3c 0d                	cmp    $0xd,%al
 149:	0f 94 c0             	sete   %al
 14c:	08 c2                	or     %al,%dl
 14e:	74 ca                	je     11a <gets+0x15>
    buf[i++] = c;
 150:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 152:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 156:	89 f8                	mov    %edi,%eax
 158:	8d 65 f4             	lea    -0xc(%ebp),%esp
 15b:	5b                   	pop    %ebx
 15c:	5e                   	pop    %esi
 15d:	5f                   	pop    %edi
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <stat>:

int
stat(char *n, struct stat *st)
{
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	56                   	push   %esi
 168:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 169:	83 ec 08             	sub    $0x8,%esp
 16c:	6a 00                	push   $0x0
 16e:	ff 75 08             	pushl  0x8(%ebp)
 171:	e8 b5 01 00 00       	call   32b <open>
  if(fd < 0)
 176:	83 c4 10             	add    $0x10,%esp
 179:	85 c0                	test   %eax,%eax
 17b:	78 24                	js     1a1 <stat+0x41>
 17d:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 17f:	83 ec 08             	sub    $0x8,%esp
 182:	ff 75 0c             	pushl  0xc(%ebp)
 185:	50                   	push   %eax
 186:	e8 b8 01 00 00       	call   343 <fstat>
 18b:	89 c6                	mov    %eax,%esi
  close(fd);
 18d:	89 1c 24             	mov    %ebx,(%esp)
 190:	e8 7e 01 00 00       	call   313 <close>
  return r;
 195:	83 c4 10             	add    $0x10,%esp
}
 198:	89 f0                	mov    %esi,%eax
 19a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 19d:	5b                   	pop    %ebx
 19e:	5e                   	pop    %esi
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
    return -1;
 1a1:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1a6:	eb f0                	jmp    198 <stat+0x38>

000001a8 <atoi>:

#ifdef PDX_XV6
int
atoi(const char *s)
{
 1a8:	f3 0f 1e fb          	endbr32 
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	57                   	push   %edi
 1b0:	56                   	push   %esi
 1b1:	53                   	push   %ebx
 1b2:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 1b5:	0f b6 02             	movzbl (%edx),%eax
 1b8:	3c 20                	cmp    $0x20,%al
 1ba:	75 05                	jne    1c1 <atoi+0x19>
 1bc:	83 c2 01             	add    $0x1,%edx
 1bf:	eb f4                	jmp    1b5 <atoi+0xd>
  sign = (*s == '-') ? -1 : 1;
 1c1:	3c 2d                	cmp    $0x2d,%al
 1c3:	74 1d                	je     1e2 <atoi+0x3a>
 1c5:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 1ca:	3c 2b                	cmp    $0x2b,%al
 1cc:	0f 94 c1             	sete   %cl
 1cf:	3c 2d                	cmp    $0x2d,%al
 1d1:	0f 94 c0             	sete   %al
 1d4:	08 c1                	or     %al,%cl
 1d6:	74 03                	je     1db <atoi+0x33>
    s++;
 1d8:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 1db:	b8 00 00 00 00       	mov    $0x0,%eax
 1e0:	eb 17                	jmp    1f9 <atoi+0x51>
 1e2:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 1e7:	eb e1                	jmp    1ca <atoi+0x22>
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
 1e9:	8d 34 80             	lea    (%eax,%eax,4),%esi
 1ec:	8d 1c 36             	lea    (%esi,%esi,1),%ebx
 1ef:	83 c2 01             	add    $0x1,%edx
 1f2:	0f be c9             	movsbl %cl,%ecx
 1f5:	8d 44 19 d0          	lea    -0x30(%ecx,%ebx,1),%eax
  while('0' <= *s && *s <= '9')
 1f9:	0f b6 0a             	movzbl (%edx),%ecx
 1fc:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 1ff:	80 fb 09             	cmp    $0x9,%bl
 202:	76 e5                	jbe    1e9 <atoi+0x41>
  return sign*n;
 204:	0f af c7             	imul   %edi,%eax
}
 207:	5b                   	pop    %ebx
 208:	5e                   	pop    %esi
 209:	5f                   	pop    %edi
 20a:	5d                   	pop    %ebp
 20b:	c3                   	ret    

0000020c <atoo>:

int
atoo(const char *s)
{
 20c:	f3 0f 1e fb          	endbr32 
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
 215:	53                   	push   %ebx
 216:	8b 55 08             	mov    0x8(%ebp),%edx
  int n, sign;

  n = 0;
  while (*s == ' ') s++;
 219:	0f b6 0a             	movzbl (%edx),%ecx
 21c:	80 f9 20             	cmp    $0x20,%cl
 21f:	75 05                	jne    226 <atoo+0x1a>
 221:	83 c2 01             	add    $0x1,%edx
 224:	eb f3                	jmp    219 <atoo+0xd>
  sign = (*s == '-') ? -1 : 1;
 226:	80 f9 2d             	cmp    $0x2d,%cl
 229:	74 23                	je     24e <atoo+0x42>
 22b:	bf 01 00 00 00       	mov    $0x1,%edi
  if (*s == '+'  || *s == '-')
 230:	80 f9 2b             	cmp    $0x2b,%cl
 233:	0f 94 c0             	sete   %al
 236:	89 c6                	mov    %eax,%esi
 238:	80 f9 2d             	cmp    $0x2d,%cl
 23b:	0f 94 c0             	sete   %al
 23e:	89 f3                	mov    %esi,%ebx
 240:	08 c3                	or     %al,%bl
 242:	74 03                	je     247 <atoo+0x3b>
    s++;
 244:	83 c2 01             	add    $0x1,%edx
  sign = (*s == '-') ? -1 : 1;
 247:	b8 00 00 00 00       	mov    $0x0,%eax
 24c:	eb 11                	jmp    25f <atoo+0x53>
 24e:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 253:	eb db                	jmp    230 <atoo+0x24>
  while('0' <= *s && *s <= '7')
    n = n*8 + *s++ - '0';
 255:	83 c2 01             	add    $0x1,%edx
 258:	0f be c9             	movsbl %cl,%ecx
 25b:	8d 44 c1 d0          	lea    -0x30(%ecx,%eax,8),%eax
  while('0' <= *s && *s <= '7')
 25f:	0f b6 0a             	movzbl (%edx),%ecx
 262:	8d 59 d0             	lea    -0x30(%ecx),%ebx
 265:	80 fb 07             	cmp    $0x7,%bl
 268:	76 eb                	jbe    255 <atoo+0x49>
  return sign*n;
 26a:	0f af c7             	imul   %edi,%eax
}
 26d:	5b                   	pop    %ebx
 26e:	5e                   	pop    %esi
 26f:	5f                   	pop    %edi
 270:	5d                   	pop    %ebp
 271:	c3                   	ret    

00000272 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
 272:	f3 0f 1e fb          	endbr32 
 276:	55                   	push   %ebp
 277:	89 e5                	mov    %esp,%ebp
 279:	53                   	push   %ebx
 27a:	8b 55 08             	mov    0x8(%ebp),%edx
 27d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 280:	8b 45 10             	mov    0x10(%ebp),%eax
    while(n > 0 && *p && *p == *q)
 283:	eb 09                	jmp    28e <strncmp+0x1c>
      n--, p++, q++;
 285:	83 e8 01             	sub    $0x1,%eax
 288:	83 c2 01             	add    $0x1,%edx
 28b:	83 c1 01             	add    $0x1,%ecx
    while(n > 0 && *p && *p == *q)
 28e:	85 c0                	test   %eax,%eax
 290:	74 0b                	je     29d <strncmp+0x2b>
 292:	0f b6 1a             	movzbl (%edx),%ebx
 295:	84 db                	test   %bl,%bl
 297:	74 04                	je     29d <strncmp+0x2b>
 299:	3a 19                	cmp    (%ecx),%bl
 29b:	74 e8                	je     285 <strncmp+0x13>
    if(n == 0)
 29d:	85 c0                	test   %eax,%eax
 29f:	74 0b                	je     2ac <strncmp+0x3a>
      return 0;
    return (uchar)*p - (uchar)*q;
 2a1:	0f b6 02             	movzbl (%edx),%eax
 2a4:	0f b6 11             	movzbl (%ecx),%edx
 2a7:	29 d0                	sub    %edx,%eax
}
 2a9:	5b                   	pop    %ebx
 2aa:	5d                   	pop    %ebp
 2ab:	c3                   	ret    
      return 0;
 2ac:	b8 00 00 00 00       	mov    $0x0,%eax
 2b1:	eb f6                	jmp    2a9 <strncmp+0x37>

000002b3 <memmove>:
}
#endif // PDX_XV6

void*
memmove(void *vdst, void *vsrc, int n)
{
 2b3:	f3 0f 1e fb          	endbr32 
 2b7:	55                   	push   %ebp
 2b8:	89 e5                	mov    %esp,%ebp
 2ba:	56                   	push   %esi
 2bb:	53                   	push   %ebx
 2bc:	8b 75 08             	mov    0x8(%ebp),%esi
 2bf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2c2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst, *src;

  dst = vdst;
 2c5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2c7:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2ca:	85 c0                	test   %eax,%eax
 2cc:	7e 0f                	jle    2dd <memmove+0x2a>
    *dst++ = *src++;
 2ce:	0f b6 01             	movzbl (%ecx),%eax
 2d1:	88 02                	mov    %al,(%edx)
 2d3:	8d 49 01             	lea    0x1(%ecx),%ecx
 2d6:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2d9:	89 d8                	mov    %ebx,%eax
 2db:	eb ea                	jmp    2c7 <memmove+0x14>
  return vdst;
}
 2dd:	89 f0                	mov    %esi,%eax
 2df:	5b                   	pop    %ebx
 2e0:	5e                   	pop    %esi
 2e1:	5d                   	pop    %ebp
 2e2:	c3                   	ret    

000002e3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2e3:	b8 01 00 00 00       	mov    $0x1,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <exit>:
SYSCALL(exit)
 2eb:	b8 02 00 00 00       	mov    $0x2,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <wait>:
SYSCALL(wait)
 2f3:	b8 03 00 00 00       	mov    $0x3,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <pipe>:
SYSCALL(pipe)
 2fb:	b8 04 00 00 00       	mov    $0x4,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <read>:
SYSCALL(read)
 303:	b8 05 00 00 00       	mov    $0x5,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <write>:
SYSCALL(write)
 30b:	b8 10 00 00 00       	mov    $0x10,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <close>:
SYSCALL(close)
 313:	b8 15 00 00 00       	mov    $0x15,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <kill>:
SYSCALL(kill)
 31b:	b8 06 00 00 00       	mov    $0x6,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <exec>:
SYSCALL(exec)
 323:	b8 07 00 00 00       	mov    $0x7,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <open>:
SYSCALL(open)
 32b:	b8 0f 00 00 00       	mov    $0xf,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <mknod>:
SYSCALL(mknod)
 333:	b8 11 00 00 00       	mov    $0x11,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <unlink>:
SYSCALL(unlink)
 33b:	b8 12 00 00 00       	mov    $0x12,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <fstat>:
SYSCALL(fstat)
 343:	b8 08 00 00 00       	mov    $0x8,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <link>:
SYSCALL(link)
 34b:	b8 13 00 00 00       	mov    $0x13,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <mkdir>:
SYSCALL(mkdir)
 353:	b8 14 00 00 00       	mov    $0x14,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <chdir>:
SYSCALL(chdir)
 35b:	b8 09 00 00 00       	mov    $0x9,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <dup>:
SYSCALL(dup)
 363:	b8 0a 00 00 00       	mov    $0xa,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <getpid>:
SYSCALL(getpid)
 36b:	b8 0b 00 00 00       	mov    $0xb,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <sbrk>:
SYSCALL(sbrk)
 373:	b8 0c 00 00 00       	mov    $0xc,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <sleep>:
SYSCALL(sleep)
 37b:	b8 0d 00 00 00       	mov    $0xd,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <uptime>:
SYSCALL(uptime)
 383:	b8 0e 00 00 00       	mov    $0xe,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <halt>:
SYSCALL(halt)
 38b:	b8 16 00 00 00       	mov    $0x16,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <date>:
SYSCALL(date)
 393:	b8 17 00 00 00       	mov    $0x17,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <getuid>:
SYSCALL(getuid)
 39b:	b8 18 00 00 00       	mov    $0x18,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <getgid>:
SYSCALL(getgid)
 3a3:	b8 19 00 00 00       	mov    $0x19,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <getppid>:
SYSCALL(getppid)
 3ab:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <setuid>:
SYSCALL(setuid)
 3b3:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <setgid>:
SYSCALL(setgid)
 3bb:	b8 1c 00 00 00       	mov    $0x1c,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <getprocs>:
SYSCALL(getprocs)
 3c3:	b8 1d 00 00 00       	mov    $0x1d,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <setpriority>:
SYSCALL(setpriority)
 3cb:	b8 1e 00 00 00       	mov    $0x1e,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <getpriority>:
SYSCALL(getpriority)
 3d3:	b8 1f 00 00 00       	mov    $0x1f,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
 3de:	83 ec 1c             	sub    $0x1c,%esp
 3e1:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3e4:	6a 01                	push   $0x1
 3e6:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3e9:	52                   	push   %edx
 3ea:	50                   	push   %eax
 3eb:	e8 1b ff ff ff       	call   30b <write>
}
 3f0:	83 c4 10             	add    $0x10,%esp
 3f3:	c9                   	leave  
 3f4:	c3                   	ret    

000003f5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3f5:	55                   	push   %ebp
 3f6:	89 e5                	mov    %esp,%ebp
 3f8:	57                   	push   %edi
 3f9:	56                   	push   %esi
 3fa:	53                   	push   %ebx
 3fb:	83 ec 2c             	sub    $0x2c,%esp
 3fe:	89 45 d0             	mov    %eax,-0x30(%ebp)
 401:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 403:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 407:	0f 95 c2             	setne  %dl
 40a:	89 f0                	mov    %esi,%eax
 40c:	c1 e8 1f             	shr    $0x1f,%eax
 40f:	84 c2                	test   %al,%dl
 411:	74 42                	je     455 <printint+0x60>
    neg = 1;
    x = -xx;
 413:	f7 de                	neg    %esi
    neg = 1;
 415:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 41c:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 421:	89 f0                	mov    %esi,%eax
 423:	ba 00 00 00 00       	mov    $0x0,%edx
 428:	f7 f1                	div    %ecx
 42a:	89 df                	mov    %ebx,%edi
 42c:	83 c3 01             	add    $0x1,%ebx
 42f:	0f b6 92 4c 07 00 00 	movzbl 0x74c(%edx),%edx
 436:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 43a:	89 f2                	mov    %esi,%edx
 43c:	89 c6                	mov    %eax,%esi
 43e:	39 d1                	cmp    %edx,%ecx
 440:	76 df                	jbe    421 <printint+0x2c>
  if(neg)
 442:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 446:	74 2f                	je     477 <printint+0x82>
    buf[i++] = '-';
 448:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 44d:	8d 5f 02             	lea    0x2(%edi),%ebx
 450:	8b 75 d0             	mov    -0x30(%ebp),%esi
 453:	eb 15                	jmp    46a <printint+0x75>
  neg = 0;
 455:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 45c:	eb be                	jmp    41c <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 45e:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 463:	89 f0                	mov    %esi,%eax
 465:	e8 71 ff ff ff       	call   3db <putc>
  while(--i >= 0)
 46a:	83 eb 01             	sub    $0x1,%ebx
 46d:	79 ef                	jns    45e <printint+0x69>
}
 46f:	83 c4 2c             	add    $0x2c,%esp
 472:	5b                   	pop    %ebx
 473:	5e                   	pop    %esi
 474:	5f                   	pop    %edi
 475:	5d                   	pop    %ebp
 476:	c3                   	ret    
 477:	8b 75 d0             	mov    -0x30(%ebp),%esi
 47a:	eb ee                	jmp    46a <printint+0x75>

0000047c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 47c:	f3 0f 1e fb          	endbr32 
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 489:	8d 45 10             	lea    0x10(%ebp),%eax
 48c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 48f:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 494:	bb 00 00 00 00       	mov    $0x0,%ebx
 499:	eb 14                	jmp    4af <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 49b:	89 fa                	mov    %edi,%edx
 49d:	8b 45 08             	mov    0x8(%ebp),%eax
 4a0:	e8 36 ff ff ff       	call   3db <putc>
 4a5:	eb 05                	jmp    4ac <printf+0x30>
      }
    } else if(state == '%'){
 4a7:	83 fe 25             	cmp    $0x25,%esi
 4aa:	74 25                	je     4d1 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 4ac:	83 c3 01             	add    $0x1,%ebx
 4af:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b2:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4b6:	84 c0                	test   %al,%al
 4b8:	0f 84 23 01 00 00    	je     5e1 <printf+0x165>
    c = fmt[i] & 0xff;
 4be:	0f be f8             	movsbl %al,%edi
 4c1:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4c4:	85 f6                	test   %esi,%esi
 4c6:	75 df                	jne    4a7 <printf+0x2b>
      if(c == '%'){
 4c8:	83 f8 25             	cmp    $0x25,%eax
 4cb:	75 ce                	jne    49b <printf+0x1f>
        state = '%';
 4cd:	89 c6                	mov    %eax,%esi
 4cf:	eb db                	jmp    4ac <printf+0x30>
      if(c == 'd'){
 4d1:	83 f8 64             	cmp    $0x64,%eax
 4d4:	74 49                	je     51f <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4d6:	83 f8 78             	cmp    $0x78,%eax
 4d9:	0f 94 c1             	sete   %cl
 4dc:	83 f8 70             	cmp    $0x70,%eax
 4df:	0f 94 c2             	sete   %dl
 4e2:	08 d1                	or     %dl,%cl
 4e4:	75 63                	jne    549 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4e6:	83 f8 73             	cmp    $0x73,%eax
 4e9:	0f 84 84 00 00 00    	je     573 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4ef:	83 f8 63             	cmp    $0x63,%eax
 4f2:	0f 84 b7 00 00 00    	je     5af <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4f8:	83 f8 25             	cmp    $0x25,%eax
 4fb:	0f 84 cc 00 00 00    	je     5cd <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 501:	ba 25 00 00 00       	mov    $0x25,%edx
 506:	8b 45 08             	mov    0x8(%ebp),%eax
 509:	e8 cd fe ff ff       	call   3db <putc>
        putc(fd, c);
 50e:	89 fa                	mov    %edi,%edx
 510:	8b 45 08             	mov    0x8(%ebp),%eax
 513:	e8 c3 fe ff ff       	call   3db <putc>
      }
      state = 0;
 518:	be 00 00 00 00       	mov    $0x0,%esi
 51d:	eb 8d                	jmp    4ac <printf+0x30>
        printint(fd, *ap, 10, 1);
 51f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 522:	8b 17                	mov    (%edi),%edx
 524:	83 ec 0c             	sub    $0xc,%esp
 527:	6a 01                	push   $0x1
 529:	b9 0a 00 00 00       	mov    $0xa,%ecx
 52e:	8b 45 08             	mov    0x8(%ebp),%eax
 531:	e8 bf fe ff ff       	call   3f5 <printint>
        ap++;
 536:	83 c7 04             	add    $0x4,%edi
 539:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 53c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 53f:	be 00 00 00 00       	mov    $0x0,%esi
 544:	e9 63 ff ff ff       	jmp    4ac <printf+0x30>
        printint(fd, *ap, 16, 0);
 549:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 54c:	8b 17                	mov    (%edi),%edx
 54e:	83 ec 0c             	sub    $0xc,%esp
 551:	6a 00                	push   $0x0
 553:	b9 10 00 00 00       	mov    $0x10,%ecx
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	e8 95 fe ff ff       	call   3f5 <printint>
        ap++;
 560:	83 c7 04             	add    $0x4,%edi
 563:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 566:	83 c4 10             	add    $0x10,%esp
      state = 0;
 569:	be 00 00 00 00       	mov    $0x0,%esi
 56e:	e9 39 ff ff ff       	jmp    4ac <printf+0x30>
        s = (char*)*ap;
 573:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 576:	8b 30                	mov    (%eax),%esi
        ap++;
 578:	83 c0 04             	add    $0x4,%eax
 57b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 57e:	85 f6                	test   %esi,%esi
 580:	75 28                	jne    5aa <printf+0x12e>
          s = "(null)";
 582:	be 45 07 00 00       	mov    $0x745,%esi
 587:	8b 7d 08             	mov    0x8(%ebp),%edi
 58a:	eb 0d                	jmp    599 <printf+0x11d>
          putc(fd, *s);
 58c:	0f be d2             	movsbl %dl,%edx
 58f:	89 f8                	mov    %edi,%eax
 591:	e8 45 fe ff ff       	call   3db <putc>
          s++;
 596:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 599:	0f b6 16             	movzbl (%esi),%edx
 59c:	84 d2                	test   %dl,%dl
 59e:	75 ec                	jne    58c <printf+0x110>
      state = 0;
 5a0:	be 00 00 00 00       	mov    $0x0,%esi
 5a5:	e9 02 ff ff ff       	jmp    4ac <printf+0x30>
 5aa:	8b 7d 08             	mov    0x8(%ebp),%edi
 5ad:	eb ea                	jmp    599 <printf+0x11d>
        putc(fd, *ap);
 5af:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5b2:	0f be 17             	movsbl (%edi),%edx
 5b5:	8b 45 08             	mov    0x8(%ebp),%eax
 5b8:	e8 1e fe ff ff       	call   3db <putc>
        ap++;
 5bd:	83 c7 04             	add    $0x4,%edi
 5c0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5c3:	be 00 00 00 00       	mov    $0x0,%esi
 5c8:	e9 df fe ff ff       	jmp    4ac <printf+0x30>
        putc(fd, c);
 5cd:	89 fa                	mov    %edi,%edx
 5cf:	8b 45 08             	mov    0x8(%ebp),%eax
 5d2:	e8 04 fe ff ff       	call   3db <putc>
      state = 0;
 5d7:	be 00 00 00 00       	mov    $0x0,%esi
 5dc:	e9 cb fe ff ff       	jmp    4ac <printf+0x30>
    }
  }
}
 5e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e4:	5b                   	pop    %ebx
 5e5:	5e                   	pop    %esi
 5e6:	5f                   	pop    %edi
 5e7:	5d                   	pop    %ebp
 5e8:	c3                   	ret    

000005e9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e9:	f3 0f 1e fb          	endbr32 
 5ed:	55                   	push   %ebp
 5ee:	89 e5                	mov    %esp,%ebp
 5f0:	57                   	push   %edi
 5f1:	56                   	push   %esi
 5f2:	53                   	push   %ebx
 5f3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5f6:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f9:	a1 54 0a 00 00       	mov    0xa54,%eax
 5fe:	eb 02                	jmp    602 <free+0x19>
 600:	89 d0                	mov    %edx,%eax
 602:	39 c8                	cmp    %ecx,%eax
 604:	73 04                	jae    60a <free+0x21>
 606:	39 08                	cmp    %ecx,(%eax)
 608:	77 12                	ja     61c <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 60a:	8b 10                	mov    (%eax),%edx
 60c:	39 c2                	cmp    %eax,%edx
 60e:	77 f0                	ja     600 <free+0x17>
 610:	39 c8                	cmp    %ecx,%eax
 612:	72 08                	jb     61c <free+0x33>
 614:	39 ca                	cmp    %ecx,%edx
 616:	77 04                	ja     61c <free+0x33>
 618:	89 d0                	mov    %edx,%eax
 61a:	eb e6                	jmp    602 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 61c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 61f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 622:	8b 10                	mov    (%eax),%edx
 624:	39 d7                	cmp    %edx,%edi
 626:	74 19                	je     641 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 628:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 62b:	8b 50 04             	mov    0x4(%eax),%edx
 62e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 631:	39 ce                	cmp    %ecx,%esi
 633:	74 1b                	je     650 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 635:	89 08                	mov    %ecx,(%eax)
  freep = p;
 637:	a3 54 0a 00 00       	mov    %eax,0xa54
}
 63c:	5b                   	pop    %ebx
 63d:	5e                   	pop    %esi
 63e:	5f                   	pop    %edi
 63f:	5d                   	pop    %ebp
 640:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 641:	03 72 04             	add    0x4(%edx),%esi
 644:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 647:	8b 10                	mov    (%eax),%edx
 649:	8b 12                	mov    (%edx),%edx
 64b:	89 53 f8             	mov    %edx,-0x8(%ebx)
 64e:	eb db                	jmp    62b <free+0x42>
    p->s.size += bp->s.size;
 650:	03 53 fc             	add    -0x4(%ebx),%edx
 653:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 656:	8b 53 f8             	mov    -0x8(%ebx),%edx
 659:	89 10                	mov    %edx,(%eax)
 65b:	eb da                	jmp    637 <free+0x4e>

0000065d <morecore>:

static Header*
morecore(uint nu)
{
 65d:	55                   	push   %ebp
 65e:	89 e5                	mov    %esp,%ebp
 660:	53                   	push   %ebx
 661:	83 ec 04             	sub    $0x4,%esp
 664:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 666:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 66b:	77 05                	ja     672 <morecore+0x15>
    nu = 4096;
 66d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 672:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 679:	83 ec 0c             	sub    $0xc,%esp
 67c:	50                   	push   %eax
 67d:	e8 f1 fc ff ff       	call   373 <sbrk>
  if(p == (char*)-1)
 682:	83 c4 10             	add    $0x10,%esp
 685:	83 f8 ff             	cmp    $0xffffffff,%eax
 688:	74 1c                	je     6a6 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 68a:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 68d:	83 c0 08             	add    $0x8,%eax
 690:	83 ec 0c             	sub    $0xc,%esp
 693:	50                   	push   %eax
 694:	e8 50 ff ff ff       	call   5e9 <free>
  return freep;
 699:	a1 54 0a 00 00       	mov    0xa54,%eax
 69e:	83 c4 10             	add    $0x10,%esp
}
 6a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6a4:	c9                   	leave  
 6a5:	c3                   	ret    
    return 0;
 6a6:	b8 00 00 00 00       	mov    $0x0,%eax
 6ab:	eb f4                	jmp    6a1 <morecore+0x44>

000006ad <malloc>:

void*
malloc(uint nbytes)
{
 6ad:	f3 0f 1e fb          	endbr32 
 6b1:	55                   	push   %ebp
 6b2:	89 e5                	mov    %esp,%ebp
 6b4:	53                   	push   %ebx
 6b5:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b8:	8b 45 08             	mov    0x8(%ebp),%eax
 6bb:	8d 58 07             	lea    0x7(%eax),%ebx
 6be:	c1 eb 03             	shr    $0x3,%ebx
 6c1:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6c4:	8b 0d 54 0a 00 00    	mov    0xa54,%ecx
 6ca:	85 c9                	test   %ecx,%ecx
 6cc:	74 04                	je     6d2 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6ce:	8b 01                	mov    (%ecx),%eax
 6d0:	eb 4b                	jmp    71d <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 6d2:	c7 05 54 0a 00 00 58 	movl   $0xa58,0xa54
 6d9:	0a 00 00 
 6dc:	c7 05 58 0a 00 00 58 	movl   $0xa58,0xa58
 6e3:	0a 00 00 
    base.s.size = 0;
 6e6:	c7 05 5c 0a 00 00 00 	movl   $0x0,0xa5c
 6ed:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 6f0:	b9 58 0a 00 00       	mov    $0xa58,%ecx
 6f5:	eb d7                	jmp    6ce <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6f7:	74 1a                	je     713 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6f9:	29 da                	sub    %ebx,%edx
 6fb:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6fe:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 701:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 704:	89 0d 54 0a 00 00    	mov    %ecx,0xa54
      return (void*)(p + 1);
 70a:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 70d:	83 c4 04             	add    $0x4,%esp
 710:	5b                   	pop    %ebx
 711:	5d                   	pop    %ebp
 712:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 713:	8b 10                	mov    (%eax),%edx
 715:	89 11                	mov    %edx,(%ecx)
 717:	eb eb                	jmp    704 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 719:	89 c1                	mov    %eax,%ecx
 71b:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 71d:	8b 50 04             	mov    0x4(%eax),%edx
 720:	39 da                	cmp    %ebx,%edx
 722:	73 d3                	jae    6f7 <malloc+0x4a>
    if(p == freep)
 724:	39 05 54 0a 00 00    	cmp    %eax,0xa54
 72a:	75 ed                	jne    719 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 72c:	89 d8                	mov    %ebx,%eax
 72e:	e8 2a ff ff ff       	call   65d <morecore>
 733:	85 c0                	test   %eax,%eax
 735:	75 e2                	jne    719 <malloc+0x6c>
 737:	eb d4                	jmp    70d <malloc+0x60>
