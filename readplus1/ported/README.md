#test:  readplus1 

#purpose: show how  "do  ... while " loop can cause fault in cheri although 
# there really isn't a problem
# (inspired by cheribsd: contrib/jemalloc/include/jemalloc/internal/bitmap.h)

#to build:
make 

#to run:
./build/readplus1

#expected result:
./build/readplus1

readplus1: adding up 8 elements in array
 .. readplus1, res = 36





