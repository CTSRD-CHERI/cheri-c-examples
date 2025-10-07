#test:  arduprob 

#purpose:  simplified version of arduplane parameter handling issue 

#to build:
make 
lang++ -g -march=morello+c64 -mabi=purecap -O0 -Wall -g  -lrt src/main.cpp -o build/arduprob
src/main.cpp:68:46: warning: binary expression on capability types 'intptr_t' (aka '__intcap') and '__intcap'; it is not clear which should be used as the source of provenance; currently provenance is inherited from the left-hand side [-Wcheri-provenance]
        intptr_t base_b =    (intptr_t) base +  ((intptr_t) *((intptr_t*) base_bptr ) -base);


#to run:
./build/arduprob

#expected result:
./build/arduprob

base=0xfffffff7ff30 [rwRW,0xfffffff7ff30-0xfffffff7ff60] base_a=0xfffffff7ff30 [rwRW,0xfffffff7ff30-0xfffffff7ff60] base_bptr=0xfffffff7ff40 [rwRW,0xfffffff7ff30-0xfffffff7ff60] base_b=0x40b2e010 [rwRW,0x40b2ff30-0x40b2ff60] (invalid)
param_a1 addr 0xfffffff7ff30 [rwRW,0xfffffff7ff30-0xfffffff7ff60], val 11
param_a2 addr 0xfffffff7ff31 [rwRW,0xfffffff7ff30-0xfffffff7ff60], val 22
param_class_b addr 0xfffffff7ff40 [rwRW,0xfffffff7ff30-0xfffffff7ff60], val =0x40b2e010 [rwRW,0x40b2e010-0x40b2e018]
In-address space security exception (core dumped)






