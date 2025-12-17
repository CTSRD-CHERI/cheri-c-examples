#test:  capcopy  

#purpose:  show capcopy success

#fix: in copy loop, use uint8_t * insted of uint8_t as the unit to copy. This will
#     preseve the capability tags during the copy
#     ?? non cap fields are moved the same way.  Does this give them a tag?  

#to build:
make 

#to run:
./build/capcopy

#expected result:

ctest1: cap copy  
ctest1: ctest1






