#include <stdint.h>
#include <stdio.h>
#include <stddef.h>
//#include <cheri.h>
#include <cheriintrin.h>
//code_chksum
/*
 * CHERI CHANGES START
 * {
 *   "updated": 20250930,
 *   "target_type": "app",
 *   "changes": [
 *   "code checksum"
 *   ]
 * }
 * CHERI CHANGES END
 */

extern void _start(void);
extern void _fini(void);
uint64_t compute_sum(uint8_t * data,ptrdiff_t sz);

uint64_t compute_sum(uint8_t * data,ptrdiff_t sz) {
 uint64_t sum =0LL;
 printf("compute sum of %td bytes, starting at %#p\n", sz, data);
 for(int i=0;i<sz;i++)  sum+=data[i];
 return sum;
}

int main(void)
{   
    uint64_t sum=0LL;
    ///get program counter. This is not a sentry!
    uint8_t * mypc = (uint8_t *)__builtin_cheri_program_counter_get();
   // ptraddr_t fp2 = (ptraddr_t) _fini;  //offset to _dinit 
    ptraddr_t fp =  (ptraddr_t) _start;  //offset to _init 
    ptrdiff_t len = _fini - _start;
    printf("len=%tx s=%#p f=%#p \n", len, _start, _fini);
    //calculate distrance between current pcc and_start 
    ptraddr_t newdist = fp  - (ptraddr_t) mypc; 
    printf("mypc =%#p   newdist=%tx \n", mypc,newdist);
    //now we can pass &mypc[newdist] into compute_sum, this dataptr is not a sentry!
    sum = compute_sum (&mypc[newdist], len);
    printf("sum = %tx\n", sum);
}


