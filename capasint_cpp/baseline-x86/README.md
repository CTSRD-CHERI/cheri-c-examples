#test:  capasint  

#purpose:  show improper storage of cap as int  (build w/ -cheri-bounds=aggressive)


#to build:
make 

#to run:
./build/capasint

#expected result:
test1: cap saved as integer
In-address space security exception (core dumped)




