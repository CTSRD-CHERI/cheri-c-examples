//cheri compiler errors/warnings
//pthread0
//#include <cheri.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>
#include <pthread.h>
/*
 pthread0 
*/

/*
 * CHERI CHANGES START
 * {
 *   "updated": ,
 *   "target_type": ,
 *   "changes": [
 *     "alignment"
 *   ],
 *   "change_comment": "fixed misalignment w. cheri"
 * }
 * CHERI CHANGES END
 */


typedef unsigned long uint64_t;
typedef unsigned char uint8_t;

extern int printf(const char *, ...);

#if 1
//char mem[0x1000];
int w=0;
char * my_malloc(int sz)
{
   //char *m = &mem[w];	
   void ** p = (void **) malloc(sz+sizeof(void*));
   *((uint64_t*) &p[0]) = sz;
   return (char*) &p[1]; 
   //w= w+sz;
   //return m;
}
#else 
extern char * my_malloc(int sz);
#endif
/***********************************************/
pthread_mutex_t * ctest1(void)
{

pthread_mutex_t * pmutex = (pthread_mutex_t *)my_malloc(sizeof (*pmutex)) ; 
return pmutex ;
}



/*******************************************/
int main(int argc, char * argv[])
{
	int i;
for (i=0;i<4;i++)
{
	printf("\n... try %d..\n", i);
	pthread_mutex_t *pm = ctest1();
        printf(" %ld %#p\n",sizeof(*pm), pm);
	int res=pthread_mutex_init(pm,0);
	printf("after pt_mutext_init %d\n",res);
	res = pthread_mutex_destroy(pm);
	printf("after pt_mutex_destroy %d\n",res);
}
}
