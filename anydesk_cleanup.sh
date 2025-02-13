#!/bin/bash

#===============================================================================
# Script Name: anydesk_cleanup.sh
# Author: Mourya
# Version: 1.0.0
# Last Updated: 2025-02-13
# Description: 
#   This script automates the process of removing AnyDesk from macOS, including:
#   - Quitting AnyDesk
#   - Deleting AnyDesk from the Applications folder
#   - Removing AnyDesk configuration files
#   - Generating a new AnyDesk ID after reinstall
#   - Suggesting a logout to refresh AnyDesk for the new ID
#   
#   This script is designed to generate a new AnyDesk ID for the user. After removing 
#   AnyDesk and clearing its configuration, the user will need to reinstall AnyDesk 
#   manually to obtain a new ID.
#
#   **Note**: This script is under **testing** and may require adjustments. It is advised 
#   to back up important data and test in a controlled environment before using on your machines.
#
# Usage: 
#   Run this script in the terminal on macOS to clean up AnyDesk installation and generate a new ID.
#
# Disclaimer:
#   This script is provided "as is" without warranty of any kind, either express or implied,
#   including but not limited to the warranties of merchantability, fitness for a particular purpose,
#   or noninfringement.
#
#   Usage at your own risk: This script performs actions that modify your system, such as quitting an 
#   application, removing files, and deleting configuration data. Always ensure you have a backup of 
#   important data before running the script.
#
#   Reinstallation: This script does not automatically reinstall AnyDesk. Users must download and install 
#   AnyDesk manually after running the script. Ensure you download AnyDesk from the official website 
#   (https://anydesk.com/en/downloads) to avoid potential security risks.
#
#   File Deletion Warning: The script removes AnyDesk from the **Applications** folder and deletes configuration 
#   files located in the user’s home directory (~/.anydesk). Be sure to review and understand the changes being 
#   made to your system.
#
#   No Responsibility: The author of this script is not responsible for any data loss, system malfunctions, 
#   or issues caused by the use of this script. You should understand the implications of running this script 
#   before proceeding.
#
#   By using or running this script, you agree to do so at your own risk.
#
#===============================================================================

# Quit AnyDesk if it's running
osascript -e 'quit app "AnyDesk"'

# Wait for AnyDesk to quit (optional, can be adjusted)
sleep 2

# Remove AnyDesk from Applications
sudo rm -rf /Applications/AnyDesk.app

# Remove AnyDesk configuration files
rm -rf ~/.anydesk

# Prompt user to reinstall AnyDesk manually
echo "AnyDesk has been removed. Please reinstall it from https://anydesk.com/en/downloads"

# Optional: logout message to remind the user to logout
echo "To refresh AnyDesk and generate a new ID, please log out and log back in."
echo "You can do this manually or restart your Mac."

# Exit script
exit 0
