//cheri compiler errors/warnings
//ptrdiff2
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <stddef.h>
/*
  ptrdiff2 
*/

typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);


char a[]="0123456789abcdef";

/***********************************************/
ptrdiff_t  ctest1(int n)
{
   printf(" ptrdiff2: returning  &a[%d] = %p\n", n, &a[n]);
   return (ptrdiff_t) &a[n];
}

/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
ptrdiff_t d = ctest1(8);
char * v = (char*) d ;
char c = v[0];
printf(" .. ptrdiff2, array[0] = %c\n",c);
}
