set -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-x86"

cd ../baseline-x86/

make clean

# Run make and determine whether build was successful or not.
if make | tee /dev/tty ; then 
    echo "RESULT:  $NAME build success." 
else
    echo "RESULT:  $NAME build failed."
fi
