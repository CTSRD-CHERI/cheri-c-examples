#!/usr/bin/env bash

set -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-ported-cheri-linux"

cd ../ported-cheri-linux/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)
status=$?


# In this example, the program is supposed to crash on CHERI LINUX due to a CHERI
# security exception.
#status=${PIPESTATUS[0]}
#if (( status != 0 )); then
#    echo "RESULT:  $NAME run failed."
#    exit $status
#fi


echo "$RUN_RESULTS"
#echo $status

# Expected behavior is that the tightened bounds will crash with a segmentation fault.
if (( status == 0 )); then
    echo "Program ran without triggering CHERI security exception (failed test)."
    echo "RESULT:  $NAME run failed."
    exit 1
elif (( status == 139 )); then
    echo "CHERI security exception successfully triggered (results in segmentation fault)."
    echo "RESULT:  $NAME run success."
    exit 0
else
    echo "Runtime failed for unknown reason"
    echo "RESULT:  $NAME run failed."
    exit 1
fi
