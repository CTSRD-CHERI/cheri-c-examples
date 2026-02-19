//cheri compiler errors/warnings
//capasint2
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

/*
 capasint2 
*/

typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);


/***********************************************/
void * ctest1(long long x)
{
 printf("ctest1:  int ptr conversion (issue#487)\n");
 return x;
}



/*******************************************/
int main(int argc, char * argv[])
{
   long test_to_run=0x1;
   int a = 10;
   void *v =ctest1((long long) &a);
   printf(" .. v=%p, &a=%p  a=%d\n", v, &a, *(int *)v);
}
