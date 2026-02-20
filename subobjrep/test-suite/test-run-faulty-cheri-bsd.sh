#!/bin/sh

set -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-bsd"

cd ../faulty-cheri-bsd/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)
status=$?

echo "$RUN_RESULTS"

REGEXP="[0-9A-Fa-f]+"

if printf '%s\n' "$RUN_RESULTS" | grep -Eq "[0-9]+ [0-9]+ 0x$REGEXP  0x$REGEXP  0x$REGEXP" ; then
    # Test succeeded
    echo "RESULT:  $NAME run success."
    exit 0
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
    exit 1
fi