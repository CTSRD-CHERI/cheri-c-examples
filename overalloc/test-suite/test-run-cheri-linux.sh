set -o pipefail
NAME="overalloc-cherilinux"

cd ../ported-cheri-linux/

RUN_RESULTS=$(./build/overalloc 2>&1)
status=$?


# In this example, the program is supposed to crash on CHERI LINUX due to a CHERI
# security exception.
#status=${PIPESTATUS[0]}
#if (( status != 0 )); then
#    echo "RESULT:  $NAME run failed."
#    exit $status
#fi


echo "$RUN_RESULTS"
#echo $status

# Expected behavior is that the tightened bounds will crash with a segmentation fault.
if (( status == 0 )); then
    echo "Program ran without triggering CHERI security exception (failed test)."
    echo "RESULT:  $NAME run failed."
elif (( status == 139 )); then
    echo "CHERI security exception successfully triggered (results in segmentation fault)."
    echo "RESULT:  $NAME run success."
else
    echo "Runtime failed for unknown reason"
    echo "RESULT:  $NAME run failed."
fi
