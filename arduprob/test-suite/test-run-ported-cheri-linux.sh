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
if grep -Fq "base=" <<< "$RUN_RESULTS" && grep -Fq "param_b1 addr" <<< "$RUN_RESULTS"; then
        # Test succeeded
        echo "RESULT:  $NAME run success."
        exit 0
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
    exit 1
fi
