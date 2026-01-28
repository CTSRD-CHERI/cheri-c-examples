//cheri compiler errors/warnings
// subojbds2i cpp version
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

/*
 subobject_bounds 2
*/

typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);


static char dblocka[100];
void ctest1(char (&d)[100])
{
 printf("ctest1:  subobj bounds\n");
 for (int i=0; i< sizeof(d); i+=sizeof(uint32_t))
 {
   //why they add (void*) here ? no warning . removing void* fixes issue also
   // this will crash here if subojbounds= aggressive unless (void*) is removed??
   uint32_t value = *((uint32_t*) (void *) &d[i]);
   printf("  ..  val %lu = %d \n", i/sizeof(uint32_t) , value);
 }
 return;
}




/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
ctest1(dblocka);
}
