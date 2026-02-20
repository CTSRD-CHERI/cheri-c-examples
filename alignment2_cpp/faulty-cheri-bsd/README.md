#test:  alignment2_cpp  

purpose:  show alignment issue in cap copying via cast ,  cpp version



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
src/main.cpp:36:10: warning: Pointer value aligned to a 8 byte boundary cast to type 'void * __capability * __capability' with 16-byte capability alignment [optin.portability.PointerAlignment]
  return (void**)p0;
         ^~~~~~~~~~
src/main.cpp:22:8: note: Original allocation of type 'double[2048]' has an alignment requirement 8 bytes
double da[2048];
       ^~
1 warning generated.


runtime:
./build/alignment2_cpp 
ctest1: pointer-casts requires proper alignment a=0x40a9d000 [rwRW,0x40a9d000-0x40aa1008] .da=0x40a9d008 [rwRW,0x40a9d008-0x40aa1008] 
Bus error (core dumped)




