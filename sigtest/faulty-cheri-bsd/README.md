#test:  sigtest 

#purpose:   show what is needed to add a cheri fault handler.  Code based on gemini code snippet output to use sigxxx functions

#build
make

#run
./build/sigtest
Signal handler for SIGSEGV has been set up.
First pass: setting jump point.
Calling the dangerous function...
Entering a dangerous function that will cause a SIGSEGV .
In-address space security exception (core dumped)






