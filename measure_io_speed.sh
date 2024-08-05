#!/data/data/com.termux/files/usr/bin/bash

# Function to install required packages
install_packages() {
    echo "Installing required packages..."
    pkg update && pkg install -y ncurses
}

# Check if ncurses is installed, and install it if necessary
if ! command -v tput &> /dev/null; then
    install_packages
fi

# Define colors
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)

# Define the test file path
TEST_FILE="/sdcard/termux-test/test"
LOG_FILE="/sdcard/termux-test/log.txt"

# Create the directory if it doesn't exist
mkdir -p $(dirname $TEST_FILE)

# Function to clean up the test file
cleanup() {
    rm -f $TEST_FILE
    echo "${GREEN}Cleanup complete.${RESET}"
    exit 0
}

# Register the cleanup function to be called on exit
trap cleanup EXIT

# Function to log messages with timestamp
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a $LOG_FILE
}

# Function to print animated dots
animate_dots() {
    local i=0
    while [ $i -lt 5 ]; do
        echo -n "."
        sleep 0.5
        i=$((i+1))
    done
    echo
}

# Run the dd command to measure the I/O speed
log "${YELLOW}Measuring I/O speed${RESET}"
echo -n "Running test"
animate_dots

DD_OUTPUT=$(dd if=/dev/zero of=$TEST_FILE bs=1M count=1024 2>&1 | grep --line-buffered copied)

# Log the result
log "${CYAN}I/O Test Result:${RESET} $DD_OUTPUT"

# Print the report
echo "${MAGENTA}========== I/O Speed Test Report ==========${RESET}"
echo "${BLUE}| Test File Path         | $TEST_FILE ${RESET}"
echo "${BLUE}|------------------------------------------|${RESET}"
echo "${GREEN}| I/O Speed              | $DD_OUTPUT ${RESET}"
echo "${BLUE}|------------------------------------------|${RESET}"
echo "${MAGENTA}============================================${RESET}"

# Clean up the test file
cleanup
