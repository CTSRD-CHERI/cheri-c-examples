#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-linux"

cd ../faulty-cheri-linux/

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

# Build should succeed but generate warning
if (( status == 0 )); then
    if grep -Fq "warning: expression which evaluates to zero treated as a null pointer constant" <<< "$BUILD_RESULTS" ; then
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

