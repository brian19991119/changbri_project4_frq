
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  int fd, i;
  char *pattern;

  if(argc <= 1){
  19:	83 ff 01             	cmp    $0x1,%edi
  1c:	7e 7c                	jle    9a <main+0x9a>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  1e:	8b 43 04             	mov    0x4(%ebx),%eax
  21:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  24:	83 ff 02             	cmp    $0x2,%edi
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  27:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  2c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  2f:	74 46                	je     77 <main+0x77>
  31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if((fd = open(argv[i], 0)) < 0){
  38:	83 ec 08             	sub    $0x8,%esp
  3b:	6a 00                	push   $0x0
  3d:	ff 33                	pushl  (%ebx)
  3f:	e8 be 05 00 00       	call   602 <open>
  44:	83 c4 10             	add    $0x10,%esp
  47:	85 c0                	test   %eax,%eax
  49:	78 3b                	js     86 <main+0x86>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  4b:	83 ec 08             	sub    $0x8,%esp
  4e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(i = 2; i < argc; i++){
  51:	83 c6 01             	add    $0x1,%esi
    grep(pattern, fd);
  54:	50                   	push   %eax
  55:	ff 75 e0             	pushl  -0x20(%ebp)
  58:	83 c3 04             	add    $0x4,%ebx
  5b:	e8 d0 01 00 00       	call   230 <grep>
    close(fd);
  60:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  63:	89 04 24             	mov    %eax,(%esp)
  66:	e8 7f 05 00 00       	call   5ea <close>
  for(i = 2; i < argc; i++){
  6b:	83 c4 10             	add    $0x10,%esp
  6e:	39 f7                	cmp    %esi,%edi
  70:	7f c6                	jg     38 <main+0x38>
  }
  exit();
  72:	e8 4b 05 00 00       	call   5c2 <exit>
    grep(pattern, 0);
  77:	52                   	push   %edx
  78:	52                   	push   %edx
  79:	6a 00                	push   $0x0
  7b:	50                   	push   %eax
  7c:	e8 af 01 00 00       	call   230 <grep>
    exit();
  81:	e8 3c 05 00 00       	call   5c2 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
  86:	50                   	push   %eax
  87:	ff 33                	pushl  (%ebx)
  89:	68 98 0a 00 00       	push   $0xa98
  8e:	6a 01                	push   $0x1
  90:	e8 8b 06 00 00       	call   720 <printf>
      exit();
  95:	e8 28 05 00 00       	call   5c2 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  9a:	51                   	push   %ecx
  9b:	51                   	push   %ecx
  9c:	68 78 0a 00 00       	push   $0xa78
  a1:	6a 02                	push   $0x2
  a3:	e8 78 06 00 00       	call   720 <printf>
    exit();
  a8:	e8 15 05 00 00       	call   5c2 <exit>
  ad:	66 90                	xchg   %ax,%ax
  af:	90                   	nop

000000b0 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  b6:	83 ec 0c             	sub    $0xc,%esp
  b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bc:	8b 75 0c             	mov    0xc(%ebp),%esi
  bf:	8b 7d 10             	mov    0x10(%ebp),%edi
  c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  c8:	83 ec 08             	sub    $0x8,%esp
  cb:	57                   	push   %edi
  cc:	56                   	push   %esi
  cd:	e8 3e 00 00 00       	call   110 <matchhere>
  d2:	83 c4 10             	add    $0x10,%esp
  d5:	85 c0                	test   %eax,%eax
  d7:	75 1f                	jne    f8 <matchstar+0x48>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  d9:	0f be 17             	movsbl (%edi),%edx
  dc:	84 d2                	test   %dl,%dl
  de:	74 0c                	je     ec <matchstar+0x3c>
  e0:	83 c7 01             	add    $0x1,%edi
  e3:	39 da                	cmp    %ebx,%edx
  e5:	74 e1                	je     c8 <matchstar+0x18>
  e7:	83 fb 2e             	cmp    $0x2e,%ebx
  ea:	74 dc                	je     c8 <matchstar+0x18>
  return 0;
}
  ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ef:	5b                   	pop    %ebx
  f0:	5e                   	pop    %esi
  f1:	5f                   	pop    %edi
  f2:	5d                   	pop    %ebp
  f3:	c3                   	ret    
  f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
  fb:	b8 01 00 00 00       	mov    $0x1,%eax
}
 100:	5b                   	pop    %ebx
 101:	5e                   	pop    %esi
 102:	5f                   	pop    %edi
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    
 105:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000110 <matchhere>:
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	56                   	push   %esi
 115:	53                   	push   %ebx
 116:	83 ec 0c             	sub    $0xc,%esp
  if(re[0] == '\0')
 119:	8b 45 08             	mov    0x8(%ebp),%eax
{
 11c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
 11f:	0f b6 08             	movzbl (%eax),%ecx
 122:	84 c9                	test   %cl,%cl
 124:	74 67                	je     18d <matchhere+0x7d>
  if(re[1] == '*')
 126:	0f be 40 01          	movsbl 0x1(%eax),%eax
 12a:	3c 2a                	cmp    $0x2a,%al
 12c:	74 6c                	je     19a <matchhere+0x8a>
  if(re[0] == '$' && re[1] == '\0')
 12e:	80 f9 24             	cmp    $0x24,%cl
 131:	0f b6 1f             	movzbl (%edi),%ebx
 134:	75 08                	jne    13e <matchhere+0x2e>
 136:	84 c0                	test   %al,%al
 138:	0f 84 81 00 00 00    	je     1bf <matchhere+0xaf>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 13e:	84 db                	test   %bl,%bl
 140:	74 09                	je     14b <matchhere+0x3b>
 142:	38 d9                	cmp    %bl,%cl
 144:	74 3c                	je     182 <matchhere+0x72>
 146:	80 f9 2e             	cmp    $0x2e,%cl
 149:	74 37                	je     182 <matchhere+0x72>
}
 14b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 14e:	31 c0                	xor    %eax,%eax
}
 150:	5b                   	pop    %ebx
 151:	5e                   	pop    %esi
 152:	5f                   	pop    %edi
 153:	5d                   	pop    %ebp
 154:	c3                   	ret    
 155:	8d 76 00             	lea    0x0(%esi),%esi
  if(re[1] == '*')
 158:	8b 75 08             	mov    0x8(%ebp),%esi
 15b:	0f b6 4e 01          	movzbl 0x1(%esi),%ecx
 15f:	80 f9 2a             	cmp    $0x2a,%cl
 162:	74 3b                	je     19f <matchhere+0x8f>
  if(re[0] == '$' && re[1] == '\0')
 164:	3c 24                	cmp    $0x24,%al
 166:	75 04                	jne    16c <matchhere+0x5c>
 168:	84 c9                	test   %cl,%cl
 16a:	74 4f                	je     1bb <matchhere+0xab>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 16c:	0f b6 33             	movzbl (%ebx),%esi
 16f:	89 f2                	mov    %esi,%edx
 171:	84 d2                	test   %dl,%dl
 173:	74 d6                	je     14b <matchhere+0x3b>
 175:	3c 2e                	cmp    $0x2e,%al
 177:	89 df                	mov    %ebx,%edi
 179:	74 04                	je     17f <matchhere+0x6f>
 17b:	38 c2                	cmp    %al,%dl
 17d:	75 cc                	jne    14b <matchhere+0x3b>
 17f:	0f be c1             	movsbl %cl,%eax
    return matchhere(re+1, text+1);
 182:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  if(re[0] == '\0')
 186:	84 c0                	test   %al,%al
    return matchhere(re+1, text+1);
 188:	8d 5f 01             	lea    0x1(%edi),%ebx
  if(re[0] == '\0')
 18b:	75 cb                	jne    158 <matchhere+0x48>
    return 1;
 18d:	b8 01 00 00 00       	mov    $0x1,%eax
}
 192:	8d 65 f4             	lea    -0xc(%ebp),%esp
 195:	5b                   	pop    %ebx
 196:	5e                   	pop    %esi
 197:	5f                   	pop    %edi
 198:	5d                   	pop    %ebp
 199:	c3                   	ret    
  if(re[1] == '*')
 19a:	89 fb                	mov    %edi,%ebx
 19c:	0f be c1             	movsbl %cl,%eax
    return matchstar(re[0], re+2, text);
 19f:	8b 7d 08             	mov    0x8(%ebp),%edi
 1a2:	83 ec 04             	sub    $0x4,%esp
 1a5:	53                   	push   %ebx
 1a6:	8d 57 02             	lea    0x2(%edi),%edx
 1a9:	52                   	push   %edx
 1aa:	50                   	push   %eax
 1ab:	e8 00 ff ff ff       	call   b0 <matchstar>
 1b0:	83 c4 10             	add    $0x10,%esp
}
 1b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1b6:	5b                   	pop    %ebx
 1b7:	5e                   	pop    %esi
 1b8:	5f                   	pop    %edi
 1b9:	5d                   	pop    %ebp
 1ba:	c3                   	ret    
 1bb:	0f b6 5f 01          	movzbl 0x1(%edi),%ebx
    return *text == '\0';
 1bf:	31 c0                	xor    %eax,%eax
 1c1:	84 db                	test   %bl,%bl
 1c3:	0f 94 c0             	sete   %al
 1c6:	eb ca                	jmp    192 <matchhere+0x82>
 1c8:	90                   	nop
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <match>:
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
 1d5:	8b 75 08             	mov    0x8(%ebp),%esi
 1d8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
 1db:	80 3e 5e             	cmpb   $0x5e,(%esi)
 1de:	75 11                	jne    1f1 <match+0x21>
 1e0:	eb 2e                	jmp    210 <match+0x40>
 1e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 1e8:	83 c3 01             	add    $0x1,%ebx
 1eb:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
 1ef:	74 16                	je     207 <match+0x37>
    if(matchhere(re, text))
 1f1:	83 ec 08             	sub    $0x8,%esp
 1f4:	53                   	push   %ebx
 1f5:	56                   	push   %esi
 1f6:	e8 15 ff ff ff       	call   110 <matchhere>
 1fb:	83 c4 10             	add    $0x10,%esp
 1fe:	85 c0                	test   %eax,%eax
 200:	74 e6                	je     1e8 <match+0x18>
      return 1;
 202:	b8 01 00 00 00       	mov    $0x1,%eax
}
 207:	8d 65 f8             	lea    -0x8(%ebp),%esp
 20a:	5b                   	pop    %ebx
 20b:	5e                   	pop    %esi
 20c:	5d                   	pop    %ebp
 20d:	c3                   	ret    
 20e:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
 210:	83 c6 01             	add    $0x1,%esi
 213:	89 75 08             	mov    %esi,0x8(%ebp)
}
 216:	8d 65 f8             	lea    -0x8(%ebp),%esp
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 21c:	e9 ef fe ff ff       	jmp    110 <matchhere>
 221:	eb 0d                	jmp    230 <grep>
 223:	90                   	nop
 224:	90                   	nop
 225:	90                   	nop
 226:	90                   	nop
 227:	90                   	nop
 228:	90                   	nop
 229:	90                   	nop
 22a:	90                   	nop
 22b:	90                   	nop
 22c:	90                   	nop
 22d:	90                   	nop
 22e:	90                   	nop
 22f:	90                   	nop

