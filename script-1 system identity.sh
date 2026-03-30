#!/bin/bash
# Script 1: System Identity Report
# Author: [Sarvagya Shrivastava] | Reg No: [24BCE10309]
# Course: Open Source Software
# Purpose: Displays a welcome screen with system info and license details

# --- Variables ---
STUDENT_NAME="[Sarvagya Shrivastava]"           # Your full name
SOFTWARE_CHOICE="Python"             # Our chosen OSS project

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                   # Linux kernel version
USER_NAME=$(whoami)                  # Currently logged-in user
HOME_DIR=$HOME                       # Home directory of current user
UPTIME=$(uptime -p)                  # How long the system has been running
CURRENT_DATE=$(date '+%d %B %Y %H:%M:%S')  # Current date and time
DISTRO=$(lsb_release -d | cut -f2)  # Linux distribution name
OS_LICENSE="GPL v2 (Linux Kernel)"  # License of the underlying OS

# --- Display the report ---
echo "=============================================="
echo "       Open Source Software Audit            "
echo "=============================================="
echo "Student   : $STUDENT_NAME"
echo "Software  : $SOFTWARE_CHOICE"
echo "----------------------------------------------"
echo "Distro    : $DISTRO"
echo "Kernel    : $KERNEL"
echo "User      : $USER_NAME"
echo "Home Dir  : $HOME_DIR"
echo "Uptime    : $UPTIME"
echo "Date/Time : $CURRENT_DATE"
echo "----------------------------------------------"
echo "The OS running this system is licensed under:"
echo "$OS_LICENSE"
echo "This means you have the freedom to study, modify,"
echo "and redistribute this operating system."
echo "=============================================="
