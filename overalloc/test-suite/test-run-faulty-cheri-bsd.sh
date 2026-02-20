#!/bin/sh

set -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-bsd"

cd ../faulty-cheri-bsd/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)
status=$?

echo "$RUN_RESULTS"

if [ "$status" -ne 0 ]; then
    echo "RESULT:  $NAME run failed."
    exit $status
fi

# Find memory addresses in the output results.
REGEX='0x[0-9A-Fa-f][0-9A-Fa-f]*'  # portable regex

# Extract matches into positional parameters
set -- $(printf '%s\n' "$RUN_RESULTS" | grep -o -E "$REGEX")

# First match = p1
p1=$1

# Third match = p2
p2=$3

echo "Pointer p1 address is $p1"
echo "Pointer p2 address is $p2"

# Strip whitespace (safety, though grep -o shouldn't include any)
p1_clean=$(printf '%s' "$p1" | tr -d '[:space:]')
p2_clean=$(printf '%s' "$p2" | tr -d '[:space:]')

# Compare first and third elements
if [ "$p1_clean" = "$p2_clean" ]; then
    echo "p1 and p2 addresses are equal. They both point to $p1_clean"
    echo "RESULT:  $NAME run success."
    exit 0
else
    echo "RESULT:  $NAME run failed."
    exit 1
fi
