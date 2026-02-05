#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-ported-cheri-linux"

cd ../ported-cheri-linux/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)

echo "$RUN_RESULTS"

status=${PIPESTATUS[0]}
if (( status != 0 )); then
    echo "RESULT:  $NAME run failed."
    exit $status
fi

# Check for first and last lines of output
if grep -Fq "base=" <<< "$RUN_RESULTS" && grep -Eq "param_a1 addr.+val 11" <<< "$RUN_RESULTS" && grep -Eq "param_a2 addr.+val 22" <<< "$RUN_RESULTS"; then
    if grep -Eq "param_class_b addr.+val =0x[0-9A-Fa-f]+" <<< "$RUN_RESULTS" && grep -Eq "param_b1 addr.+val =33" <<< "$RUN_RESULTS"; then
        # Test succeeded
        echo "RESULT:  $NAME run success."
        exit 0
    else
        # Any other result is a failed test.
        echo "RESULT:  $NAME run failed."
        exit 1
    fi
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
    exit 1
fi
