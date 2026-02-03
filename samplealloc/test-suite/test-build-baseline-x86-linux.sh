#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-baseline-x86-linux"

cd ../baseline-x86-linux/

if make clean; make | tee /dev/tty ; then 
    echo "RESULT:  $NAME build success." 
    exit 0
else
    echo "RESULT:  $NAME build failed."
    exit 1
fi
