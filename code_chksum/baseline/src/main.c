#include <stdint.h>
#include <stdio.h>
#include <stddef.h>

extern void _start(void);
void last(void);  //no fini symbol with cherbsd for some reason?
uint64_t compute_sum(uint8_t * data,ptrdiff_t sz);


uint64_t compute_sum(uint8_t * data,ptrdiff_t sz) {
 uint64_t sum =0LL;
 printf("compute sum of %td bytes, starting at %#p\n", sz, data);
 for(int i=0;i<sz;i++)  sum+=data[i];
 return sum;
}

int main(void)
{   
    ptraddr_t fp2 = (ptraddr_t) last;  //ptr to fini
    ptraddr_t fp  = _start;  //ptr to start 
    ptrdiff_t len = fp2-fp;
    printf("len=%tx s=%#p f=%#p \n", len, _start, (void *)last);
    uint64_t sum = compute_sum((uint8_t *) _start, len);
    printf("sum = %tx\n", sum);
}

void last(void){}
