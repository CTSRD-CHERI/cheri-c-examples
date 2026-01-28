#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-baseline-x86-linux"

cd ../baseline-x86-linux/

RUN_RESULTS=$(./build/$EXAMPLE)

status=${PIPESTATUS[0]}
if (( status != 0 )); then
    echo "RESULT:  $NAME run failed."
    exit $status
fi

echo "$RUN_RESULTS"

# Find memory addresses in the output results.
REGEX="0x[0-9A-Fa-f]+" # REGEX to find printed memory addresses only
mapfile -t MEM_MATCHES < <(
 grep -o -E "$REGEX" <<< "$RUN_RESULTS"
)

# First element (MEM_MATCHES[0]) is the address for p1.
echo "Pointer p1 address is ${MEM_MATCHES[0]}"

# Third element (MEM_MATCHES[2]) is the address for p2 after pointer bleed.
echo "Pointer p2 address is ${MEM_MATCHES[2]}"

# Compare first and third elements (strip whitespace).  
if [[ "${MEM_MATCHES[0]//[[:space:]]/}" == "${MEM_MATCHES[2]//[[:space:]]/}" ]]; then
    # These should be the same.
    echo "p1 and p2 addresses are equal.  They both point to ${MEM_MATCHES[0]}"
    echo "RESULT:  $NAME run success."
    exit 0
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
    exit 1
fi
