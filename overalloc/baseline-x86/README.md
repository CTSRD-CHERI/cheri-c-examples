#test:  overalloc

#purpose:  show possible overalloc issue w/cheri  (build w/ -cheri-bounds=aggressive)

#note: even with subobjbounds = aggressive, compiler will allow an overallocted pointer to 
#      be returned.

#note2:  build analysis is supposed to find this, but that doesn't seem to work ..

#to build:
make 

#to run:
./build/overalloc

#expected result:
ctest1:  over alloc 0x4083a000 0x4083a190 10 2 p1[0].a[0]=99 
  .. ctest1 _s1->a[0]= 99 (0x4083a000)





