#!/bin/sh

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-bsd"

cd ../faulty-cheri-bsd/

BUILD_RESULTS=$( { make clean; make; } 2>&1)
status=$?

echo "$BUILD_RESULTS"

# Build should succeed but generate warning
if [ "$status" -eq 0 ]; then
    if printf '%s\n' "$BUILD_RESULTS" | grep -Fq "warning: expression which evaluates to zero treated as a null pointer constant" ; then
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

