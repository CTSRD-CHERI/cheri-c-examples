//cheri compiler errors/warnings
// overalloc
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

/*
 over_alloc
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
struct ct9_S1
{
 int a[10];
};
struct ct9_S2
{
 int a[10];
}; //make the same as _S1 for convenience, but issue doesn't requir 

struct ct9_S2 * ctest1(int n1, int n2) {
  struct ct9_S1 *p1 = malloc(sizeof(struct ct9_S1)*n1 + sizeof(struct ct9_S2)*n2);
  p1[0].a[0] = 99;
  struct ct9_S2 *p2 = (struct ct9_S2 *)(p1+n1);
  printf("ctest1:  over alloc %p %p %d %d p1[0].a[0]=%d \n",p1, p2, n1, n2, p1[0].a[0]);
  // Warn: Pointer to suballocation returned from function
  // (consider narrowing the bounds for suballocation)
  return p2;  //bleed pointer to extra area. might be valid cap
}

/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
struct ct9_S2 *p =  ctest1(10, 2) ;

int * bogus = (int *) &p[-10];

  printf("  .. ctest1 _s1->a[0]= %d (%p)\n", *bogus, bogus);

}
