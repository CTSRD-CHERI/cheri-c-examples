#!/bin/sh

set -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-bsd"

cd ../faulty-cheri-bsd/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)
status=$?
echo "$status"

echo "$RUN_RESULTS"

if [ "$status" -eq 0 ]; then
    echo "Program ran successfully (should crash)."
    echo "RESULT:  $NAME run failed."
    exit 1
elif [ "$status" -eq 162 ]; then
    echo "CHERI security exception triggered (results in core dump - expected behavior)."
    echo "RESULT:  $NAME run success."
    exit 0
else
    echo "Runtime failed for unknown reason"
    echo "RESULT:  $NAME run failed."
    exit 1
fi