#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-ported-cheri-linux"

cd ../ported-cheri-linux/

if make clean && make 2>&1 | tee -a /dev/tty ; then 
    echo "RESULT:  $NAME build success." 
    exit 0
else
    echo "RESULT:  $NAME build failed."
    exit 1
fi
