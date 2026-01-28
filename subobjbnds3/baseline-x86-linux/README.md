#test:  subobjbds3  

#purpose:  show subobj bounds cheri failure (build w/ -cheri-bounds=aggressive)
           specifically, when the container_of paridigm is being used


#inspired by: sys/compat/linuxkpi/common/src/linux_80211.h 
#container_of macro courtesy of google AI

#to build:
make 

#to run:
./build/subobjbds3

#expected result
./build/subobjbds3
In-address space security exception (core dumped)





