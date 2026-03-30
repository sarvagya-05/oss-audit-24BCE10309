#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: [Sarvagya Shrivastava] | Reg No: [24BCE10309]
# Purpose: Checks if Python is installed, shows its details,
#          and explains its open-source philosophy using a case statement

PACKAGE="python3"   # The package we are inspecting

echo "=============================================="
echo "   FOSS Package Inspector"
echo "=============================================="

# --- if-then-else: Check if package is installed ---
if dpkg -l "$PACKAGE" &>/dev/null; then
    echo "$PACKAGE is INSTALLED on this system."
    echo ""
    echo "--- Package Details ---"
    # Use pipe with grep to filter only useful lines
    dpkg -l "$PACKAGE" | grep -E "^ii" | awk '{print "Version : " $3 "\nStatus  : Installed"}'
    echo ""
    # Get more detailed info
    dpkg -s "$PACKAGE" | grep -E "^(Package|Version|Maintainer|Homepage)"
else
    echo "$PACKAGE is NOT installed."
    echo "To install it, run: sudo apt install python3"
    exit 1
fi

echo ""
echo "--- Open Source Philosophy ---"

# --- case statement: Print philosophy note based on package name ---
case $PACKAGE in
    python3)
        echo "Python: Born from a desire for open, readable code."
        echo "Guido van Rossum shared it freely so everyone could build on it."
        echo "Licensed under PSF — allows commercial use without sharing changes."
        ;;
    httpd|apache2)
        echo "Apache: The web server that built the open internet."
        echo "Collaborative development by volunteers worldwide."
        ;;
    mysql|mariadb)
        echo "MySQL: Open source at the heart of millions of applications."
        echo "Uses a dual-license model (GPL + commercial)."
        ;;
    firefox)
        echo "Firefox: A nonprofit browser fighting for an open web."
        echo "Licensed under MPL 2.0 — a balanced copyleft license."
        ;;
    git)
        echo "Git: Linus built it when proprietary version control failed him."
        echo "Now it powers the entire open-source world."
        ;;
    *)
        echo "$PACKAGE: An open-source tool contributing to the FOSS ecosystem."
        ;;
esac

echo "=============================================="
