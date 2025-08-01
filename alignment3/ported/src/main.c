//cheri compiler errors/warnings
//alignment3 
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

/*
 alignment3
*/

typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);
/*******************************************/
static char mystr[]="hello world";
static char ctest7_a[100] __attribute__((aligned(128))); // Aligned to 128 byte; 
void ctest1(intptr_t *pCap, size_t n) {
  // Warn: Destination memory object pointed by 'intptr_t * __capability'
  // pointer is supposed to contain capabilities that require 16-byte
  // capability alignment. Source address alignment is 1, which means that
  // copied object may have its capabilities tags stripped earlier
  // due to underaligned storage
  printf("ctest1: alignment cap memcpy? (%zu)\n", n);
  char *p = &mystr[0];
  memcpy(&ctest7_a[0],&p, n);
  memcpy(pCap, &ctest7_a[0], n);
  return;
}





/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
intptr_t cap;
ctest1(&cap, sizeof(cap));
printf(" .. cap  = %llx  val=%s\n",cap, (char*) cap);
}
