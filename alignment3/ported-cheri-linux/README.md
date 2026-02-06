#test:  alignment3  

#purpose:  show fix for alignment warning from clang analyze



#to build:
make 

#to run:
./build/alignment3

#expected result:
analyze build:  (make analyze)
clang-14: warning: Using c64 in the arch string is deprecated. The CPU mode should be inferred from the ABI. [-Wdeprecated]


runtime:
test1: alignment cap memcpy? (16)
 .. cap  = 236e90  val=hello world




