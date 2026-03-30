#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: [Sarvagya Shrivastava] | Reg No: [24BCE10309]
# Purpose: Loops through key system directories and reports
#          their permissions, owner, and disk usage.
#          Also checks Python's specific directories.

# Array of important system directories to audit
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=============================================="
echo "   Directory Audit Report"
echo "=============================================="
echo ""

# --- for loop: Iterate over each directory in the array ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions, owner and group using awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        # Get disk usage, suppress errors for restricted dirs
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "Directory : $DIR"
        echo "  Permissions : $PERMS"
        echo "  Owner       : $OWNER : $GROUP"
        echo "  Size        : ${SIZE:-'N/A (permission denied)'}"
        echo ""
    else
        echo "$DIR does not exist on this system."
        echo ""
    fi
done

echo "----------------------------------------------"
echo "   Python-specific Directory Check"
echo "----------------------------------------------"

# --- Check Python's installation and config directories ---
PYTHON_DIRS=("/usr/bin/python3" "/usr/lib/python3" "/usr/local/lib/python3.12")

for PDIR in "${PYTHON_DIRS[@]}"; do
    if [ -e "$PDIR" ]; then
        PERMS=$(ls -ld "$PDIR" | awk '{print $1}')
        OWNER=$(ls -ld "$PDIR" | awk '{print $3}')
        echo "Found    : $PDIR"
        echo "  Perms  : $PERMS | Owner: $OWNER"
        echo ""
    else
        echo "$PDIR not found on this system."
        echo ""
    fi
done

echo "=============================================="
