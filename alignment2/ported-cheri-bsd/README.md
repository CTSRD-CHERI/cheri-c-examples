#test:  alignment2  

#purpose:  show alignment warning 



#to build:
make 

#to run:
./build/alignment2

#expected result:
analyze build:  (make analyze)
clang-14: warning: Using c64 in the arch string is deprecated. The CPU mode should be inferred from the ABI. [-Wdeprecated]

runtime:
ctest1: pointer-casts requires proper alignment  
 .. ctest1, &blah = 0xfffffff7fb30 Passes?? Expected to pass but might be issue in future



