#test:  alignment3  

#purpose:  show alignment warning from clang analyze



#to build:
make 

#to run:
./build/alignment3

#expected result:
analyze build:  (make analyze)
clang-14: warning: Using c64 in the arch string is deprecated. The CPU mode should be inferred from the ABI. [-Wdeprecated]
src/main.c:28:3: warning: Destination memory object pointed by 'intptr_t * __capability' pointer is supposed to contain capabilities that require 16-byte capability alignment. Source address alignment is 1, which means that copied object may have its capabilities tags stripped earlier due to underaligned storage [optin.portability.PointerAlignment]
  memcpy(pCap, ctest7_a, n);
  ^~~~~~~~~~~~~~~~~~~~~~~~~
src/main.c:20:13: note: Original allocation of type 'char[100]' has an alignment requirement 1 byte
static char ctest7_a[100]; // Aligned to 1 byte maybe
            ^~~~~~~~
src/main.c:40:10: note: Capabilities stored in '__intcap'
intptr_t cap;


runtime:
test1: alignment cap memcpy? (16)
 .. segmentation fault




