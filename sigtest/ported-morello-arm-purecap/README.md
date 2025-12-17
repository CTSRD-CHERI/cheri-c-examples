#test:  sigtest 

#purpose:   show what is needed to add a cheri fault handler.  Code based on gemini output

#to build:
make 

#to run:
./build/sigtest


#expected result:
./build/sigtest
Signal handler for SIGSEGV/SIGPROT has been set up.
First pass: setting jump point.
Calling the dangerous function...
Entering a dangerous function that will cause a SIGSEGV or SIGPROT.
Signal handler triggered for signal 10.
Restoring program state with siglongjmp...
Second pass: jumped back from the signal handler.
Successfully recovered from the error!




