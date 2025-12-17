#test:  alignment2_cpp  

purpose:  show fix for alignment issue in cap copying via cast ,  cpp version. 



#to build:
make 


#to run:
./build/alignment2_cpp

#expected result:
normal build:  (make)
mkdir -p build
clang++ -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap  src/main.cpp -o build/alignment2_cpp


Analyze build:  (make analyze)
make analyze
mkdir -p build
/usr/local64/llvm-morello-csa/bin/clang-14 -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap --analyze  src/main.cpp -o build/analyze
clang-14: warning: Using c64 in the arch string is deprecated. The CPU mode should be inferred from the ABI. [-Wdeprecated]


runtime:
./build/alignment2_cpp 
ctest1: pointer-casts requires proper alignment a=0x40a9d000 [rwRW,0x40a9d000-0x40aa1010] .da=0x40a9d010 [rwRW,0x40a9d010-0x40aa1010] 
 .. ctest1, v=0x40a9d010 [rwRW,0x40a9d010-0x40aa1010] &blah = 0xfffffff7fb30 [rwRW,0xfffffff7fb30-0xfffffff7ff30]



