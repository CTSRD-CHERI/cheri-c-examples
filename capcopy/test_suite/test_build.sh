#!/bin/sh
echo "building and running baseline"
cd ../baseline
make
#should crash
./build/capcopy

echo "building and running ported"
cd ../ported
make
#should work
./build/capcopy


