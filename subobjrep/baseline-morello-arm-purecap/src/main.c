//cheri compiler errors/warnings
//subobjrep  
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

/*
 subobject representation 
*/

typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);


/***********************************************/
#define RTE_LPM6_NAMESIZE  32
#define RTE_LPM6_TBL24_NUM_ENTRIES 16777216
struct rte_lpm6_tbl_entry
{
int a;
int b;
int c;
int d;
int e;
int f;
};
struct rte_lpm6 {
  char x[32];   // 32/32 bytes exposed (may expose capability!)
  char name[RTE_LPM6_NAMESIZE]; // 32/32 bytes exposed
  uint32_t max_rules;    // 32/32 bytes exposed
  uint32_t used_rules;   //  4/4 bytes exposed
  uint32_t number_tbl8s; //  4/4 bytes exposed
  // Warn: Field 'tbl24' of type 'struct rte_lpm6_tbl_entry[16777216]'
  // (size 67108864) requires 32768 byte alignment for precise bounds;
  // field offset is 128 (aligned to 128); Current bounds: 0-67141632
  struct rte_lpm6_tbl_entry tbl24[RTE_LPM6_TBL24_NUM_ENTRIES];
  int a;
  int b;
};
 
struct rte_lpm6 ctest1_X;

void ctest1( struct rte_lpm6 * r)
{
printf("ctest1:  subobj representability\n");
printf(" %ld %ld %p  %p  %p\n", sizeof(struct rte_lpm6 ), sizeof(struct rte_lpm6_tbl_entry ),
                 r, &r->tbl24[0],  &r->a);

}



/*******************************************/
int main(int argc, char * argv[])
{
long test_to_run=0x1;
ctest1(&ctest1_X);
}
