#!/bin/sh

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-ported-cheri-bsd"

cd ../ported-cheri-bsd/

BUILD_RESULTS=$( { make clean; make; } 2>&1)
status=$?

echo "$BUILD_RESULTS"

# Build should succeed and not generate warning
if [ "$status" -eq 0 ]; then
    if ! printf '%s\n' "$BUILD_RESULTS" | grep -Fq "warning: expression which evaluates to zero treated as a null pointer constant" ; then
        echo "Build did not generate warning from faulty cheri example."
        echo "RESULT:  $NAME build test succeeded."
        exit 0
    else
        echo "Build generated warning that was supposed to be fixed by ported cheri version."
        echo "RESULT:  $NAME build test failed."
        exit 1
    fi
else
    echo "Program build failed for unknown reason."
    echo "RESULT:  $NAME build test failed."
    exit 1
fi
