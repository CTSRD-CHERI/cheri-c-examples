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

REGEXP="[0-9A-Fa-f]+"

# Test for first line.
if printf '%s\n' "$RUN_RESULTS" | grep -Eq "ctest1: pointer-casts requires proper alignment a=0x$REGEXP .+ .da=$REGEXP" ; then
    # Test for second line.
    if printf '%s\n' "$RUN_RESULTS" | grep -Eq "ctest1, v=0x$REGEXP.+blah = 0x$REGEXP" ; then
        # Test succeeded
        echo "RESULT:  $NAME run success."
        exit 0
    else
        echo "RESULT:  $NAME run failed."
        exit 1
    fi
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
    exit 1
fi
