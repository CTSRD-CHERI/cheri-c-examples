#test:  subobjbds3  

#purpose:  show subobj bounds cheri failure (build w/ -cheri-bounds=aggressive)
           specifically, when the container_of paridigm is being used
           In this case fix is to add __subobject_use_container_bounds 
           attribute to the container structure

#inspired by: sys/compat/linuxkpi/common/src/linux_80211.h 
#container_of macro courtesy of google AI

#to build:
make 

#to run:
./build/subobjbds3

#expected result
./build/subobjbnds3 
 ss->value3 = 3 , parent->value1 = 1





