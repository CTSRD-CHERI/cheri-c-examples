//cheri compiler errors/warnings
//ptrbitflags 
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

/*
 ptr_bit_flags 
*/

/*
* CHERI CHANGES START
* {
*   "updated": 20250424,
*   "target_type": "app",
*   "changes": [
*     "pointer_as_integer"
*   ]
* }
* CHERI CHANGES END
*/



typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);


/***********************************************/
// e.g. see src/util/rb_tree.c , mesa-dri package
double ct10_a[100];
double * ctest1(int i)
{
 printf("ctest1: use 0 bits of pointer for some kind of flag, use uintptr_t instead of uint64_t to cast\n");
 double * blah = &ct10_a[i];
 *blah = 10.0;
 // replace uint64_t w/ uintptr_t to remove  tag error later
 blah= (double*) ((uintptr_t)blah | 0x1);  //eg. set valid flag
 return blah;
}


/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
//need the uintptr_t cast here.  Trying (double *) 0x1  doesn't compile
  double *p =  ctest1(1) ;
  if (((uint64_t)p)&0x1)
  {
     p = (double *)((uintptr_t)p & ~0x1);  //clear 'flag'
     printf(" .. val = %lf\n",*p);
  }

}
