#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-linux"

echo "This is a dummy script; faulty cheri linux version shouldn't build."
echo "RESULT:  $NAME run succeeded."
exit 0
