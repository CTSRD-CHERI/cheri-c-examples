#test:  warn3 

#purpose:  show fix for warning from when compiler gets confused as to which is offset and which is base
#    in this case left hand side guess is correct so no crash

#to build:
make 

#to run:
./build/warn3

#expected result(build):
make
mkdir -p build
clang -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap  src/main.c -o build/warn3


#expected result:
./build/warn3
 warn3:  returning the addrtess of buf[offset] = 0x130e7a
b2= 0x130e7a,  mybuf=0x130e70 a








