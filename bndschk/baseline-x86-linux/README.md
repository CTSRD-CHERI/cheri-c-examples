#test:  bndschk 

#purpose:  show how cheri intrinsics can  protect a library function from bogus buffer/length input

#to build:
make 

#to run:
./build/bndschk

#expected result:
./build/bndschk
about to do memset of 0xfffffff7ff68 with len 10
.. after call to ctest1, res = 1





