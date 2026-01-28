#test:  warn5 

#purpose:  show warning from compiler gets confused as to which side
 of alignment expression is base capability and 
 which is alignment factor 

#to build:
make 
src/main.c:21:10: warning: incompatible integer to pointer conversion assigning to 'uint8_t *' (aka 'unsigned char *') from '__intcap' [-Wint-conversion]
    bufa = ((intptr_t) buf + size -1)  & ~( (intptr_t) size -1);
         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
src/main.c:21:40: warning: binary expression on capability types '__intcap' and '__intcap'; it is not clear which should be used as the source of provenance; currently provenance is inherited from the left-hand side [-Wcheri-provenance]
    bufa = ((intptr_t) buf + size -1)  & ~( (intptr_t) size -1);










