//cheri compiler errors/warnings
//readplus1
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <stddef.h>
/*
  readplus1 
*/

typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);


int a[]={1,2,3,4,5,6,7,8};

/***********************************************/
uint64_t   ctest1(int *p, int n)
{
   printf(" readplus1: adding up %d elements in array\n",n);
   uint64_t sum = 0LL;
   int i=0;
   int v = p[0];
    
   do {
      sum += (uint64_t)  v;
      i+=1;
      v = p[i];
   } while (i<n); 
   return sum ;
}

/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
uint64_t res = ctest1( a, sizeof(a)/sizeof(int));

printf(" .. readplus1, res = %lu\n",res);
}
