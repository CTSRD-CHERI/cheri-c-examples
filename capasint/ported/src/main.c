//cheri compiler errors/warnings
//capasint
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

/*
 cap_as_int 
*/
/*
 * CHERI CHANGES START
 * {
 *   "updated": ,
 *   "target_type": ,
 *   "changes": [
 *     "pointer_as_integer"
 *   ],
 *   "change_comment": "change uint64_t to uintptr_t"
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
 uintptr_t ptr2;
 uint64_t ptr3;
} ;

struct align_test1 a1;

/***********************************************/
void * ctest1(void)
{
static uint64_t array0[10];
printf("ctest1: cap saved as uintptr_t:  \n");
array0[0]=99;
a1.ptr1 = "hi there";
a1.ptr2 = (uintptr_t ) &array0[0];  //compiles. tag preserved
return (void *) a1.ptr2;
}



/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
uint64_t * p =
(uint64_t *) ctest1();
printf(" .. capasint, array[0] = %ld\n",*p);
}
