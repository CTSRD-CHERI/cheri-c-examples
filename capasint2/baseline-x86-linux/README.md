#test:  capasint2  

#purpose:  show cap to int and back causes loss of provenance  (build w/ -cheri-bounds=aggressive)


#to build:
make 

#to build w/ analysis:
make analyze

#to run:
./build/capasint2

#expected result:

#run
ctest1:  int ptr conversion (issue#487)
.. v=0xfffffff7ff54, &a=0xfffffff7ff54  a=10







