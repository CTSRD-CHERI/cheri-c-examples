#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-linux"

cd ../faulty-cheri-linux/

BUILD_RESULTS=$( { ./make clean; make; } 2>&1)
status=$?

echo "$BUILD_RESULTS"

# Build should succeed but generate warning
if (( status == 0 )); then
    if grep -Fq "warning: incompatible integer to pointer conversion" <<< "$BUILD_RESULTS" && grep -Fq "warning: binary expression on capability types" <<< "$BUILD_RESULTS" ; then
        echo "Generated expected warnings."
        echo "RESULT:  $NAME build test succeeded."
        exit 0
    else
        echo "Build did not generate expected warnings."
        echo "RESULT:  $NAME build test failed."
        exit 1
    fi
else
    echo "Program build failed for unknown reason."
    echo "RESULT:  $NAME build test failed."
    exit 1
fi


