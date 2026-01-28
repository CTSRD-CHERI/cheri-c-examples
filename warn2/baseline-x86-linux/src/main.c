#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <stddef.h>

/* warn1 */

struct test
{
   int a[10];
   int b;
} t1 = { {0},99};


int compare_ptr( void*  p1, uint64_t p2)
{
   printf("%#p %lx\n",p1,p2);
   return  p1== p2;
}


int main(void)
{

  int res = compare_ptr(&t1, (uint64_t)  &t1.a[0]);
  printf("res = %d\n", res);
  //check subobjbnds printf("a[10]= %d\n", t1.a[10]);
}
