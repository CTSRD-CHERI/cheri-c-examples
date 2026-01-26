set -o pipefail

cd ../ported-cheri-linux/

RUN_RESULTS=$(./build/overalloc)

# In this example, the program is supposed to crash on CHERI LINUX due to a CHERI
# security exception.
#status=${PIPESTATUS[0]}
#if (( status != 0 )); then
#    echo "RESULT:  $NAME run failed."
#    exit $status
#fi

echo "$RUN_RESULTS"

# Expected behavior is that the tightened bounds will crash with a cheri exception.
if grep -o -E "security exception" <<< "$RUN_RESULTS"; then
    echo "CHERI security exception successfully triggered."
    echo "RESULT:  $NAME run success."
else
    echo "Program ran without triggering CHERI security exception (failed test)."
    echo "RESULT:  $NAME run failed."
fi
