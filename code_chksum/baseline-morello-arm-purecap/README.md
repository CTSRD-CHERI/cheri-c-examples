#test:  code_chksum  

#purpose:  show  cheri failure (build w/o -cheri-bounds=aggressive) when trying to do checksum over text segment



#inspired by:  nasa cfs cheri port

#to build:
make 

#to run:
./build/code_chksum

#expected result
./build/code_chksum

len=420 s=0x11082d [rxR,0x100000-0x131040] (sentry) f=0x110c4d [rxR,0x100000-0x131040] (sentry) 
compute sum of 1056 bytes, starting at 0x11082d [rxR,0x100000-0x131040] (sentry)
In-address space security exception (core dumped)





