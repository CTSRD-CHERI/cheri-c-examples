#test:  warn11 

#purpose: show how to remove warning in integer to ptr cast
# (inspired by cheribsd: contrib/netbsd-tests/lib/libpthread/t_mutex.c)
Note: this example is about build warning. Baseline example runs fine

#to build:
make 
rc/main.c:9:11: warning: cast from provenance-free integer type to pointer type will give pointer that can not be dereferenced [-Wcheri-capability-misuse]
   return (void*) count;


#to run:
./build/warn1

#expected result:
./build/warn1

count = 100
100 101 





