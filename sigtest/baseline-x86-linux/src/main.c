#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <setjmp.h>
#include <unistd.h>


int main(void) {
    // Attempt to go past array bounds
    printf("Executing operation that will cause buffer overflow memory access.\n");
    int buf[8];
    for(int i=0; i<=8; i++) 
    {   buf[i]=0; 
        printf("buf[%d] = %d\n", i, buf[i]);
    }

    return 0;
}

