#!/bin/sh
echo "building and running baseline"
cd ../baseline
make
./build/alignment1

echo "building and running ported"
cd ../ported
make
./build/alignment1


