#test:  warn4 

#purpose:  show warning from compiler concerning using integer 0 as a NULL pointer 

#to build:
make 

#to run:
./build/warn4

warn4:  buf = 0x0
 rcexp =OS_ERR_OK= 0 ,  rcact= ctest((void*)UT0)= 0









