//cheri compiler errors/warnings
//alignment2 
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

/*
 alignment2
*/

typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);

/*******************************************/
void ** ctest1(void)
{
static double a[2048];
printf("ctest1: pointer-casts requires proper alignment  \n");
   void *p0 = (void*)&a[0];
  // Pointer p0 is aligned to a 8 byte boundary;
  // type 'void **' requires capability alignment (16 bytes)
  return (void**)p0;
}




/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
void ** v=ctest1();
uint64_t blah[128];
*(uint64_t**)v = blah;
printf(" .. ctest1, v=%p &blah = %p Passes ?? Expected to pass but might be issue in future\n",v, *(uint64_t**)v);
}
