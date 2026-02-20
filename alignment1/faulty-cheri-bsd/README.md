#test:  alignment1  

#purpose:  show alignment warning 


#to build:
make 

#to run:
./build/alignment1

#expected result:
analyze build:
purecap --analyze  src/main.c -o build/analyze
clang-14: warning: Using c64 in the arch string is deprecated. The CPU mode should be inferred from the ABI. [-Wdeprecated]
src/main.c:35:16: warning: Pointer value aligned to a 1 byte boundary cast to type 'uintptr_t * __capability' with 16-byte capability alignment [optin.portability.PointerAlignment]
uintptr_t *t = (uintptr_t*)&s.f;
               ^~~~~~~~~~~~~~~~
src/main.c:25:8: note: Original allocation of type 'char[100]' has an alignment requirement 1 byte (fragile alignment 16 bytes)
  char f[N]; /* Warn: Original allocation of type 'char [100]' which has an alignment requirement 1 bytes */

runtime:
ctest1: alignment?  offset to f in S is 792 &s=0x2370a0
Bus error




