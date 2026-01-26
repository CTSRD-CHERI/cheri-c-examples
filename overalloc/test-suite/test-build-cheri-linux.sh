set -o pipefail

cd ../ported-cheri-linux/

make clean

# Run make and determine whether build was successful or not.
if make | tee /dev/tty ; then 
#if make CFLAGS='' | tee /dev/tty ; then 
    echo "RESULT:  $NAME build success." 
else
    echo "RESULT:  $NAME build failed."
fi
