#test:  subobjrep  

#purpose:  show fix for issue with subobj cap reprentation    (compile with cheri-bounds=aggressive)

#fix by using _Aligns() to align subobject in structure as indicated by warning from make analyze

#to build:
make 

#to build analyze
make analyze

#to run:
./build/subobjrep

#expected result:

#make analyze:
<clean>

#run:
ctest1:  subobj representability
402915328 24 0x160000  0x180000  0x18180000