00000230 <grep>:
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
 235:	53                   	push   %ebx
  m = 0;
 236:	31 f6                	xor    %esi,%esi
{
 238:	83 ec 1c             	sub    $0x1c,%esp
 23b:	90                   	nop
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 240:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 245:	83 ec 04             	sub    $0x4,%esp
 248:	29 f0                	sub    %esi,%eax
 24a:	50                   	push   %eax
 24b:	8d 86 e0 0e 00 00    	lea    0xee0(%esi),%eax
 251:	50                   	push   %eax
 252:	ff 75 0c             	pushl  0xc(%ebp)
 255:	e8 80 03 00 00       	call   5da <read>
 25a:	83 c4 10             	add    $0x10,%esp
 25d:	85 c0                	test   %eax,%eax
 25f:	0f 8e bb 00 00 00    	jle    320 <grep+0xf0>
    m += n;
 265:	01 c6                	add    %eax,%esi
    p = buf;
 267:	bb e0 0e 00 00       	mov    $0xee0,%ebx
    buf[m] = '\0';
 26c:	c6 86 e0 0e 00 00 00 	movb   $0x0,0xee0(%esi)
 273:	89 75 e4             	mov    %esi,-0x1c(%ebp)
 276:	8d 76 00             	lea    0x0(%esi),%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    while((q = strchr(p, '\n')) != 0){
 280:	83 ec 08             	sub    $0x8,%esp
 283:	6a 0a                	push   $0xa
 285:	53                   	push   %ebx
 286:	e8 b5 01 00 00       	call   440 <strchr>
 28b:	83 c4 10             	add    $0x10,%esp
 28e:	85 c0                	test   %eax,%eax
 290:	89 c6                	mov    %eax,%esi
 292:	74 44                	je     2d8 <grep+0xa8>
      if(match(pattern, p)){
 294:	83 ec 08             	sub    $0x8,%esp
      *q = 0;
 297:	c6 06 00             	movb   $0x0,(%esi)
 29a:	8d 7e 01             	lea    0x1(%esi),%edi
      if(match(pattern, p)){
 29d:	53                   	push   %ebx
 29e:	ff 75 08             	pushl  0x8(%ebp)
 2a1:	e8 2a ff ff ff       	call   1d0 <match>
 2a6:	83 c4 10             	add    $0x10,%esp
 2a9:	85 c0                	test   %eax,%eax
 2ab:	75 0b                	jne    2b8 <grep+0x88>
      p = q+1;
 2ad:	89 fb                	mov    %edi,%ebx
 2af:	eb cf                	jmp    280 <grep+0x50>
 2b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        write(1, p, q+1 - p);
 2b8:	89 f8                	mov    %edi,%eax
 2ba:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 2bd:	c6 06 0a             	movb   $0xa,(%esi)
        write(1, p, q+1 - p);
 2c0:	29 d8                	sub    %ebx,%eax
 2c2:	50                   	push   %eax
 2c3:	53                   	push   %ebx
      p = q+1;
 2c4:	89 fb                	mov    %edi,%ebx
        write(1, p, q+1 - p);
 2c6:	6a 01                	push   $0x1
 2c8:	e8 15 03 00 00       	call   5e2 <write>
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	eb ae                	jmp    280 <grep+0x50>
 2d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(p == buf)
 2d8:	81 fb e0 0e 00 00    	cmp    $0xee0,%ebx
 2de:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 2e1:	74 2d                	je     310 <grep+0xe0>
    if(m > 0){
 2e3:	85 f6                	test   %esi,%esi
 2e5:	0f 8e 55 ff ff ff    	jle    240 <grep+0x10>
      m -= p - buf;
 2eb:	89 d8                	mov    %ebx,%eax
      memmove(buf, p, m);
 2ed:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 2f0:	2d e0 0e 00 00       	sub    $0xee0,%eax
 2f5:	29 c6                	sub    %eax,%esi
      memmove(buf, p, m);
 2f7:	56                   	push   %esi
 2f8:	53                   	push   %ebx
 2f9:	68 e0 0e 00 00       	push   $0xee0
 2fe:	e8 8d 02 00 00       	call   590 <memmove>
 303:	83 c4 10             	add    $0x10,%esp
 306:	e9 35 ff ff ff       	jmp    240 <grep+0x10>
 30b:	90                   	nop
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m = 0;
 310:	31 f6                	xor    %esi,%esi
 312:	e9 29 ff ff ff       	jmp    240 <grep+0x10>
 317:	89 f6                	mov    %esi,%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}
 320:	8d 65 f4             	lea    -0xc(%ebp),%esp
 323:	5b                   	pop    %ebx
 324:	5e                   	pop    %esi
 325:	5f                   	pop    %edi
 326:	5d                   	pop    %ebp
 327:	c3                   	ret    
 328:	66 90                	xchg   %ax,%ax
 32a:	66 90                	xchg   %ax,%ax
 32c:	66 90                	xchg   %ax,%ax
 32e:	66 90                	xchg   %ax,%ax

00000330 <init_lock>:
#include "user.h"
#include "x86.h"
#include "spinlock.h"

void
init_lock(struct spinlock * lk) {
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
  lk->locked = 0;
 333:	8b 45 08             	mov    0x8(%ebp),%eax
 336:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 33c:	5d                   	pop    %ebp
 33d:	c3                   	ret    
 33e:	66 90                	xchg   %ax,%ax

00000340 <lock>:
void lock(struct spinlock * lk) {
 340:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 341:	b9 01 00 00 00       	mov    $0x1,%ecx
 346:	89 e5                	mov    %esp,%ebp
 348:	8b 55 08             	mov    0x8(%ebp),%edx
 34b:	90                   	nop
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 350:	89 c8                	mov    %ecx,%eax
 352:	f0 87 02             	lock xchg %eax,(%edx)
  while(xchg(&lk->locked, 1) != 0)
 355:	85 c0                	test   %eax,%eax
 357:	75 f7                	jne    350 <lock+0x10>
    ;
}
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret    
 35b:	90                   	nop
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000360 <unlock>:
void unlock(struct spinlock * lk) {
 360:	55                   	push   %ebp
 361:	31 c0                	xor    %eax,%eax
 363:	89 e5                	mov    %esp,%ebp
 365:	8b 55 08             	mov    0x8(%ebp),%edx
 368:	f0 87 02             	lock xchg %eax,(%edx)
  xchg(&lk->locked, 0);
}
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    
 36d:	8d 76 00             	lea    0x0(%esi),%esi

00000370 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	8b 45 08             	mov    0x8(%ebp),%eax
 377:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 37a:	89 c2                	mov    %eax,%edx
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 380:	83 c1 01             	add    $0x1,%ecx
 383:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 387:	83 c2 01             	add    $0x1,%edx
 38a:	84 db                	test   %bl,%bl
 38c:	88 5a ff             	mov    %bl,-0x1(%edx)
 38f:	75 ef                	jne    380 <strcpy+0x10>
    ;
  return os;
}
 391:	5b                   	pop    %ebx
 392:	5d                   	pop    %ebp
 393:	c3                   	ret    
 394:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 39a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000003a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 55 08             	mov    0x8(%ebp),%edx
 3a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 3aa:	0f b6 02             	movzbl (%edx),%eax
 3ad:	0f b6 19             	movzbl (%ecx),%ebx
 3b0:	84 c0                	test   %al,%al
 3b2:	75 1c                	jne    3d0 <strcmp+0x30>
 3b4:	eb 2a                	jmp    3e0 <strcmp+0x40>
 3b6:	8d 76 00             	lea    0x0(%esi),%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 3c0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3c3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 3c6:	83 c1 01             	add    $0x1,%ecx
 3c9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 3cc:	84 c0                	test   %al,%al
 3ce:	74 10                	je     3e0 <strcmp+0x40>
 3d0:	38 d8                	cmp    %bl,%al
 3d2:	74 ec                	je     3c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 3d4:	29 d8                	sub    %ebx,%eax
}
 3d6:	5b                   	pop    %ebx
 3d7:	5d                   	pop    %ebp
 3d8:	c3                   	ret    
 3d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3e2:	29 d8                	sub    %ebx,%eax
}
 3e4:	5b                   	pop    %ebx
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret    
 3e7:	89 f6                	mov    %esi,%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <strlen>:

uint
strlen(const char *s)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3f6:	80 39 00             	cmpb   $0x0,(%ecx)
 3f9:	74 15                	je     410 <strlen+0x20>
 3fb:	31 d2                	xor    %edx,%edx
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
 400:	83 c2 01             	add    $0x1,%edx
 403:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 407:	89 d0                	mov    %edx,%eax
 409:	75 f5                	jne    400 <strlen+0x10>
    ;
  return n;
}
 40b:	5d                   	pop    %ebp
 40c:	c3                   	ret    
 40d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 410:	31 c0                	xor    %eax,%eax
}
 412:	5d                   	pop    %ebp
 413:	c3                   	ret    
 414:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 41a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000420 <memset>:

