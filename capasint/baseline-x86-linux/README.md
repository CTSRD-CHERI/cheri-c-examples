#test:  capasint  

#purpose:  show improper storage of cap as int  (build w/ -cheri-bounds=aggressive)


#to build:
make 

#to run:
./build/capasint

#expected result:
ctest1: cap saved as uintptr_t:  
 .. capasint, array[0] = 99




