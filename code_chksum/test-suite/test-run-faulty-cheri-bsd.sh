#!/usr/bin/env bash

set -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-bsd"

cd ../faulty-cheri-bsd/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)
status=$?

echo "$RUN_RESULTS"
#echo $status   

if (( status == 0 )); then
    echo "Program ran successfully (should crash)."
    echo "RESULT:  $NAME run failed."
    exit 1
elif (( status == 162 )); then
    echo "CHERI security exception triggered (results in segmentation fault - expected behavior)."
    echo "RESULT:  $NAME run success."
    exit 0
else
    echo "Runtime failed for unknown reason"
    echo "RESULT:  $NAME run failed."
    exit 1
fi
