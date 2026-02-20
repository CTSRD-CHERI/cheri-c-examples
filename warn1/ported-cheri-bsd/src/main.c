/*warn1 */
// CHERI CHANGES START
// {
//   "updated": 20230509,
//   "target_type": "kernel",
//   "changes": [
//     "pointer_integer_warning"
//   ]
// }
// CHERI CHANGES END


#include <stdint.h>
#include <stdio.h>
void * f(void * arg)
{
   long count = *(int*) arg;

   printf("count = %ld\n",count);
   count +=1;
   return (void*) (intptr_t) count;
}



int main(void)
{
 int mycount = 100;
 void *res = f((void*)&mycount);
 printf("%d %d \n", mycount , (int) (intptr_t) res);

}
