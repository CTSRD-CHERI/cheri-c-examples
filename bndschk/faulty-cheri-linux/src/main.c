//cheri compiler errors/warnings
//bndschk.c
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <stddef.h>
/*
  bndschk 
*/

typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);



/***********************************************/
int ctest1(char *p, int len)
{
    printf("about to do memset of %p with len %d\n",p,len);
    memset(p,0,len);
    return 1;
}

/*******************************************/
int main(int argc, char * argv[])
{
char tst[]="12345";

int res  = ctest1(tst, 10 );
printf(".. after call to ctest1, res = %d\n",res);
}
