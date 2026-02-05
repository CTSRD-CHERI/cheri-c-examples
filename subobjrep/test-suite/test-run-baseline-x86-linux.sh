#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-baseline-x86-linux"

cd ../baseline-x86-linux/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)

echo "$RUN_RESULTS"

status=${PIPESTATUS[0]}
if (( status != 0 )); then
    echo "RESULT:  $NAME run failed."
    exit $status
fi

REGEXP="[0-9A-Fa-f]+"

if grep -Eq "[0-9]+ [0-9]+ 0x$REGEXP  0x$REGEXP  0x$REGEXP" <<< "$RUN_RESULTS"; then
    # Test succeeded
    echo "RESULT:  $NAME run success."
    exit 0
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
    exit 1
fi
