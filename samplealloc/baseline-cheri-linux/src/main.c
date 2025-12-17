#include <stdio.h>
#include <string.h>
#include "assert.h"

/*
 sample_alloc
*/

/* simple allocator */
struct cell_tag;
typedef struct cell_tag
{
  struct cell_tag * next;
  void * data;
} CELL_T;

CELL_T * head;
CELL_T * tail;
static char * store[4096*128];

void cell_init(int n)
{
  if (n<1) n=1;
  head = (CELL_T *)  &store[0];
  memset((char*)head, 0, sizeof(CELL_T)*n);
  //carve it up;

  int i;
  tail = head;
  for(i=1;i<n;i++) {
    tail->next = &head[i];
    if (i==1) head->next = tail->next;
    tail= tail->next;
  }
  tail->next = (CELL_T*) 0;
}

CELL_T * cell_get(void)
{
   CELL_T *item = head;
   if (head)
     head=head->next;
   else
     tail=head;
   return item;
}

void cell_put(CELL_T * item)
{
  item->next = (CELL_T*) 0;
  if (tail)
  {
    tail->next = item;
    tail = item;
 }
 else
 {
    tail=head = item;
 }
}

int main(void)
{
  printf("sample allocator\n");
  cell_init(128);
  CELL_T * v[128];
  for(int i=0; i<128;i++) v[i] = cell_get();
  CELL_T * blah = cell_get();
  assert(blah== (CELL_T *) 0) ;

  CELL_T * blah2 =  &v[0][1];
  blah2-> data = (void*) 0x1234;
  printf("%p %p %lx\n",v[0], blah2, (long int) blah2->data );
  for(int i=0; i<128;i++) cell_put(v[i]);
}
