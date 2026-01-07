#test:  warn5 

#purpose:  show fix for warning from when compiler gets confused as to which is 
# what is the base of a pointer and what is an alignment mask 

#to build:
make 

#to run:
./build/warn5

#expected result(build):
make

#to run, expected result:
./build/warn5

warn5:  align buf 0xfffffa3788c0 [rwRW,0xfffffa3788c0-0xfffffa378940] to sz 16 

done 0xfffffa3788c0 [rwRW,0xfffffa3788c0-0xfffffa378940] 0xfffffa3788c0 [rwRW,0xfffffa3788c0-0xfffffa378940]






