#test:  pointer size checking  

#purpose:  show waning if pointer size checks don't account for capabilities (build w/ -cheri-bounds=aggressive)


#to build w/analysis:
make analyze

#to run:
./build/ptrszchk

#expected result:

make analyze:
64 -mabi=purecap --analyze  src/main.c -o build/analyze
clang-14: warning: Using c64 in the arch string is deprecated. The CPU mode should be inferred from the ABI. [-Wdeprecated]
src/main.c:37:5: warning: This code may fail to consider the case of 128-bit pointers [cheri.PointerSizeAssumptions]
if (sizeof(i64) == sizeof(p)) {
    ^~~~~~~~~~~~~~~~~~~~~~~~
1 warning generated.

run:
ctest1: size of pointer checks incomplete
 ..returns sizeof(void*)= 0






