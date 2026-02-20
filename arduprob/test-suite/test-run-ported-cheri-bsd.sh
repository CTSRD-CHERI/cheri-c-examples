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

if printf '%s\n' "$RUN_RESULTS" | grep -Fq "base=" && printf '%s\n' "$RUN_RESULTS" | grep -Eq "param_a1 addr.+val 11" && printf '%s\n' "$RUN_RESULTS" | grep -Eq "param_a2 addr.+val 22" ; then
    # Test succeeded
    echo "RESULT:  $NAME run success."
    exit 0
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
    exit 1
fi
