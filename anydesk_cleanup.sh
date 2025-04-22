#!/bin/bash

#===============================================================================
# Script Name: anydesk_cleanup.sh
# Author: Mourya
# Version: 1.0.1
# Last Updated: 2025-02-13
# Description: 
#   This script automates the process of removing and reinstalling AnyDesk on macOS, including:
#   - Quitting AnyDesk
#   - Deleting AnyDesk from the Applications folder
#   - Removing AnyDesk configuration files
#   - Downloading and reinstalling the latest version of AnyDesk
#   - Suggesting a logout to refresh AnyDesk for the new ID
#
#   **Note**: This script is under **testing** and may require adjustments. It is advised 
#   to back up important data and test in a controlled environment before using on your machines.
#
# Usage: 
#   Run this script in the terminal on macOS to clean up and reinstall AnyDesk.
#
# Disclaimer:
#   This script is provided "as is" without warranty of any kind, either express or implied,
#   including but not limited to the warranties of merchantability, fitness for a particular purpose,
#   or noninfringement.
#
#   Usage at your own risk: This script modifies your system, such as quitting an 
#   application, removing files, and installing software. Always ensure you have a backup before running.
#
#   File Deletion Warning: The script removes AnyDesk from the **Applications** folder and deletes configuration 
#   files located in the user’s home directory (~/.anydesk). Review and understand the changes before proceeding.
#
#   By using or running this script, you agree to do so at your own risk.
#
#===============================================================================

# Function to check for errors
handle_error() {
    echo "Error: $1"
    exit 1
}

echo "Quitting AnyDesk if running..."
osascript -e 'quit app "AnyDesk"'

# Wait for AnyDesk to close completely
sleep 5

# Remove AnyDesk from Applications
echo "Removing AnyDesk from Applications..."
sudo rm -rf /Applications/AnyDesk.app || handle_error "Failed to remove AnyDesk."

# Remove AnyDesk configuration files
echo "Removing AnyDesk configuration files..."
rm -rf ~/.anydesk || handle_error "Failed to remove AnyDesk config files."

# Download the latest version of AnyDesk
echo "Downloading the latest version of AnyDesk..."
curl -o AnyDesk.dmg https://download.anydesk.com/AnyDesk.dmg || handle_error "Failed to download AnyDesk."

# Verify if the DMG exists
if [[ ! -f "AnyDesk.dmg" ]]; then
    handle_error "Downloaded file AnyDesk.dmg not found."
fi

# Mount the disk image
echo "Mounting AnyDesk DMG..."
hdiutil mount AnyDesk.dmg || handle_error "Failed to mount AnyDesk.dmg."

# Verify if the mounted volume exists
if [[ ! -d "/Volumes/AnyDesk" ]]; then
    handle_error "AnyDesk volume not found."
fi

# Install AnyDesk to /Applications
echo "Installing AnyDesk..."
cp -R /Volumes/AnyDesk/AnyDesk.app /Applications/ || handle_error "Failed to copy AnyDesk.app to /Applications."

# Unmount the disk image
echo "Unmounting the disk image..."
hdiutil unmount /Volumes/AnyDesk || echo "Warning: Failed to unmount AnyDesk DMG."

# Remove the downloaded DMG file
echo "Cleaning up downloaded files..."
rm -f AnyDesk.dmg || echo "Warning: Failed to delete AnyDesk.dmg."

# Launch AnyDesk after installation
echo "Launching AnyDesk..."
open -a "AnyDesk" || handle_error "Failed to launch AnyDesk."

echo "AnyDesk has been successfully reinstalled. You may need to log out and log back in to generate a new ID."

# Exit the script
exit 0
