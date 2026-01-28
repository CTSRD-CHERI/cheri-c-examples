#!/usr/bin/env bash

set -e -o pipefail

# Create name for results folder
DATETIME=$(date +"%Y-%m-%d-%H%M%S")
EXAMPLE=$(basename $(cd ../ && pwd))
NAME="$EXAMPLE-baseline-x86-linux"
HOST=$(hostname)
RESULTS_FOLDER="$DATETIME-$NAME-$HOST"
mkdir -p ./results/$RESULTS_FOLDER

# Create name for log file.
LOG_FILENAME="test-$NAME.log"
LOGFILE_FULL_PATH="./results/$RESULTS_FOLDER/$LOG_FILENAME"

echo "Building $NAME." 2>&1 | tee -a $LOGFILE_FULL_PATH 
./test-build-baseline-x86-linux.sh 2>&1 | tee -a $LOGFILE_FULL_PATH

# Stop if build failed.
if (( PIPESTATUS[0] != 0 )); then
    echo "Build failed, aborting run."
    exit ${PIPESTATUS[0]}
fi

echo "Testing $NAME."
./test-run-baseline-x86-linux.sh 2>&1 | tee -a $LOGFILE_FULL_PATH

echo "Build and test for $NAME complete."