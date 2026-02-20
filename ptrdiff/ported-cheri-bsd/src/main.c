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

struct wrap_a
{
char a0[4];
char a[16];
} a_wrap= {
{"ABCD"},
{"0123456789abcdef"}
};

/***********************************************/
intptr_t  ctest1(void)
{
   printf(" ptrdiff: returning diff of a[] from &a0[0]= %ld\n", &a_wrap.a[0]-(char*)&a_wrap);
   return (intptr_t) (&a_wrap.a[0]-(char*)&a_wrap);
}

/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
intptr_t d = ctest1();

/* try to reconstruct ptr to a[] */
char * v = (char*)&a_wrap+ d;
char c = v[0];
printf(" .. ptrdiff, array[0] = %c\n",c);
}
