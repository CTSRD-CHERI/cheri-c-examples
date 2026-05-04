#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-linux"

cd ../faulty-cheri-linux/

BUILD_RESULTS="$(make clean && make 2>&1)"
STATUS=$?

echo "$BUILD_RESULTS"

if [ "$STATUS" -eq 0 ]; then
    if grep -Fq -- "-march=morello" <<< "$BUILD_RESULTS" \
    && grep -Fq -- "-mabi=purecap" <<< "$BUILD_RESULTS" \
    && grep -Fq -- "--target=aarch64-linux-musl_purecap" <<< "$BUILD_RESULTS"; then
        echo "RESULT:  $NAME build success." 
        exit 0
    else
        echo "RESULT:  $NAME build failed.  Purecap not used during compile"
        exit 1
    fi
else
    echo "RESULT:  $NAME build failed."
    exit 1
fi
