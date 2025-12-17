//cheri compiler errors/warnings
//alignment_ardu
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

/*
 alignment_ardu
*/

typedef unsigned char uint8_t;
#define PACKED 

extern int printf(const char *, ...);
/*******************************************/
struct PACKED param_save
{
  char * str;
  uint8_t  force_saved;
};

char teststr[]="hi there";

struct param_save ps = {teststr, 1};

char *ctest1(struct param_save *p)
{
   return p->str; 
}


/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
char * s = ctest1(&ps);
printf("result of [not packed] structure read = %s\n",s);
}
