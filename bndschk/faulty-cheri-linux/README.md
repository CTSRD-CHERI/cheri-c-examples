#test:  bndschk 

#purpose:  show how cheri protects a library function from bogus buffer/length input

#to build:
make 

#to run:
./build/bndschk

#expected result:
./build/bndschk
about to do memset of 0xfffffff7ff58 with len 10
In-address space security exception (core dumped)






