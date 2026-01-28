set -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-x86"

cd ../baseline-x86/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)

echo "$RUN_RESULTS"

status=${PIPESTATUS[0]}
if (( status != 0 )); then
    echo "RESULT:  $NAME run failed."
    exit $status
fi

# Expected behavior is successful address access (no space security checking on x86).
if grep -Fq "ptrdiff, array[0] = 0" <<< "$RUN_RESULTS"; then
    # Test succeeded
    echo "RESULT:  $NAME run success."
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
fi
