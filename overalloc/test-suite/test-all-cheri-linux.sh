set -o pipefail

# Create name for results folder
DATETIME=$(date +"%Y-%m-%d-%H%M%S")
NAME="overalloc-cherilinux"
HOST=$(hostname)
RESULTS_FOLDER="$DATETIME-$NAME-$HOST"
mkdir -p ./results/$RESULTS_FOLDER

# Create name for log file.
LOG_FILENAME="test-$NAME.log"
LOGFILE_FULL_PATH="./results/$RESULTS_FOLDER/$LOG_FILENAME"

echo "Building $NAME." 2>&1 | tee -a $LOGFILE_FULL_PATH 
./test-build-cheri-linux.sh 2>&1 | tee -a $LOGFILE_FULL_PATH

# Stop if build failed.
exit ${PIPESTATUS[0]}

echo "Testing $NAME."
./test-run-cheri-linux.sh 2>&1 | tee -a $LOGFILE_FULL_PATH

echo "Build and test for $NAME complete."