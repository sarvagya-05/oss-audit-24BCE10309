#!/bin/bash
# Script 4: Log File Analyzer
# Author: [Sarvagya Shrivastava] | Reg No: [24BCE10309]
# Purpose: Reads a log file line by line, counts keyword occurrences,
#          and prints a summary with the last 5 matching lines.
# Usage: ./script4_log_analyzer.sh /var/log/syslog error

# Command-line arguments
LOGFILE=$1
KEYWORD=${2:-"error"}   # Default keyword is 'error' if not provided

COUNT=0   # Counter variable for keyword matches

# --- Validate the log file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    echo "Usage: ./script4_log_analyzer.sh <logfile> <keyword>"
    exit 1
fi

echo "=============================================="
echo "   Log File Analyzer"
echo "=============================================="
echo "Log File : $LOGFILE"
echo "Keyword  : $KEYWORD"
echo ""

# --- while read loop: Read file line by line ---
while IFS= read -r LINE; do
    # --- if-then: Check if current line contains the keyword (case-insensitive) ---
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter
    fi
done < "$LOGFILE"   # Redirect file into the while loop

echo "Result   : '$KEYWORD' found $COUNT times in $LOGFILE"
echo ""

# --- Check if count is zero and handle empty result ---
if [ "$COUNT" -eq 0 ]; then
    echo "No matches found for '$KEYWORD'."
else
    echo "--- Last 5 lines containing '$KEYWORD' ---"
    # Use grep + tail to print last 5 matching lines
    grep -i "$KEYWORD" "$LOGFILE" | tail -5
fi

echo "=============================================="
