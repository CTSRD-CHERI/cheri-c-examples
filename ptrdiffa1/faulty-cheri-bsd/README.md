#test:  ptrdiffa1

#purpose:  simpliied version of ardupilot AP_Param.cpp  compilation issue example in "C++"

#to build:
make 


#to run:
./build/ptrdiffa1
clang++ -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap  src/main.cpp -o build/ptrdiffa1
src/main.cpp:46:15: warning: cast from provenance-free integer type to pointer type will give pointer that can not be dereferenced [-Wcheri-capability-misuse]
   void **p = (void **) (base + new_off);  


#expected result:
./build/ptrdiffa1
In-address space security exception (core dumped)




