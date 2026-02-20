//cheri compiler errors/warnings
//ptrdiffa1
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <stddef.h>
/*
  ptrdiffa1
*/

/*
 * CHERI CHANGES START
 * {
 *   "updated": 20251007,
 *   "target_type": "app",
 *   "changes": [
 *     "integer_pointer"
 *   ]
 * }
 * CHERI CHANGES END
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

void get_base(void *in, intptr_t &out)
{
   struct temp *t = (struct temp *) in;
   out = (intptr_t)  t->ptr; 
   return;
}


/***********************************************/
void ctest1( void *b,  ptrdiff_t  &new_off)
{
   intptr_t base;
   get_base(b, base);
   void **p = (void **) (base + new_off);  
   new_off =  ((intptr_t)*p) - base;
   printf("p=%#p *p=%p s1=%p  base=%#p newoff=%tx\n ", p, *p, s1, (void*)base, new_off);
}

/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
ptrdiff_t no = 0LL;
ctest1( (void*)&t0, no);
printf("done\n");
}
