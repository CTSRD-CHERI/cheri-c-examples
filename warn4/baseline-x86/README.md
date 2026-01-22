#test:  warn4 

#purpose:  show warning from compiler concerning using integer 0 as a NULL pointer 

#to build:
make 
src/main.c:38:33: warning: expression which evaluates to zero treated as a null pointer constant of type 'const char *' [-Wnon-literal-null-conversion]
        OS_MACRO_TEST_FUNC_RC( ctest, (UT0),  OS_ERR_OK)
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
src/main.c:17:13: note: expanded from macro 'UT0'
#define UT0 OSAL_INDEX(0) 
            ^
src/main.c:16:23: note: expanded from macro 'OSAL_INDEX'
#define OSAL_INDEX(X) (uint32_t)(X)
                      ^
src/main.c:22:22: note: expanded from macro 'OS_MACRO_TEST_FUNC_RC'
        int32_t rcact= func args; \
                            ^~~~


#to run:
./build/warn4









