#!/data/data/com.termux/files/usr/bin/bash

# Define the test file path
TEST_FILE="/sdcard/termux-test/test"

# Create the directory if it doesn't exist
mkdir -p $(dirname $TEST_FILE)

# Function to clean up the test file
cleanup() {
    rm -f $TEST_FILE
    exit 0
}

# Register the cleanup function to be called on exit
trap cleanup EXIT

# Run the dd command to measure the I/O speed
echo "Measuring I/O speed..."
dd if=/dev/zero of=$TEST_FILE bs=1M count=1024 2>&1 | grep --line-buffered copied

# Clean up the test file
cleanup
