#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-linux"

cd ../faulty-cheri-linux/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)

echo "$RUN_RESULTS"

status=${PIPESTATUS[0]}
if (( status != 0 )); then
    echo "RESULT:  $NAME run failed."
    exit $status
fi

# In the faulty cheri linux example, the program should run to completion, 
# produce the result below, and not generate a cheri security exception.
if grep -Eq "0x[0-9A-Fa-f]+ 0x[0-9A-Fa-f]+ 1234" <<< "$RUN_RESULTS"; then
    # Test succeeded
    echo "RESULT:  $NAME run success."
    exit 0
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
    exit 1
fi
