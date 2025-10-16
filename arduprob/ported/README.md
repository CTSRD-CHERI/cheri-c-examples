#test:  arduprob 

#purpose:  simplified version of arduplane parameter handling issue 

#to build:
make 

#to run:
./build/arduprob

#expected result:
./build/arduprob

base=0xfffffff7ff30 [rwRW,0xfffffff7ff30-0xfffffff7ff60] base_a=0xfffffff7ff30 [rwRW,0xfffffff7ff30-0xfffffff7ff60] base_bptr=0xfffffff7ff40 [rwRW,0xfffffff7ff30-0xfffffff7ff60] base_b=0x40b2e010 [rwRW,0x40b2e010-0x40b2e018]
param_a1 addr 0xfffffff7ff30 [rwRW,0xfffffff7ff30-0xfffffff7ff60], val 11
param_a2 addr 0xfffffff7ff31 [rwRW,0xfffffff7ff30-0xfffffff7ff60], val 22
param_class_b addr 0xfffffff7ff40 [rwRW,0xfffffff7ff30-0xfffffff7ff60], val =0x40b2e010 [rwRW,0x40b2e010-0x40b2e018]
param_b1 addr 0x40b2e010 [rwRW,0x40b2e010-0x40b2e018], val =33