void*
memset(void *dst, int c, uint n)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 427:	8b 4d 10             	mov    0x10(%ebp),%ecx
 42a:	8b 45 0c             	mov    0xc(%ebp),%eax
 42d:	89 d7                	mov    %edx,%edi
 42f:	fc                   	cld    
 430:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 432:	89 d0                	mov    %edx,%eax
 434:	5f                   	pop    %edi
 435:	5d                   	pop    %ebp
 436:	c3                   	ret    
 437:	89 f6                	mov    %esi,%esi
 439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000440 <strchr>:

char*
strchr(const char *s, char c)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	53                   	push   %ebx
 444:	8b 45 08             	mov    0x8(%ebp),%eax
 447:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 44a:	0f b6 10             	movzbl (%eax),%edx
 44d:	84 d2                	test   %dl,%dl
 44f:	74 1d                	je     46e <strchr+0x2e>
    if(*s == c)
 451:	38 d3                	cmp    %dl,%bl
 453:	89 d9                	mov    %ebx,%ecx
 455:	75 0d                	jne    464 <strchr+0x24>
 457:	eb 17                	jmp    470 <strchr+0x30>
 459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 460:	38 ca                	cmp    %cl,%dl
 462:	74 0c                	je     470 <strchr+0x30>
  for(; *s; s++)
 464:	83 c0 01             	add    $0x1,%eax
 467:	0f b6 10             	movzbl (%eax),%edx
 46a:	84 d2                	test   %dl,%dl
 46c:	75 f2                	jne    460 <strchr+0x20>
      return (char*)s;
  return 0;
 46e:	31 c0                	xor    %eax,%eax
}
 470:	5b                   	pop    %ebx
 471:	5d                   	pop    %ebp
 472:	c3                   	ret    
 473:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000480 <gets>:

