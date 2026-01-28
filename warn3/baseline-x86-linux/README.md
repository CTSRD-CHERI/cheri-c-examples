#test:  warn3 

#purpose:  show warning from compiler gets confused as to which is offset and which is base
#    in this case left hand side guess is correct so no crash

#to build:
make 

#to run:
./build/warn3

#expected result(build):
mkdir -p build
clang -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap  src/main.c -o build/warn3
src/main.c:28:81: warning: binary expression on capability types 'uintptr_t' (aka 'unsigned __intcap') and 'uintptr_t'; it is not clear which should be used as the source of provenance; currently provenance is inherited from the left-hand side [-Wcheri-provenance]
    printf(" warn3:  returning the addrtess of buf[offset] = %p\n", (void*) (buf+off)); 
                                                                             ~~~^~~~
src/main.c:29:35: warning: binary expression on capability types 'uintptr_t' (aka 'unsigned __intcap') and 'uintptr_t'; it is not clear which should be used as the source of provenance; currently provenance is inherited from the left-hand side [-Wcheri-provenance]
    return (const void *)(    buf + off);
                              ~~~ ^ ~~~

#expected result:
./build/warn3
 warn3:  returning the addrtess of buf[offset] = 0x130e7a
b2= 0x130e7a,  mybuf=0x130e70 a








