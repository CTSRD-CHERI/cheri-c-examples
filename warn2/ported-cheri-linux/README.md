#test:  warn2 

#purpose: show how to remove warning in integer to ptr compare 
# (inspired by cheribsd: sys/dev/proto/proto_busdma.c) 
Note: this example is about build warning. Baseline example runs fine

#to build:
make 


#to run:
./build/warn2

#expected result:
./build/warn2
0x130e20 [rwRW,0x130e20-0x130e4c] 130e20
res = 1






