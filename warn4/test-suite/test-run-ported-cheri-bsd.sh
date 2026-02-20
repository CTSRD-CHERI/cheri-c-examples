#!/bin/sh

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-ported-cheri-bsd"

cd ../ported-cheri-bsd/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)
status=$?

echo "$RUN_RESULTS"

if [ "$status" -ne 0 ]; then
    echo "RESULT:  $NAME run failed."
    exit $status
fi

if printf '%s\n' "$RUN_RESULTS" | grep -Fq "buf = 0x0" && printf '%s\n' "$RUN_RESULTS" | grep -Fq "rcexp =OS_ERR_OK= 0 ,  rcact= ctest((void*)UT0)= 0" ; then
    # Test succeeded
    echo "RESULT:  $NAME run success."
    exit 0
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
    exit 1
fi
