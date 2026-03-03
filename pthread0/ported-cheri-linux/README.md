#test:  pthread0  

#purpose:  show common cheri porting issue with pthread_mutex_t 


#to build:
make 

#to run:
./build/pthread0

#expected result:


... try 0..
 64 0xffff9f2ac050 [rwRW,0xffff9f2ac040-0xffff9f2ac090]
after pt_mutext_init 0
after pt_mutex_destroy 0

... try 1..
 64 0xffff9f2ac0b0 [rwRW,0xffff9f2ac0a0-0xffff9f2ac0f0]
after pt_mutext_init 0
after pt_mutex_destroy 0

... try 2..
 64 0xffff9f2ac110 [rwRW,0xffff9f2ac100-0xffff9f2ac150]
after pt_mutext_init 0
after pt_mutex_destroy 0

... try 3..
 64 0xffff9f2ac170 [rwRW,0xffff9f2ac160-0xffff9f2ac1b0]
after pt_mutext_init 0
after pt_mutex_destroy 0

