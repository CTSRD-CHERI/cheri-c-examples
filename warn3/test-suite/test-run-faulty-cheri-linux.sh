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

if grep -Eq "buf\[offset\] = 0x[0-9A-Fa-f]+" <<< "$RUN_RESULTS"  && grep -Eq "b2= 0x[0-9A-Fa-f]+,  mybuf=0x[0-9A-Fa-f]+ a" <<< "$RUN_RESULTS" ; then
    # Test succeeded
    echo "RESULT:  $NAME run success."
    exit 0
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
    exit 1
fi
