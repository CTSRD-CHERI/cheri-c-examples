#test:  pthread0  

#purpose:  show common cheri porting issue with pthread_mutex_t 


#to build:
make 

#to run:
./build/pthread0

#expected result:

... try 0..
 16 0x40845010 [rwRW,0x40845010-0x40845020]
after pt_mutext_init 0
after pt_mutex_destroy 0

... try 1..
 16 0x40845030 [rwRW,0x40845030-0x40845040]
after pt_mutext_init 0
after pt_mutex_destroy 0

... try 2..
 16 0x40845050 [rwRW,0x40845050-0x40845060]
after pt_mutext_init 0
after pt_mutex_destroy 0

... try 3..
 16 0x40845070 [rwRW,0x40845070-0x40845080]





