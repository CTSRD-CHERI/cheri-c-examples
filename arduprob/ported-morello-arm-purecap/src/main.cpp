#include <cstddef>
#include <stdint.h>
#include <stdio.h>

/* ARDUPLANE  issue */

/*
 * CHERI CHANGES START
 * {
 *   "updated": 20251007,
 *   "target_type": "app",
 *   "changes": [
 *     "provenance"
 *   ]
 * }
 * CHERI CHANGES END
 */




#define AP_VAROFFSET(type, element) (((ptrdiff_t)(&((const type *)1)->element))-1)

#define PARAM_DIRECT 0
#define PARAM_INDIRECT 1

class ClassB {
public:
	ClassB() {
	}
	int8_t param_b1 = 33;
        int flag= PARAM_DIRECT;  
};

class ClassA {
public:
	ClassA() {
	}
	int8_t param_a1 = 11;
	int8_t param_a2 = 22;
        int flag = PARAM_DIRECT;
};

class ClassBptr
{

public:
	ClassBptr() {
		param_bptr = new ClassB();
	}
	ClassB *param_bptr;    /* points to another set of parameters */
        int flag = PARAM_INDIRECT;    /* indirect */
};


class Param
{
public:
      Param() {
     }     
     ClassA a;
     ClassBptr b;
};


static int class_a_offset = AP_VAROFFSET(Param, a);
static int class_bptr_offset = AP_VAROFFSET(Param, b);

static int param_b1_offset = AP_VAROFFSET(ClassB, param_b1);
static int param_a1_offset = AP_VAROFFSET(ClassA, param_a1);
static int param_a2_offset = AP_VAROFFSET(ClassA, param_a2);
static int param_class_b_offset = AP_VAROFFSET(ClassBptr, param_bptr);

int main() {
	Param class_p;

	int8_t *val;


        intptr_t base = (intptr_t) &class_p;
        intptr_t base_a = (intptr_t) base + class_a_offset;
        intptr_t base_bptr = (intptr_t) base + class_bptr_offset;
        intptr_t base_b = (intptr_t) *((intptr_t*) base_bptr );
        printf("base=%#p base_a=%#p base_bptr=%#p base_b=%#p\n", (void*) base, (void*) base_a, (void *)base_bptr, (void *)base_b);

	val = (int8_t *)(base_a + param_a1_offset);
	printf("param_a1 addr %#p, val %d\n", val, *val);
	val = (int8_t *)(base_a + param_a2_offset);
	printf("param_a2 addr %#p, val %d\n", val, *val);
	val = (int8_t*)(base_bptr + param_class_b_offset);
	printf("param_class_b addr %#p, val =%#p\n", val, (void*) *((ClassB **)val));
        val = (int8_t*) (base_b + param_b1_offset); 
	printf("param_b1 addr %#p, val =%d\n", val, *val);

#if 0
	void **p = (void **) ((intptr_t) &class_a
			+ param_class_b_offset);
	printf("p=%#p *p=%#p\n", p, *p);
	ptrdiff_t new_offset = (intptr_t)*p - (intptr_t)&class_a;
	printf("new_off (diff between ClassA and *ClassA.param_class_b)= %tx\n", new_offset);
	intptr_t q = (intptr_t) &class_a + new_offset + param_b1_offset;
	printf("classA[new_offset+param_b1 offset] aka  q=%#p\n", (void *) q);
	printf("parameter_b1 val at *q =%d\n", *((int8_t *)q));
#endif
	return 0;



}
