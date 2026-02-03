#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-ported-cheri-linux"

cd ../ported-cheri-linux/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)

status=${PIPESTATUS[0]}
if (( status != 0 )); then
    echo "RESULT:  $NAME run failed."
    exit $status
fi

echo "$RUN_RESULTS"

# Should run to completion and print applicable memory addresses
if grep -E "p=.+ *p=.+ base=.+ newoff=.+" <<< "$RUN_RESULTS" ; then
    echo "RESULT:  $NAME run success."
        exit 0
    else    
        echo "RESULT:  $NAME run failed."
        exit 1
fi