#test:  code_chksum  

#purpose:  show  cheri failure (build w/o -cheri-bounds=aggressive) when trying to do checksum over text segment



#inspired by:  nasa cfs cheri port

#to build:
make 

#to run:
./build/code_chksum

#expected result
./build/code_chksum


len=4ff4 s=0x211221 [rxRE,0x200240-0x226f40] (sentry) f=0x216215 [rxRE,0x200240-0x226f40] (sentry) 
compute sum of 20460 bytes at 9x216215




