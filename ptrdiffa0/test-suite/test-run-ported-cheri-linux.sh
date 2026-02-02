#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-ported-cheri-linux"

cd ../ported-cheri-linux/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)

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
# First element
echo "p is ${MEM_MATCHES[0]}"

# Second element
echo "*p is is ${MEM_MATCHES[1]}"

# Third element 
echo "s1 is ${MEM_MATCHES[2]}"

# Fourth element 
echo "base is ${MEM_MATCHES[3]}"

# First and fourth elements should match(strip whitespace).  
if [[ "${MEM_MATCHES[0]//[[:space:]]/}" == "${MEM_MATCHES[3]//[[:space:]]/}" ]]; then
    # These should be the same.
    echo "p and base match.  They both point to ${MEM_MATCHES[0]}"

    # Second and third elements should match(strip whitespace).  
    if [[ "${MEM_MATCHES[1]//[[:space:]]/}" == "${MEM_MATCHES[2]//[[:space:]]/}" ]]; then
        echo "*p and s1 match.  They both point to ${MEM_MATCHES[1]}"

        # Search for newoff=fffffffffffffff0
        if grep -Fq "newoff=fffffffffffffff0" <<< "$RUN_RESULTS" ; then
                echo "newoff is correct."
                echo "RESULT:  $NAME run success."
            exit 0
        else    
            echo "newoff is incorrect."
            echo "RESULT:  $NAME run failed."
            exit 1
        fi
    else
        echo "*p and s1 do not match."
        echo "RESULT:  $NAME run failed."
        exit 1
    fi

else
    # Any other result is a failed test.
    echo "p and base do not match."
    echo "RESULT:  $NAME run failed."
    exit 1
fi