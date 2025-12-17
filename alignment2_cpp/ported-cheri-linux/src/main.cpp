//cheri compiler errors/warnings
//alignment2_cpp 
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>


/*
 alignment2_cpp
*/
/*
 * CHERI CHANGES START
 * {
 *   "updated": 20251020,
 *   "target_type": "app",
 *   "changes": [
 *     "alignment"
 *   ]
 * }
*/


typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

class my_double
{

public:
char pad;
alignas(16) double da[2048];
};


extern int printf(const char *, ...);

/*******************************************/
void ** ctest1(void)
{
my_double * a = new my_double();
printf("ctest1: pointer-casts requires proper alignment a=%#p .da=%#p \n",a, &a->da[0]);
   void *p0 = (void*)&a->da[0];
  // Pointer p0 might be aligned to a 8 byte boundary;
  // type 'void **' requires capability alignment (16 bytes)
  return (void**)p0;
}




/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
void ** v=ctest1();
uint64_t blah[128]={1LL,2LL};
*(uint64_t**)v = blah;
printf(" .. ctest1, v=%#p &blah = %#p \n",v, *(uint64_t**)v);
}
