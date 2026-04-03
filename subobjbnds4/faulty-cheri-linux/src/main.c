//cheri compiler errors/warnings
//pthread0
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <pthread.h>
#include <assert.h>
/*
 subobjbndsxx 
*/

typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);

struct my_pkt{
	int flags;
	int len;
	char data[8];  //min pkt, may be bigger
};

#if 1
struct my_pkt * my_malloc_pkt(int sz)
{
   if(sz <=8) return NULL;
   struct my_pkt * p = (struct my_pkt *) malloc( sizeof(struct my_pkt) + sz-8);
   printf(" alloc'd my_pkt of length %d at %#p\n", sz, p);
   return p;
}
#else 
extern char * my_malloc(int sz);
#endif
/***********************************************/
char *ctest1(void)
{
  struct my_pkt * my = my_malloc_pkt(128);
  int i;
  my -> flags=0;
  my -> len = 128;
  for(i=0;i<128;i++) my->data[i] = i;
  return &my->data[0];
}



/*******************************************/
int main(int argc, char * argv[])
{
   char * p = ctest1();
   printf("data ptr = %#p [117]=%d \n", p, p[117]);
}
