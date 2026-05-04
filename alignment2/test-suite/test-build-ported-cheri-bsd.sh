#!/bin/sh

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-ported-cheri-bsd"

cd ../ported-cheri-bsd/

BUILD_RESULTS="$(make clean && make 2>&1)"
STATUS=$?

echo "$BUILD_RESULTS"

if [ "$STATUS" -eq 0 ]; then
    if printf '%s\n' "$BUILD_RESULTS" | grep -Fq -- "-march=morello" \
    && printf '%s\n' "$BUILD_RESULTS" | grep -Fq -- "-mabi=purecap" \
    && printf '%s\n' "$BUILD_RESULTS" | grep -Fq -- "--target=aarch64-linux-musl_purecap" ; then
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
