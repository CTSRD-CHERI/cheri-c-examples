//cheri compiler errors/warnings
//ptrdiff
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <stddef.h>
/*
  ptrdiffa0 
*/

typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);

char s1[]="1234";
struct temp
{
 void * ptr;
 int b;
} ;

struct temp1
{
 char * ptr;
};
struct temp1 t1 ={s1};
struct temp t0 = {&t1,1234};

ptrdiff_t get_base(void *in)
{
   struct temp *t = (struct temp *) in;
   return (ptrdiff_t)  t->ptr; 
}


/***********************************************/
void ctest1( void *b,  ptrdiff_t * new_off)
{
   ptrdiff_t base;
   base = get_base(b);
   void **p = (void **) (base + *new_off);  
   *new_off =  ((char*)*p) - base;
   printf("p=%p *p=%p s1=%p  base=%tx newoff=%tx\n ", p, *p, s1, base, *new_off);
}

/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
ptrdiff_t no = 0LL;
ctest1( (void*)&t0, &no);
printf("done\n");
}
