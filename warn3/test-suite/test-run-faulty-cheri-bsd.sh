#!/bin/sh

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-bsd"

cd ../faulty-cheri-bsd/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)
status=$?

echo "$RUN_RESULTS"

if [ "$status" -ne 0 ]; then
    echo "RESULT:  $NAME run failed."
    exit $status
fi

if printf '%s\n' "$RUN_RESULTS" | grep -Eq "buf\[offset\] = 0x[0-9A-Fa-f]+" && printf '%s\n' "$RUN_RESULTS" | grep -Eq "b2= 0x[0-9A-Fa-f]+,  mybuf=0x[0-9A-Fa-f]+ a" ; then
    # Test succeeded
    echo "RESULT:  $NAME run success."
    exit 0
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
    exit 1
fi