char*
gets(char *buf, int max)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 486:	31 f6                	xor    %esi,%esi
 488:	89 f3                	mov    %esi,%ebx
{
 48a:	83 ec 1c             	sub    $0x1c,%esp
 48d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 490:	eb 2f                	jmp    4c1 <gets+0x41>
 492:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 498:	8d 45 e7             	lea    -0x19(%ebp),%eax
 49b:	83 ec 04             	sub    $0x4,%esp
 49e:	6a 01                	push   $0x1
 4a0:	50                   	push   %eax
 4a1:	6a 00                	push   $0x0
 4a3:	e8 32 01 00 00       	call   5da <read>
    if(cc < 1)
 4a8:	83 c4 10             	add    $0x10,%esp
 4ab:	85 c0                	test   %eax,%eax
 4ad:	7e 1c                	jle    4cb <gets+0x4b>
      break;
    buf[i++] = c;
 4af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4b3:	83 c7 01             	add    $0x1,%edi
 4b6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 4b9:	3c 0a                	cmp    $0xa,%al
 4bb:	74 23                	je     4e0 <gets+0x60>
 4bd:	3c 0d                	cmp    $0xd,%al
 4bf:	74 1f                	je     4e0 <gets+0x60>
  for(i=0; i+1 < max; ){
 4c1:	83 c3 01             	add    $0x1,%ebx
 4c4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4c7:	89 fe                	mov    %edi,%esi
 4c9:	7c cd                	jl     498 <gets+0x18>
 4cb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 4cd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4d0:	c6 03 00             	movb   $0x0,(%ebx)
}
 4d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d6:	5b                   	pop    %ebx
 4d7:	5e                   	pop    %esi
 4d8:	5f                   	pop    %edi
 4d9:	5d                   	pop    %ebp
 4da:	c3                   	ret    
 4db:	90                   	nop
 4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4e0:	8b 75 08             	mov    0x8(%ebp),%esi
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
 4e6:	01 de                	add    %ebx,%esi
 4e8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4ea:	c6 03 00             	movb   $0x0,(%ebx)
}
 4ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4f0:	5b                   	pop    %ebx
 4f1:	5e                   	pop    %esi
 4f2:	5f                   	pop    %edi
 4f3:	5d                   	pop    %ebp
 4f4:	c3                   	ret    
 4f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000500 <stat>:

