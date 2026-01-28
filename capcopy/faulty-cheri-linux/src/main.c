//cheri compiler errors/warnings
//capcopy 
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

/*
 cap_copy 
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
printf("ctest1: cap copy  \n");
//cpy area
 static uint8_t cpy2[sizeof(struct align_test1)];
 uint8_t *src = (uint8_t *)&a1;
 a1.blah ='X';
 a1.ptr1 = "ctest1";
 for(int i=0;i<sizeof(struct align_test1);i++) cpy2[i] = *src++;
 return (void*) &cpy2[0];  //tag should be cleared!! Problem
}


/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
struct align_test1 * p = (struct align_test1 *) ctest1();
printf("ctest1: %s\n",p->ptr1);
}
