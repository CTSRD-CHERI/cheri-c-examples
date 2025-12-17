#test:  capasint

#purpose:  show capasint success

#fix: in structure, use uintptr_t instead of uint64_t. This will
#     preseve the capability tag of the pointer
#     remember to cast to uintptr_t instead of uint64_t 

#to build:
make 

#to run:
./build/capasint

#expected result:
ctest1: cap saved as uintptr_t:  
 .. capasint, array[0] = 99