int
stat(const char *n, struct stat *st)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	56                   	push   %esi
 504:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 505:	83 ec 08             	sub    $0x8,%esp
 508:	6a 00                	push   $0x0
 50a:	ff 75 08             	pushl  0x8(%ebp)
 50d:	e8 f0 00 00 00       	call   602 <open>
  if(fd < 0)
 512:	83 c4 10             	add    $0x10,%esp
 515:	85 c0                	test   %eax,%eax
 517:	78 27                	js     540 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 519:	83 ec 08             	sub    $0x8,%esp
 51c:	ff 75 0c             	pushl  0xc(%ebp)
 51f:	89 c3                	mov    %eax,%ebx
 521:	50                   	push   %eax
 522:	e8 f3 00 00 00       	call   61a <fstat>
  close(fd);
 527:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 52a:	89 c6                	mov    %eax,%esi
  close(fd);
 52c:	e8 b9 00 00 00       	call   5ea <close>
  return r;
 531:	83 c4 10             	add    $0x10,%esp
}
 534:	8d 65 f8             	lea    -0x8(%ebp),%esp
 537:	89 f0                	mov    %esi,%eax
 539:	5b                   	pop    %ebx
 53a:	5e                   	pop    %esi
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    
 53d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 540:	be ff ff ff ff       	mov    $0xffffffff,%esi
 545:	eb ed                	jmp    534 <stat+0x34>
 547:	89 f6                	mov    %esi,%esi
 549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000550 <atoi>:

int
atoi(const char *s)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	53                   	push   %ebx
 554:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 557:	0f be 11             	movsbl (%ecx),%edx
 55a:	8d 42 d0             	lea    -0x30(%edx),%eax
 55d:	3c 09                	cmp    $0x9,%al
  n = 0;
 55f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 564:	77 1f                	ja     585 <atoi+0x35>
 566:	8d 76 00             	lea    0x0(%esi),%esi
 569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 570:	8d 04 80             	lea    (%eax,%eax,4),%eax
 573:	83 c1 01             	add    $0x1,%ecx
 576:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 57a:	0f be 11             	movsbl (%ecx),%edx
 57d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 580:	80 fb 09             	cmp    $0x9,%bl
 583:	76 eb                	jbe    570 <atoi+0x20>
  return n;
}
 585:	5b                   	pop    %ebx
 586:	5d                   	pop    %ebp
 587:	c3                   	ret    
 588:	90                   	nop
 589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000590 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	56                   	push   %esi
 594:	53                   	push   %ebx
 595:	8b 5d 10             	mov    0x10(%ebp),%ebx
 598:	8b 45 08             	mov    0x8(%ebp),%eax
 59b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 59e:	85 db                	test   %ebx,%ebx
 5a0:	7e 14                	jle    5b6 <memmove+0x26>
 5a2:	31 d2                	xor    %edx,%edx
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 5a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 5ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 5af:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 5b2:	39 d3                	cmp    %edx,%ebx
 5b4:	75 f2                	jne    5a8 <memmove+0x18>
  return vdst;
}
 5b6:	5b                   	pop    %ebx
 5b7:	5e                   	pop    %esi
 5b8:	5d                   	pop    %ebp
 5b9:	c3                   	ret    

000005ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5ba:	b8 01 00 00 00       	mov    $0x1,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <exit>:
SYSCALL(exit)
 5c2:	b8 02 00 00 00       	mov    $0x2,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <wait>:
SYSCALL(wait)
 5ca:	b8 03 00 00 00       	mov    $0x3,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <pipe>:
SYSCALL(pipe)
 5d2:	b8 04 00 00 00       	mov    $0x4,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <read>:
SYSCALL(read)
 5da:	b8 05 00 00 00       	mov    $0x5,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <write>:
SYSCALL(write)
 5e2:	b8 10 00 00 00       	mov    $0x10,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <close>:
SYSCALL(close)
 5ea:	b8 15 00 00 00       	mov    $0x15,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <kill>:
SYSCALL(kill)
 5f2:	b8 06 00 00 00       	mov    $0x6,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <exec>:
SYSCALL(exec)
 5fa:	b8 07 00 00 00       	mov    $0x7,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <open>:
SYSCALL(open)
 602:	b8 0f 00 00 00       	mov    $0xf,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <mknod>:
SYSCALL(mknod)
 60a:	b8 11 00 00 00       	mov    $0x11,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <unlink>:
SYSCALL(unlink)
 612:	b8 12 00 00 00       	mov    $0x12,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <fstat>:
SYSCALL(fstat)
 61a:	b8 08 00 00 00       	mov    $0x8,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <link>:
SYSCALL(link)
 622:	b8 13 00 00 00       	mov    $0x13,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <mkdir>:
SYSCALL(mkdir)
 62a:	b8 14 00 00 00       	mov    $0x14,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <chdir>:
SYSCALL(chdir)
 632:	b8 09 00 00 00       	mov    $0x9,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <dup>:
