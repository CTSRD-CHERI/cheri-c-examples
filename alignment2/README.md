#test:  alignment2  

#purpose:  show alignment warning 



#to build:
make 

#to run:
./build/alignment2

#expected result:
analyze build:  (make analyze)
mkdir -p build
/usr/local64/llvm-morello-csa/bin/clang-14 -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap --analyze  src/main.c -o build/analyze
clang-14: warning: Using c64 in the arch string is deprecated. The CPU mode should be inferred from the ABI. [-Wdeprecated]
src/main.c:27:10: warning: Pointer value aligned to a 8 byte boundary cast to type 'void * __capability * __capability' with 16-byte capability alignment [optin.portability.PointerAlignment]
  return (void**)p0;
         ^~~~~~~~~~
src/main.c:22:15: note: Original allocation of type 'double[2048]' has an alignment requirement 8 bytes
static double a[2048];
              ^
src/main.c:41:1: warning: Address of stack memory associated with local variable 'blah' is still referred to by the static variable 'a' upon returning to the caller.  This will be a dangling reference [core.StackAddressEscape]


runtime:
ctest1: pointer-casts requires proper alignment  
 .. ctest1, &blah = 0xfffffff7fb30 Passes?? Expected to pass but might be issue in future



