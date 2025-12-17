#test:  ptrbitflags  

#purpose:  show fix for issue if low bits of ptrs are used as flags (build w/ -cheri-bounds=aggressive)


#to build:
make 

#to run:
./build/ptrbitflags

#expected result:
ctest1: use 0 bits of pointer for some kind of flag, use uintptr_t instead of uint64_t to cast
 .. val = 10.000000