SYSCALL(dup)
 63a:	b8 0a 00 00 00       	mov    $0xa,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <getpid>:
SYSCALL(getpid)
 642:	b8 0b 00 00 00       	mov    $0xb,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <sbrk>:
SYSCALL(sbrk)
 64a:	b8 0c 00 00 00       	mov    $0xc,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <sleep>:
SYSCALL(sleep)
 652:	b8 0d 00 00 00       	mov    $0xd,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <uptime>:
SYSCALL(uptime)
 65a:	b8 0e 00 00 00       	mov    $0xe,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <cv_signal>:
SYSCALL(cv_signal)
 662:	b8 16 00 00 00       	mov    $0x16,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <cv_wait>:
 66a:	b8 17 00 00 00       	mov    $0x17,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    
 672:	66 90                	xchg   %ax,%ax
 674:	66 90                	xchg   %ax,%ax
 676:	66 90                	xchg   %ax,%ax
 678:	66 90                	xchg   %ax,%ax
 67a:	66 90                	xchg   %ax,%ax
 67c:	66 90                	xchg   %ax,%ax
 67e:	66 90                	xchg   %ax,%ax

00000680 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	53                   	push   %ebx
 686:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 689:	85 d2                	test   %edx,%edx
{
 68b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 68e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 690:	79 76                	jns    708 <printint+0x88>
 692:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 696:	74 70                	je     708 <printint+0x88>
    x = -xx;
 698:	f7 d8                	neg    %eax
    neg = 1;
 69a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6a1:	31 f6                	xor    %esi,%esi
 6a3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 6a6:	eb 0a                	jmp    6b2 <printint+0x32>
 6a8:	90                   	nop
 6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 6b0:	89 fe                	mov    %edi,%esi
 6b2:	31 d2                	xor    %edx,%edx
 6b4:	8d 7e 01             	lea    0x1(%esi),%edi
 6b7:	f7 f1                	div    %ecx
 6b9:	0f b6 92 b8 0a 00 00 	movzbl 0xab8(%edx),%edx
  }while((x /= base) != 0);
 6c0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 6c2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 6c5:	75 e9                	jne    6b0 <printint+0x30>
  if(neg)
 6c7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 6ca:	85 c0                	test   %eax,%eax
 6cc:	74 08                	je     6d6 <printint+0x56>
    buf[i++] = '-';
 6ce:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 6d3:	8d 7e 02             	lea    0x2(%esi),%edi
 6d6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 6da:	8b 7d c0             	mov    -0x40(%ebp),%edi
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
 6e0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 6e3:	83 ec 04             	sub    $0x4,%esp
 6e6:	83 ee 01             	sub    $0x1,%esi
 6e9:	6a 01                	push   $0x1
 6eb:	53                   	push   %ebx
 6ec:	57                   	push   %edi
 6ed:	88 45 d7             	mov    %al,-0x29(%ebp)
 6f0:	e8 ed fe ff ff       	call   5e2 <write>

  while(--i >= 0)
 6f5:	83 c4 10             	add    $0x10,%esp
 6f8:	39 de                	cmp    %ebx,%esi
 6fa:	75 e4                	jne    6e0 <printint+0x60>
    putc(fd, buf[i]);
}
 6fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ff:	5b                   	pop    %ebx
 700:	5e                   	pop    %esi
 701:	5f                   	pop    %edi
 702:	5d                   	pop    %ebp
 703:	c3                   	ret    
 704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 708:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 70f:	eb 90                	jmp    6a1 <printint+0x21>
 711:	eb 0d                	jmp    720 <printf>
 713:	90                   	nop
 714:	90                   	nop
 715:	90                   	nop
 716:	90                   	nop
 717:	90                   	nop
 718:	90                   	nop
 719:	90                   	nop
 71a:	90                   	nop
 71b:	90                   	nop
 71c:	90                   	nop
 71d:	90                   	nop
 71e:	90                   	nop
 71f:	90                   	nop

