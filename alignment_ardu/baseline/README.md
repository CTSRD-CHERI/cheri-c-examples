#test:  alignment_ardu  

#purpose:  show issue in packed structures that contain a capability . Inspired by ardupilot AP_Param.h



#to build:
make 
cc -g -Wcheri-provenance  -Wno-int-conversion  -march=morello+c64 -mabi=purecap  src/main.c -o build/alignment_ardu
src/main.c:19:15: warning: alignment (1) of 'struct param_save' is less than the required capability alignment (16) [-Wcheri-capability-misuse]
struct PACKED param_save
              ^
src/main.c:19:15: note: If you are certain that this is correct you can silence the warning by adding __attribute__((annotate("underaligned_capability")))
src/main.c:21:10: warning: Capability field at offset 0 in packed structure will trap if structure is used in an array [-Wcheri-capability-misuse]
  char * str;
         ^
src/main.c:19:15: note: Add __attribute__((aligned(16))) to ensure sufficient alignment
struct PACKED param_save
              ^
              __attribute__((aligned(16)))
src/main.c:31:14: warning: found underaligned load of capability type (aligned to 1 bytes instead of 16). Will use memcpy() instead of capability load to preserve tags if it is aligned correctly at runtime [-Wcheri-inefficient]
   return p->str; 
             ^
src/main.c:31:14: note: use __builtin_assume_aligned() or cast to (u)intptr_t* if you know that the pointer is actually aligned to capability size; this will allow the memcpy() or memmove() call to be inlined if the size is constant (otherwise a library call must be used to maintain tag bits). For more information see https://github.com/CTSRD-CHERI/llvm-project/wiki/Unaligned-capability-copies


#to run:
./build/alignment_ardu

#expected result:
./build/alignment_ardu 
In-address space security exception (core dumped)





