#test:  subobjbds2_cpp  

#purpose:  show subobj bounds cheri failure (build w/ -cheri-bounds=aggressive).  C++ version


#to build:
make 

#to run:
./build/subobjbds2_cpp

#expected result
ctest1:  subobj bounds
In-address space security exception (core dumped)



