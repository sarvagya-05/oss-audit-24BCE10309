#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: [Sarvagya Shrivastava] | Reg No: [24BCE10309]
# Purpose: Interactively asks the user 3 questions, then generates
#          a personalised open-source philosophy statement and saves it.

echo "=============================================="
echo "   Open Source Manifesto Generator"
echo "=============================================="
echo ""
echo "Answer three questions to generate your manifesto."
echo ""

# --- read: Get user input interactively ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# Get current date for the manifesto header
DATE=$(date '+%d %B %Y')

# Create output filename using the current username
OUTPUT="manifesto_$(whoami).txt"

# --- String concatenation: Build the manifesto paragraph ---
echo ""
echo "Generating your manifesto..."
echo ""

# --- Write to file using > (overwrite) and >> (append) ---
echo "===== My Open Source Manifesto =====" > "$OUTPUT"
echo "Date: $DATE" >> "$OUTPUT"
echo "Author: $(whoami)" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# The main paragraph — built from user's three answers
echo "Every day, I rely on $TOOL — a tool built not for profit," >> "$OUTPUT"
echo "but for the freedom to use, study, share and improve." >> "$OUTPUT"
echo "To me, freedom means $FREEDOM — and open source makes that real." >> "$OUTPUT"
echo "One day I will build $BUILD and release it freely," >> "$OUTPUT"
echo "so that others can stand on my shoulders, just as I have stood" >> "$OUTPUT"
echo "on the shoulders of those who came before me." >> "$OUTPUT"
echo "Open source is not just a license. It is a philosophy." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "====================================" >> "$OUTPUT"

echo "Manifesto saved to $OUTPUT"
echo ""

# --- Display the saved manifesto ---
cat "$OUTPUT"

echo "=============================================="
