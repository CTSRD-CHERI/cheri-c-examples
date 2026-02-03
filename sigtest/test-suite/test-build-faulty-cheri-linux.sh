#!/usr/bin/env bash

set -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-linux"

cd ../faulty-cheri-linux/

BUILD_RESULTS=$( { ./make clean; make; } 2>&1)
status=$?

# The faulty cheri linux for the sigtest example shouldn't build.
if (( status != 0 )); then
    if grep -Fq "error: use of undeclared identifier 'SIGPROT'" <<< "$BUILD_RESULTS" ; then
        echo "Program build failed (this is expected for the faulty cheri version)."
        echo "RESULT:  $NAME build test succeeded."
        exit 0
    else
        echo "Program build failed for unknown reason."
        exit 1
    fi
else
    echo "Program build succeeded (this is a test failure; build shouuld not work for faulty cheri version)."
    echo "RESULT:  $NAME build failed."
    exit 1
fi





if make clean; make | tee /dev/tty ; then 
    echo "RESULT:  $NAME build success." 
    exit 0
else
    echo "RESULT:  $NAME build failed."
    exit 1
fi
