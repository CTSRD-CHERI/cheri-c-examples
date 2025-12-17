#test:  overalloc

#purpose:  show fix for possible overalloc issue w/cheri  (build w/ -cheri-bounds=aggressive)

#Note: this test is opposite of others in that 'fix' will cause a crash
#      (we are trying to show fix for overalloc issue, where compiler gives us bounds that are too loose 
#       potentially. Fix is to use intrinsic to tighten bounds and test will crash with cheri-exception)


#to build:
make 

#to run:
./build/overalloc

#expected result:
ctest1:  over alloc 0x4083a000 0x4083a190 10 2 p1[0].a[0]=99 
In-address space security exception (core dumped)





