#!/bin/sh

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-bsd"

cd ../faulty-cheri-bsd/

if make clean; make | tee /dev/tty ; then 
    echo "RESULT:  $NAME build success." 
    exit 0
else
    echo "RESULT:  $NAME build failed."
    exit 1
fi
