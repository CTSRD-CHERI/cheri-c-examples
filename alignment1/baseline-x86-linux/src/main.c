//cheri compiler errors/warnings
//alignment1 
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <stddef.h>

/*
 alignment
*/

typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);

/*******************************************/
#define N 99    //also get waringing w/ N=99 . Passes in both cases??
struct S { // aligned as (void*)  maybe
  double a[N];

  // offsetof(struct S, f) == ?  =>  but field f needs 16-byte aligned
  char f[N]; /* Warn: Original allocation of type 'char [100]' which has an alignment requirement 1 bytes */

  void *p;
} s;

void ** ctest1(void)
{
printf("ctest1: alignment?  offset to f in S is %lu &s=%p\n", offsetof(struct S,f),&s );
char *p = "ctest 1 string";
memcpy(&s.f[0],&p, 16);
/* Analyze:  Warn: Pointer value aligned to a 1 byte boundary cast to type 'uintptr_t * __capability' with required capability alignment 16 bytes*/
uintptr_t **t = (uintptr_t**)&s.f[0];
return (void **) t;
}



/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
char **p = (char **) ctest1();
printf("  ..ctest1: return str= %s.. passes.\n",*p);
}
