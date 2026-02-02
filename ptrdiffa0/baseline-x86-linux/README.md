#test:  ptrdiff 

#purpose:  show how to use a wrapping structure so that having the  difference of two separate arrays a and b allows
 the reverse to work with cheri

#to build:
make 

#to run:
./build/ptrdiffa0

#expected result:
./build/ptrdiffa0

p=0x130f60 *p=0x130f50 s1=0x130f50  base=0x130f60 newoff=fffffffffffffff8
 done







