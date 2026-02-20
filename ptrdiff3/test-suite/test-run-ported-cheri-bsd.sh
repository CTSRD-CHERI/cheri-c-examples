#!/bin/sh

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-ported-cheri-bsd"

cd ../ported-cheri-bsd/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)
status=$?

echo "$RUN_RESULTS"

if [ "$status" -ne 0 ]; then
    echo "RESULT:  $NAME run failed."
    exit $status
fi

# Find memory addresses in the output results.
REGEX='0x[0-9A-Fa-f][0-9A-Fa-f]*' # REGEX to find printed memory addresses only

# Extract matches into positional parameters
set -- $(printf '%s\n' "$RUN_RESULTS" | grep -o -E "$REGEX")

# First element
buf_offset=$1
b2=$2
mybuf=$3

echo "buf[offset] is $buf_offset"
echo "b2 is $b2"
echo "mybuf is $mybuf"

# Get last character of mybuf 
last_char=$(printf '%s' "$mybuf" | tail -c 1)

if [ "$last_char" = "0" ]; then
    echo "last character in mybuf is 0"
    echo "RESULT:  $NAME run success."
    exit 0
else
    echo "RESULT:  $NAME run failed."
    exit 1
fi


######

# # Find memory addresses in the output results.
# REGEX="0x[0-9A-Fa-f]+" # REGEX to find printed memory addresses only
# mapfile -t MEM_MATCHES < <(
#  grep -o -E "$REGEX" <<< "$RUN_RESULTS"
# )
# # First element
# echo "buf[offset] is ${MEM_MATCHES[0]}"

# # Second element
# echo "b2 is is ${MEM_MATCHES[1]}"

# # Third element 
# echo "mybuf is ${MEM_MATCHES[2]}"

# # mybuf should end in a '0', due to the pointer math.
# last_char="${MEM_MATCHES[2]: -1}"

# if [[ $last_char == 0 ]]; then
#     # These should be the same.
#     echo "last character in mybuf is 0"
#     echo "RESULT:  $NAME run success."
#     exit 0
# else
#     # Any other result is a failed test.
#     echo "RESULT:  $NAME run failed."
#     exit 1
# fi

# if printf '%s\n' "$RUN_RESULTS" | grep -Fq "ctest1: return str= ctest 1 string.. All aligned" ; then
#     # Test succeeded
#     echo "RESULT:  $NAME run success."
#     exit 0
# else
#     # Any other result is a failed test.
#     echo "RESULT:  $NAME run failed."
#     exit 1
# fi
