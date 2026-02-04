#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-linux"

cd ../faulty-cheri-linux/

BUILD_RESULTS=$( { ./make clean; make; } 2>&1)
status=$?

echo "$BUILD_RESULTS"

# Build should succeed but generate an integer to ptr cast warning
if (( status == 0 )); then
    if grep -Fq "warning: comparison between pointer and integer" <<< "$BUILD_RESULTS" ; then
        echo "Generated expected warning"
        echo "RESULT:  $NAME build test succeeded."
        exit 0
    else
        echo "Build did not generate expected warning."
        echo "RESULT:  $NAME build test failed."
        exit 1
    fi
else
    echo "Program build failed for unknown reason."
    echo "RESULT:  $NAME build test failed."
    exit 1
fi
