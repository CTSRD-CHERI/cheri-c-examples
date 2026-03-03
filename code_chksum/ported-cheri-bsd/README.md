#test:  code_chksum 

#purpose:  show how to use cheri intrinsics to work around issue of code pointers being sentries


#to build:
make 

#to run:
./build/code_chksum

#expected result

len=45c s=0x110855 [rxR,0x100000-0x1310c0] (sentry) f=0x110cb1 [rxR,0x100000-0x1310c0] (sentry) 
mypc =0x110bd4 [rxR,0x100000-0x1310c0]   newdist=fffffffffffffc81 
compute sum of 1116 bytes, starting at 0x110855 [rxR,0x100000-0x1310c0]
sum = 1e497







