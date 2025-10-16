#include <stdint.h>
#include <stdio.h>
#include <stddef.h>

//subobjbnds3

#define container_of(ptr, type, member) ({                      \
        const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
        (type *)( (char *)__mptr - offsetof(type,member) );})

struct my_struct2
{
   int value3;
   int value4;
};

struct my_struct {
    int value1;
    int value2;
    struct my_struct2 inner;
};

void process_inner(struct my_struct2 * ss) {

    // This macro trick casts the pointer back up to the parent struct.
    struct my_struct *parent = container_of(ss, struct my_struct, inner);
    // ... now the code can access parent->value1
    printf(" ss->value3 = %d , parent->value1 = %d\n",
              ss->value3, parent->value1);

}

int main(void)
{
    struct my_struct ms={1,2,{3,4}};
    process_inner(&ms.inner); 
}


