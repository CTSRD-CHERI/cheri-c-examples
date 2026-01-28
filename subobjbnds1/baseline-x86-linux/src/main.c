//cheri compiler errors/warnings
// subojbds#1
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

/*
 subobject_bounds
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

struct align_test2
{
  struct align_test1 a;
  int count;
};


//parent struct
struct align_test2 a2 = {.count = 10};

//**************************************
void * ctest1( void)
{
printf("ctest1: subobject bounds:  \n"); 
struct align_test1 *  a12 = &a2.a;  //compiles, but depending on subobject_bounds compile option, will probably crash with tag error

return (int *) &a12[1] ;
}



/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
int * p =
   ctest1();
   printf(" .. ctest1, count = %d\n",*p);
}
