//cheri compiler errors/warnings
//alignment1 
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

/*
 alignment
*/

typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);

/*******************************************/
#define N 100    //also get waringing w/ N=99 . Passes in both cases??
struct S { // aligned as (void*)  maybe
  int a[N];

  // offsetof(struct S, f) == 400  =>  field f is always 16-byte aligned
  char f[N]; /* Warn: Original allocation of type 'char [100]' which has an alignment requirement 1 bytes */

  void *p;
} s;

void * ctest1(void)
{
printf("ctest1: alignment?  Warning\n");
strcpy(s.f,"ctest 1");
/* Warn: Pointer value aligned to a 1 byte boundary cast to type 'uintptr_t * __capability' with required capability alignment 16 bytes*/
uintptr_t *t = (uintptr_t*)&s.f;
return (void *) t;
}



/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
char *p = (char *) ctest1();
printf("  ..ctest1: return str= %s.. passes?? - expected to pass but might be issue in future\n",p);
}
