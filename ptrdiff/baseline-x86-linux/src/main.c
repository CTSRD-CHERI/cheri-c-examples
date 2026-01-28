//cheri compiler errors/warnings
//ptrdiff
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <stddef.h>
/*
  ptrdiff 
*/

typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);


char a0[]="ABCD";
char a[]="0123456789abcdef";

/***********************************************/
ptrdiff_t  ctest1(void)
{
   printf(" ptrdiff: returning diff of a[] from &a0[0]= %ld\n", &a[0]-&a0[0]);
   return (ptrdiff_t) (&a[0]-&a0[0]);
}

/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
ptrdiff_t d = ctest1();

/* try to reconstruct ptr to a[] */
char * v = (char*)&a0[0]+ d;
char c = v[0];
printf(" .. ptrdiff, array[0] = %c\n",c);
}
