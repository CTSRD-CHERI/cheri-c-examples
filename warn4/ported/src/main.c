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
  warn4  - inspired by cfs test framework
*/
/*
 * CHERI CHANGES START
 * {
 *   "updated": ,
 *   "target_type": ,
 *   "changes": [
 *     "(NULL) pointer size"
 *   ],
 *   "change_comment": "cast to (void *)"
 * }
 * CHERI CHANGES END
 */


extern int printf(const char *, ...);
#define OSAL_INDEX(X) (uint32_t)(X)
#define UT0 OSAL_INDEX(0) 
#define OS_ERR_OK 0
#define OS_MACRO_TEST_FUNC_RC(func, args, exp) \
{ \
	int32_t rcexp=exp; \
	int32_t rcact= func args; \
	printf(" rcexp =%s= %d ,  rcact= %s%s= %d\n",#exp, rcexp, #func,#args,rcact); \
	assert(rcact == rcexp); \
}



int32_t ctest(  const char* buf)
{
    printf(" warn4:  buf = %#p\n", buf); 
    return OS_ERR_OK;
}
  

int main(void)
{
	OS_MACRO_TEST_FUNC_RC( ctest, ((void*)UT0),  OS_ERR_OK)
}



