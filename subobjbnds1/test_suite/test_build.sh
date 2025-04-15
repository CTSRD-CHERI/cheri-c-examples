#!/bin/sh
echo "building and running baseline"
cd ../baseline
make
#should crash
./build/subobjbds1

echo "building and running ported"
cd ../ported
make
#should work
./build/subobjbds1


