#test:  warn2 

#purpose: show how to remove warning in integer to ptr compare 
# (inspired by cheribsd: sys/dev/proto/proto_busdma.c) 
Note: this example is about build warning. Baseline example runs fine

#to build:
make 
clang -g -Wcheri-provenance -cheri-bounds=aggressive -Wno-int-conversion  -march=morello+c64 -mabi=purecap  src/main.c -o build/warn2
src/main.c:19:14: warning: comparison between pointer and integer ('void *' and 'uint64_t' (aka 'unsigned long')) [-Wpointer-integer-compare]
   return  p1== p2;
           ~~^  ~~
1 warning generated.



#to run:
./build/warn2

#expected result:
./build/warn2
0x130e20 [rwRW,0x130e20-0x130e4c] 130e20
res = 1






