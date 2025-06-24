//cheri compiler errors/warnings
//ptr size checks 
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <assert.h>

/*
 ptr_size_checks 
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
int ctest1(void)
{
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
assert(ret !=0);

}
