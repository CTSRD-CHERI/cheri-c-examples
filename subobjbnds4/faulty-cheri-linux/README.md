#test:  subobjbnds4

#purpose:  show common cheri porting issue with subobjbounds 


#to build:
make 

#to run:
./build/subobjbnds4

#expected result:
 alloc'd my_pkt of length 128 at 0xffffaef55050 [rwRW,0xffffaef55050-0xffffaef550d8]
Segmentation fault (core dumped)

