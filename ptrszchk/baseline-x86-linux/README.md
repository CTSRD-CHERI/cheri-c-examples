#test:  pointer size checking  

#purpose:  show fix for  waning if pointer size checks don't account for capabilities (build w/ -cheri-bounds=aggressive)


#to build :
make 

#to run:
./build/ptrszchk

#expected result:

run:
build/ptrszchk 
ctest1: size of pointer checks incomplete
 ..returns sizeof(void*)= 8







