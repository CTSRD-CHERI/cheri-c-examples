//cheri compiler errors/warnings
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <stddef.h>
#include "assert.h"

/*
  warn5  - inspired by cfs test framework; buffer alignment
*/

extern int printf(const char *, ...);


uint8_t * test(  uint8_t* buf, int size)
{
    uint8_t *bufa;
    bufa = ((intptr_t) buf + size -1)  & ~( (intptr_t) size -1);
    printf(" warn5:  align buf %#p to sz %d \n", buf,size); 
    return bufa ;
}
  

int main(void)
{
	uint8_t buffer_in[128];
	//align to 16
	uint8_t *buf_aligned= test(buffer_in,16);
	printf("done %#p %#p\n", buffer_in, buf_aligned);
}



