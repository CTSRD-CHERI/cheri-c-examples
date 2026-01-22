#test:  ptrbitflags  

#purpose:  show issue if low bits of ptrs are used as flags (build w/ -cheri-bounds=aggressive)


#to build:
make 

#to run:
./build/ptrbitflags

#expected result:
test1: use 0 bits of pointer for some kind of flag, use uint64_t to cast
In-address space security exception (core dumped)





