//cheri compiler errors/warnings
//ptrdiff3
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <stddef.h>
/*
  ptrdiff3 
*/

typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);


#include <stdlib.h>
#include <stddef.h>
#include <cheri.h>
#include <stdio.h>
#include <stdint.h>

const void *ctest(uintptr_t buf, ptrdiff_t off)
{
    printf(" ptrdiff3:  returning the addrtess of buf[offset] = %p\n", (void*) (off+buf)); 
    return (const void *)(    off + buf );
}
  

char mybuf[100]="1234567890abcdefg";
int main(void)
{
  const void * b2 = ctest( (uintptr_t) mybuf, 10);
  printf("b2= %p,  mybuf=%p %c\n", b2, mybuf, *((char*)b2));
}



