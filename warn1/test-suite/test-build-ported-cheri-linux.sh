#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-ported-cheri-linux"

cd ../ported-cheri-linux/

BUILD_RESULTS=$( { ./make clean; make; } 2>&1)
status=$?

echo "$BUILD_RESULTS"

# Check if purecap flags were used
if ! { grep -Fq -- "-march=morello" <<< "$BUILD_RESULTS" \
    && grep -Fq -- "-mabi=purecap" <<< "$BUILD_RESULTS" \
    && grep -Fq -- "--target=aarch64-linux-musl_purecap" <<< "$BUILD_RESULTS"; } ; then
    echo "RESULT:  $NAME build failed.  Purecap not used during compile"
    exit 1
fi

# Build should succeed and generate no integer to ptr cast warnings
if (( status == 0 )); then
    if grep -Fq "warning: cast from provenance-free integer type to pointer type will give pointer that can not be dereferenced" <<< "$BUILD_RESULTS" ; then
        echo "Build generated warning that was supposed to be fixed by ported cheri version."
        echo "RESULT:  $NAME build test failed."
        exit 1
    else
        echo "Build did not generate integer to ptr cast warning."
        echo "RESULT:  $NAME build test succeeded."
        exit 0
    fi
else
    echo "Program build failed for unknown reason."
    echo "RESULT:  $NAME build test failed."
    exit 1
fi