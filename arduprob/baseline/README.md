#test:  arduprob 

#purpose:  simplified version of arduplane parameter handling issue 

#to build:
make 

#to run:
./build/arduprob

#expected result:
./build/arduprob
a1=0xfffffff7ff40 [rwRW,0xfffffff7ff40-0xfffffff7ff60]
class_a addr 0xfffffff7ff40 [rwRW,0xfffffff7ff40-0xfffffff7ff60]
param_a1 addr 0xfffffff7ff40 [rwRW,0xfffffff7ff40-0xfffffff7ff60], val 11
param_a2 addr 0xfffffff7ff41 [rwRW,0xfffffff7ff40-0xfffffff7ff60], val 22
param_class_b addr 0xfffffff7ff50 [rwRW,0xfffffff7ff40-0xfffffff7ff60], val 16
p=0xfffffff7ff50 [rwRW,0xfffffff7ff40-0xfffffff7ff60] *p=0x40b2e010 [rwRW,0x40b2e010-0x40b2e011]
q=0x40b2e010 [rwRW,0x40b2ff40-0x40b2ff60] (invalid)
In-address space security exception (core dumped)