00000720 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	53                   	push   %ebx
 726:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 729:	8b 75 0c             	mov    0xc(%ebp),%esi
 72c:	0f b6 1e             	movzbl (%esi),%ebx
 72f:	84 db                	test   %bl,%bl
 731:	0f 84 b3 00 00 00    	je     7ea <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 737:	8d 45 10             	lea    0x10(%ebp),%eax
 73a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 73d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 73f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 742:	eb 2f                	jmp    773 <printf+0x53>
 744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 748:	83 f8 25             	cmp    $0x25,%eax
 74b:	0f 84 a7 00 00 00    	je     7f8 <printf+0xd8>
  write(fd, &c, 1);
 751:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 754:	83 ec 04             	sub    $0x4,%esp
 757:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 75a:	6a 01                	push   $0x1
 75c:	50                   	push   %eax
 75d:	ff 75 08             	pushl  0x8(%ebp)
 760:	e8 7d fe ff ff       	call   5e2 <write>
 765:	83 c4 10             	add    $0x10,%esp
 768:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 76b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 76f:	84 db                	test   %bl,%bl
 771:	74 77                	je     7ea <printf+0xca>
    if(state == 0){
 773:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 775:	0f be cb             	movsbl %bl,%ecx
 778:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 77b:	74 cb                	je     748 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 77d:	83 ff 25             	cmp    $0x25,%edi
 780:	75 e6                	jne    768 <printf+0x48>
      if(c == 'd'){
 782:	83 f8 64             	cmp    $0x64,%eax
 785:	0f 84 05 01 00 00    	je     890 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 78b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 791:	83 f9 70             	cmp    $0x70,%ecx
 794:	74 72                	je     808 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 796:	83 f8 73             	cmp    $0x73,%eax
 799:	0f 84 99 00 00 00    	je     838 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 79f:	83 f8 63             	cmp    $0x63,%eax
 7a2:	0f 84 08 01 00 00    	je     8b0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7a8:	83 f8 25             	cmp    $0x25,%eax
 7ab:	0f 84 ef 00 00 00    	je     8a0 <printf+0x180>
  write(fd, &c, 1);
 7b1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 7b4:	83 ec 04             	sub    $0x4,%esp
 7b7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 7bb:	6a 01                	push   $0x1
 7bd:	50                   	push   %eax
 7be:	ff 75 08             	pushl  0x8(%ebp)
 7c1:	e8 1c fe ff ff       	call   5e2 <write>
 7c6:	83 c4 0c             	add    $0xc,%esp
 7c9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 7cc:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 7cf:	6a 01                	push   $0x1
 7d1:	50                   	push   %eax
 7d2:	ff 75 08             	pushl  0x8(%ebp)
 7d5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7d8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 7da:	e8 03 fe ff ff       	call   5e2 <write>
  for(i = 0; fmt[i]; i++){
 7df:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 7e3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7e6:	84 db                	test   %bl,%bl
 7e8:	75 89                	jne    773 <printf+0x53>
    }
  }
}
 7ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7ed:	5b                   	pop    %ebx
 7ee:	5e                   	pop    %esi
 7ef:	5f                   	pop    %edi
 7f0:	5d                   	pop    %ebp
 7f1:	c3                   	ret    
 7f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 7f8:	bf 25 00 00 00       	mov    $0x25,%edi
 7fd:	e9 66 ff ff ff       	jmp    768 <printf+0x48>
 802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 808:	83 ec 0c             	sub    $0xc,%esp
 80b:	b9 10 00 00 00       	mov    $0x10,%ecx
 810:	6a 00                	push   $0x0
 812:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 815:	8b 45 08             	mov    0x8(%ebp),%eax
 818:	8b 17                	mov    (%edi),%edx
 81a:	e8 61 fe ff ff       	call   680 <printint>
        ap++;
 81f:	89 f8                	mov    %edi,%eax
 821:	83 c4 10             	add    $0x10,%esp
      state = 0;
 824:	31 ff                	xor    %edi,%edi
        ap++;
 826:	83 c0 04             	add    $0x4,%eax
 829:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 82c:	e9 37 ff ff ff       	jmp    768 <printf+0x48>
 831:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 838:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 83b:	8b 08                	mov    (%eax),%ecx
        ap++;
 83d:	83 c0 04             	add    $0x4,%eax
 840:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 843:	85 c9                	test   %ecx,%ecx
 845:	0f 84 8e 00 00 00    	je     8d9 <printf+0x1b9>
        while(*s != 0){
 84b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 84e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 850:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 852:	84 c0                	test   %al,%al
 854:	0f 84 0e ff ff ff    	je     768 <printf+0x48>
 85a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 85d:	89 de                	mov    %ebx,%esi
 85f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 862:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 865:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 868:	83 ec 04             	sub    $0x4,%esp
          s++;
 86b:	83 c6 01             	add    $0x1,%esi
 86e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 871:	6a 01                	push   $0x1
 873:	57                   	push   %edi
 874:	53                   	push   %ebx
 875:	e8 68 fd ff ff       	call   5e2 <write>
        while(*s != 0){
 87a:	0f b6 06             	movzbl (%esi),%eax
 87d:	83 c4 10             	add    $0x10,%esp
 880:	84 c0                	test   %al,%al
 882:	75 e4                	jne    868 <printf+0x148>
 884:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 887:	31 ff                	xor    %edi,%edi
 889:	e9 da fe ff ff       	jmp    768 <printf+0x48>
 88e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 890:	83 ec 0c             	sub    $0xc,%esp
 893:	b9 0a 00 00 00       	mov    $0xa,%ecx
 898:	6a 01                	push   $0x1
 89a:	e9 73 ff ff ff       	jmp    812 <printf+0xf2>
 89f:	90                   	nop
  write(fd, &c, 1);
 8a0:	83 ec 04             	sub    $0x4,%esp
 8a3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 8a6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 8a9:	6a 01                	push   $0x1
 8ab:	e9 21 ff ff ff       	jmp    7d1 <printf+0xb1>
        putc(fd, *ap);
 8b0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 8b3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 8b6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 8b8:	6a 01                	push   $0x1
        ap++;
 8ba:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 8bd:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 8c0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8c3:	50                   	push   %eax
 8c4:	ff 75 08             	pushl  0x8(%ebp)
 8c7:	e8 16 fd ff ff       	call   5e2 <write>
        ap++;
 8cc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 8cf:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8d2:	31 ff                	xor    %edi,%edi
 8d4:	e9 8f fe ff ff       	jmp    768 <printf+0x48>
          s = "(null)";
 8d9:	bb ae 0a 00 00       	mov    $0xaae,%ebx
        while(*s != 0){
 8de:	b8 28 00 00 00       	mov    $0x28,%eax
 8e3:	e9 72 ff ff ff       	jmp    85a <printf+0x13a>
 8e8:	66 90                	xchg   %ax,%ax
 8ea:	66 90                	xchg   %ax,%ax
 8ec:	66 90                	xchg   %ax,%ax
 8ee:	66 90                	xchg   %ax,%ax

000008f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8f1:	a1 c0 0e 00 00       	mov    0xec0,%eax
{
 8f6:	89 e5                	mov    %esp,%ebp
 8f8:	57                   	push   %edi
 8f9:	56                   	push   %esi
 8fa:	53                   	push   %ebx
 8fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 908:	39 c8                	cmp    %ecx,%eax
 90a:	8b 10                	mov    (%eax),%edx
 90c:	73 32                	jae    940 <free+0x50>
 90e:	39 d1                	cmp    %edx,%ecx
 910:	72 04                	jb     916 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 912:	39 d0                	cmp    %edx,%eax
 914:	72 32                	jb     948 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 916:	8b 73 fc             	mov    -0x4(%ebx),%esi
 919:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 91c:	39 fa                	cmp    %edi,%edx
 91e:	74 30                	je     950 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 920:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 923:	8b 50 04             	mov    0x4(%eax),%edx
 926:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 929:	39 f1                	cmp    %esi,%ecx
 92b:	74 3a                	je     967 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 92d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 92f:	a3 c0 0e 00 00       	mov    %eax,0xec0
}
 934:	5b                   	pop    %ebx
 935:	5e                   	pop    %esi
 936:	5f                   	pop    %edi
 937:	5d                   	pop    %ebp
 938:	c3                   	ret    
 939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 940:	39 d0                	cmp    %edx,%eax
 942:	72 04                	jb     948 <free+0x58>
 944:	39 d1                	cmp    %edx,%ecx
 946:	72 ce                	jb     916 <free+0x26>
{
 948:	89 d0                	mov    %edx,%eax
 94a:	eb bc                	jmp    908 <free+0x18>
 94c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 950:	03 72 04             	add    0x4(%edx),%esi
 953:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 956:	8b 10                	mov    (%eax),%edx
 958:	8b 12                	mov    (%edx),%edx
 95a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 95d:	8b 50 04             	mov    0x4(%eax),%edx
 960:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 963:	39 f1                	cmp    %esi,%ecx
 965:	75 c6                	jne    92d <free+0x3d>
    p->s.size += bp->s.size;
 967:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 96a:	a3 c0 0e 00 00       	mov    %eax,0xec0
    p->s.size += bp->s.size;
 96f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 972:	8b 53 f8             	mov    -0x8(%ebx),%edx
 975:	89 10                	mov    %edx,(%eax)
}
 977:	5b                   	pop    %ebx
 978:	5e                   	pop    %esi
 979:	5f                   	pop    %edi
 97a:	5d                   	pop    %ebp
 97b:	c3                   	ret    
 97c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000980 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 980:	55                   	push   %ebp
 981:	89 e5                	mov    %esp,%ebp
 983:	57                   	push   %edi
 984:	56                   	push   %esi
 985:	53                   	push   %ebx
 986:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 989:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 98c:	8b 15 c0 0e 00 00    	mov    0xec0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 992:	8d 78 07             	lea    0x7(%eax),%edi
 995:	c1 ef 03             	shr    $0x3,%edi
 998:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 99b:	85 d2                	test   %edx,%edx
 99d:	0f 84 9d 00 00 00    	je     a40 <malloc+0xc0>
 9a3:	8b 02                	mov    (%edx),%eax
 9a5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 9a8:	39 cf                	cmp    %ecx,%edi
 9aa:	76 6c                	jbe    a18 <malloc+0x98>
 9ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 9b2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 9b7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 9ba:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 9c1:	eb 0e                	jmp    9d1 <malloc+0x51>
 9c3:	90                   	nop
 9c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9ca:	8b 48 04             	mov    0x4(%eax),%ecx
 9cd:	39 f9                	cmp    %edi,%ecx
 9cf:	73 47                	jae    a18 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9d1:	39 05 c0 0e 00 00    	cmp    %eax,0xec0
 9d7:	89 c2                	mov    %eax,%edx
 9d9:	75 ed                	jne    9c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 9db:	83 ec 0c             	sub    $0xc,%esp
 9de:	56                   	push   %esi
 9df:	e8 66 fc ff ff       	call   64a <sbrk>
  if(p == (char*)-1)
 9e4:	83 c4 10             	add    $0x10,%esp
 9e7:	83 f8 ff             	cmp    $0xffffffff,%eax
 9ea:	74 1c                	je     a08 <malloc+0x88>
  hp->s.size = nu;
 9ec:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9ef:	83 ec 0c             	sub    $0xc,%esp
 9f2:	83 c0 08             	add    $0x8,%eax
 9f5:	50                   	push   %eax
 9f6:	e8 f5 fe ff ff       	call   8f0 <free>
  return freep;
 9fb:	8b 15 c0 0e 00 00    	mov    0xec0,%edx
      if((p = morecore(nunits)) == 0)
 a01:	83 c4 10             	add    $0x10,%esp
 a04:	85 d2                	test   %edx,%edx
 a06:	75 c0                	jne    9c8 <malloc+0x48>
        return 0;
  }
}
 a08:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a0b:	31 c0                	xor    %eax,%eax
}
 a0d:	5b                   	pop    %ebx
 a0e:	5e                   	pop    %esi
 a0f:	5f                   	pop    %edi
 a10:	5d                   	pop    %ebp
 a11:	c3                   	ret    
 a12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a18:	39 cf                	cmp    %ecx,%edi
 a1a:	74 54                	je     a70 <malloc+0xf0>
        p->s.size -= nunits;
 a1c:	29 f9                	sub    %edi,%ecx
 a1e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a21:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a24:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 a27:	89 15 c0 0e 00 00    	mov    %edx,0xec0
}
 a2d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a30:	83 c0 08             	add    $0x8,%eax
}
 a33:	5b                   	pop    %ebx
 a34:	5e                   	pop    %esi
 a35:	5f                   	pop    %edi
 a36:	5d                   	pop    %ebp
 a37:	c3                   	ret    
 a38:	90                   	nop
 a39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 a40:	c7 05 c0 0e 00 00 c4 	movl   $0xec4,0xec0
 a47:	0e 00 00 
 a4a:	c7 05 c4 0e 00 00 c4 	movl   $0xec4,0xec4
 a51:	0e 00 00 
    base.s.size = 0;
 a54:	b8 c4 0e 00 00       	mov    $0xec4,%eax
 a59:	c7 05 c8 0e 00 00 00 	movl   $0x0,0xec8
 a60:	00 00 00 
 a63:	e9 44 ff ff ff       	jmp    9ac <malloc+0x2c>
 a68:	90                   	nop
 a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 a70:	8b 08                	mov    (%eax),%ecx
 a72:	89 0a                	mov    %ecx,(%edx)
 a74:	eb b1                	jmp    a27 <malloc+0xa7>
