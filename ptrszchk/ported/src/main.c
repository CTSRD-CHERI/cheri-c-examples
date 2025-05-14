//cheri compiler errors/warnings
//ptr size checks 
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

/*
 ptr_size_checks 
*/
*
 * CHERI CHANGES START
 * {
 *   "updated": 20250422,
 *   "target_type": "app",
 *   "changes": [
 *     "pointer_size_check"
 *   ]
 * }
 * CHERI CHANGES END
 */


typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);

struct align_test1
{
 char blah;
 char * ptr1;
 uint64_t ptr2;
 uint64_t ptr3;
} ;

struct align_test1 a1;

/***********************************************/
void * ctest1(void)
{
uintptr_t i128;
long i64;
int i32;
void *p;
printf("ctest1: size of pointer checks incomplete\n");
// This code fails to consider the case of 128-bit pointers
if (sizeof(i64) == sizeof(p)) {
   return 8;
}
else if (sizeof(i32) == sizeof(p)) {
   return 4;
}
else if (sizeof(i128) ==sizeof(p)){
   return 16;
}
else {
  return 0; //error case
}
return 0;
}


/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
int ret = ctest1();
printf(" ..returns sizeof(void*)= %d\n",ret);

}
