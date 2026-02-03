#test:  code_chksum 

#purpose:  show how to use cheri intrinsics to work around issue of code pointers being sentries


#to build:
make 

#to run:
./build/code_chksum

#expected result
len=5034 s=0x211241 [rxRE,0x200240-0x227000] (sentry) f=0x216275 [rxRE,0x200240-0x227000] (sentry) 
mypc =0x2116cc [rxRE,0x200240-0x227000]   newdist=fffffffffffffb75 
compute sum of 20532 bytes, starting at 0x211241 [rxRE,0x200240-0x227000]
sum = 1f011e




