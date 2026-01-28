#test:  ptrdiffa0

#purpose:  simpliied version of ardupilot AP_Param.cpp  compilation issue example in "C"

#to build:
make 

clang -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap  src/main.c -o build/ptrdiffa0
src/main.c:45:15: warning: cast from provenance-free integer type to pointer type will give pointer that can not be dereferenced [-Wcheri-capability-misuse]
   void **p = (void **) (base + *new_off);  


#to run:
./build/ptrdiffa0

#expected result:
./build/ptrdiffa0
In-address space security exception (core dumped)




