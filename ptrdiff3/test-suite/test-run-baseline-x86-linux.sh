#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-baseline-x86-linux"

cd ../baseline-x86-linux/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)

echo "$RUN_RESULTS"
# Find memory addresses in the output results.
REGEX="0x[0-9A-Fa-f]+" # REGEX to find printed memory addresses only
mapfile -t MEM_MATCHES < <(
 grep -o -E "$REGEX" <<< "$RUN_RESULTS"
)
# First element
echo "buf[offset] is ${MEM_MATCHES[0]}"

# Second element
echo "b2 is is ${MEM_MATCHES[1]}"

# Third element 
echo "mybuf is ${MEM_MATCHES[2]}"

# mybuf should end in a '0', due to the pointer math.
last_char="${MEM_MATCHES[2]: -1}"

if [[ $last_char == 0 ]]; then
    # These should be the same.
    echo "last character in mybuf is 0"
    echo "RESULT:  $NAME run success."
    exit 0
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
    exit 1
fi
