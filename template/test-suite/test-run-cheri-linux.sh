set -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-cherilinux"

cd ../ported-cheri-linux/

RUN_RESULTS=$(./build/$EXAMPLE 2>&1)

echo "$RUN_RESULTS"

status=${PIPESTATUS[0]}
if (( status != 0 )); then
    echo "RESULT:  $NAME run failed."
    exit $status
fi

if [[ SUCCESS_CONDITION]]; then
    # Test succeeded
    echo "RESULT:  $NAME run success."
else
    # Any other result is a failed test.
    echo "RESULT:  $NAME run failed."
fi
