#test:  samplealloc

#purpose:  show fix for samplealloc to get individual allocated unit protection

#Note: this test is opposite of others in that 'fix' will cause a crash
#      (we are trying to show fix for user space allocator issue, where compiler gives us bounds that are too loose 
#       potentially. Fix is to use intrinsic to tighten bounds and test will crash with cheri-exception)


#to build:
make 

#to run:
./build/samplealloc

#expected result:
In-address space security exception (core dumped)





