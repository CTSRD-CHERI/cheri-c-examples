#test:  pthread0  

#purpose:  show common cheri porting issue with pthread_mutex_t 


#to build:
make 

#to run:
./build/pthread0

#expected result:

.. try 0..
 64 0xffff873cc058 [rwRW,0xffff873cc050-0xffff873cc098]
Bus error (core dumped)
