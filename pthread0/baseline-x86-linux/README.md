#test:  pthread0  

#purpose:  show common cheri porting issue with pthread_mutex_t 


#to build:
make 

#to run:
./build/pthread0

#expected result:
... try 0..
 48 0x230d98
after pt_mutext_init 0
after pt_mutex_destroy 0

... try 1..
 48 0x230dc8
after pt_mutext_init 0
after pt_mutex_destroy 0

... try 2..
 48 0x230df8
after pt_mutext_init 0
after pt_mutex_destroy 0

... try 3..
 48 0x230e28
after pt_mutext_init 0
after pt_mutex_destroy 0



