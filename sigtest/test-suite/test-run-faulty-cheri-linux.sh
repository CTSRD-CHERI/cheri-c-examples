#!/usr/bin/env bash

set -e -o pipefail
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-faulty-cheri-linux"

echo "This script shouldn't ever run since the faulty cheri linux version shouldn't build."
echo "RESULT:  $NAME run failed."
exit 1
