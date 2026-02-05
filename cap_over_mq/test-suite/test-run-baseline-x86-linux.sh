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

# Check number of messages sent
if [[ $(grep -Ec "Message queue  msg [0-9]+ sent successfully" <<< "$RUN_RESULTS") == 10 ]] ; then
    # Check number of messages received
    if [[ $(grep -Ec "msg is this is msg [0-9]+" <<< "$RUN_RESULTS") == 10 ]] ; then
        # Test succeeded
        echo "RESULT:  $NAME run success."
        exit 0
    else
        echo "Number of sent and received messages don't match."
        echo "RESULT:  $NAME run failed."
        exit 1
    fi
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
    exit 1
fi
