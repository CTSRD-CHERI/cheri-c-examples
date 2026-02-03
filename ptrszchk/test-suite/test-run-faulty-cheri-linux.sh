#!/usr/bin/env bash

set -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-linux"

cd ../faulty-cheri-linux/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)
status=$?

echo "$RUN_RESULTS"

# The faulty cheri linux ptrszchk example should fail the run due a failed assertion.
if (( status != 0 )); then
    if grep -Fq "Assertion failed: ret !=0" <<< "$RUN_RESULTS" ; then
        echo "Program run failed (this is expected for the faulty cheri version)."
        echo "RESULT:  $NAME run test succeeded."
        exit 0
    else
        echo "Program run failed for unknown reason."
        exit 1
    fi
else
    echo "Program run succeeded (this is a test failure; run should fail for faulty cheri version)."
    echo "RESULT:  $NAME run failed."
    exit 1
fi