#test:  subobjbnds4  

#purpose:  show common cheri porting issue with subobjbnds when -cheri-bounds=agressive


#to build:
make 

#to run:
./build/subjbnds4

#expected result
alloc'd my_pkt of length 128 at 0xffffb04f8050 [rwRW,0xffffb04f8050-0xffffb04f80d8]
data ptr = 0xffffb04f8058 [rwRW,0xffffb04f8058-0xffffb04f80d8] [117]=117 

