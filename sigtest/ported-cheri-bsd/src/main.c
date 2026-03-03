/* sigtest */
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <setjmp.h>
#include <unistd.h>

/*
 * CHERI CHANGES START
 * {
 *   "updated": ,
 *   "target_type": ,
 *   "changes": [
 *     "signal_handling"
 *   ],
 *   "change_comment": "add SIGPROT (for cheri) to list of signals to handle"
 * }
 * CHERI CHANGES END
 */




// Declare a buffer to hold the program's state
static sigjmp_buf jump_buffer;

// The signal handler function
static void signal_handler(int signo) {
    printf("Signal handler triggered for signal %d.\n", signo);
    printf("Restoring program state with siglongjmp...\n");

    // Jump back to the location marked by sigsetjmp.
    // The second argument (1) is the non-zero value that sigsetjmp will return.
    siglongjmp(jump_buffer, 1);
}

// A function that will cause a segmentation fault
void cause_segfault(void) {
    printf("Entering a dangerous function that will cause a SIGSEGV or SIGPROT.\n");
    // Attempt to go past array bounds
    int buf[8];
    for(int i=0; i<=8; i++) buf[i]=0;
}

int main(void) {
    struct sigaction sa;

    // 1. Set up the signal handler for SIGSEGV & SIGPROT.
    // Specify the signal handler function.
    sa.sa_handler = signal_handler;
    // Clear the signal mask for the handler.
    sigemptyset(&sa.sa_mask);
    // Don't set any special flags.
    sa.sa_flags = 0;

    if (sigaction(SIGPROT, &sa, NULL) == -1) {
        perror("sigaction, SIGPROT");
        exit(EXIT_FAILURE);
    }
    if (sigaction(SIGSEGV, &sa, NULL) == -1) {
        perror("sigaction, SIGSEGV");
        exit(EXIT_FAILURE);
    }

    printf("Signal handler for SIGSEGV/SIGPROT has been set up.\n");

    // 2. Set the jump point with sigsetjmp.
    // The second argument (1) tells sigsetjmp to save the signal mask.
    if (sigsetjmp(jump_buffer, 1) == 0) {
        // This code runs on the first pass (when sigsetjmp returns 0).
        printf("First pass: setting jump point.\n");
        printf("Calling the dangerous function...\n");
        cause_segfault();
        printf("This line will never be reached because of the segmentation fault.\n");
    } else {
        // This code runs on the second pass (after siglongjmp returns).
        printf("Second pass: jumped back from the signal handler.\n");
        printf("Successfully recovered from the error!\n");
    }

    return 0;
}

