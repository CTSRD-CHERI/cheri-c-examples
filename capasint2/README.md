#test:  capasint2  

#purpose:  show cap to int and back causes loss of provenance  (build w/ -cheri-bounds=aggressive)


#to build:
make 

#to build w/ analysis:
make analyze

#to run:
./build/capasint2

#expected result:

#analyze:  
clang-14: warning: Using c64 in the arch string is deprecated. The CPU mode should be inferred from the ABI. [-Wdeprecated]
src/main.c:24:9: warning: NULL-derived capability: loss of provenance [cheri.ProvenanceSource]
 return x;
        ^
1 warning generated.

#run
ctest1:  int ptr conversion (issue#487)
In-address space security exception (core dumped)







