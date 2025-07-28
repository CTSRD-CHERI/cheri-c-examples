#test:  subobjrep  

#purpose:  show fix for issue with subobj cap reprentation    (compile with cheri-bounds=aggressive)


#to build:
make 

#to build analyze
make analyze

#to run:
./build/subobjrep

#expected result:

#make analyze:
src/main.c:41:3: warning: Field 'tbl24' of type 'struct rte_lpm6_tbl_entry[16777216]' (size 402653184) requires 131072 byte alignment for precise bounds; field offset is 76 (aligned to 4); Current bounds: 0-402784256 [cheri.SubObjectRepresentability]
  struct rte_lpm6_tbl_entry tbl24[RTE_LPM6_TBL24_NUM_ENTRIES];
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
src/main.c:33:3: note: 32/32 bytes exposed
  char x[32];   // 32/32 bytes exposed (may expose capability!)
  ^
src/main.c:34:3: note: 32/32 bytes exposed
  char name[RTE_LPM6_NAMESIZE]; // 32/32 bytes exposed
  ^
src/main.c:35:3: note: 4/4 bytes exposed
  uint32_t max_rules;    // 32/32 bytes exposed
  ^
src/main.c:36:3: note: 4/4 bytes exposed
  uint32_t used_rules;   //  4/4 bytes exposed
  ^
src/main.c:37:3: note: 4/4 bytes exposed
  uint32_t number_tbl8s; //  4/4 bytes exposed
  ^
src/main.c:42:3: note: 4/4 bytes exposed
  int a;
  ^
src/main.c:43:3: note: 4/4 bytes exposed
  int b;
  ^
src/main.c:52:22: note: Array to pointer decay
                 r, &r->tbl24[0],  &r->a);
                     ^
src/main.c:41:3: warning: Field 'tbl24' of type 'struct rte_lpm6_tbl_entry[16777216]' (size 402653184) requires 131072 byte alignment for precise bounds; field offset is 76 (aligned to 4); Current bounds: 0-402784256 [cheri.SubObjectRepresentability]
  struct rte_lpm6_tbl_entry tbl24[RTE_LPM6_TBL24_NUM_ENTRIES];
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
src/main.c:33:3: note: 32/32 bytes exposed
  char x[32];   // 32/32 bytes exposed (may expose capability!)
  ^
src/main.c:34:3: note: 32/32 bytes exposed
  char name[RTE_LPM6_NAMESIZE]; // 32/32 bytes exposed
  ^
src/main.c:35:3: note: 4/4 bytes exposed
  uint32_t max_rules;    // 32/32 bytes exposed
  ^
src/main.c:36:3: note: 4/4 bytes exposed
  uint32_t used_rules;   //  4/4 bytes exposed
  ^
src/main.c:37:3: note: 4/4 bytes exposed
  uint32_t number_tbl8s; //  4/4 bytes exposed
  ^
src/main.c:42:3: note: 4/4 bytes exposed
  int a;
  ^
src/main.c:43:3: note: 4/4 bytes exposed
  int b;
  ^
2 warnings generated.


#run:
ctest1:  subobj representability
 402653268 24 0x160000  0x16004c  0x1816004c


