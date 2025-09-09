#include <cstddef>
#include <stdint.h>
#include <stdio.h>

/* ARDUPLANE  issue */

#define AP_VAROFFSET(type, element) (((ptrdiff_t)(&((const type *)1)->element))-1)

class ClassB {
public:
	ClassB() {
	}
	int8_t param_b1 = 33;
};
static int param_b1_offset = AP_VAROFFSET(ClassB, param_b1);

class ClassA {
public:
	ClassA() {
		param_class_b = new ClassB();
	}
	int8_t param_a1 = 11;
	int8_t param_a2 = 22;
	ClassB *param_class_b;    /* points to another set of parameters */
};
static int param_a1_offset = AP_VAROFFSET(ClassA, param_a1);
static int param_a2_offset = AP_VAROFFSET(ClassA, param_a2);
static int param_class_b_offset = AP_VAROFFSET(ClassA,
		param_class_b);

int main() {
	ClassA class_a;

	int8_t *val;

	printf("a1=%#p\n", &class_a.param_a1);

        intptr_t base = (intptr_t) &class_a;
	printf("class_a addr %#p\n", (void *) base);
	val = (int8_t *)(base + param_a1_offset);
	printf("param_a1 addr %#p, val %d\n", val, *val);
	val = (int8_t *)(base + param_a2_offset);
	printf("param_a2 addr %#p, val %d\n", val, *val);
	val = (int8_t *)(base + param_class_b_offset);
	printf("param_class_b addr %#p, val %d\n", val, *val);

	void **p = (void **) ((intptr_t) &class_a
			+ param_class_b_offset);
	printf("p=%#p *p=%#p\n", p, *p);
	ptrdiff_t new_offset = (intptr_t)*p - (intptr_t)&class_a;
	intptr_t q = (intptr_t) &class_a + new_offset + param_b1_offset;
	printf("q=%#p\n", (void *) q);
	printf("val=%d\n", *((int8_t *)q));

	return 0;



}
