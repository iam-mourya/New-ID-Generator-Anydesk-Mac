# New-ID-Generator-Anydesk-Mac

What this script does:

Quits AnyDesk (if running).
Removes AnyDesk from the Applications folder.
Deletes configuration files located in ~/.anydesk.
Prompts you to reinstall AnyDesk and suggests logging out for changes to take effect.

Important Notes:

1. Reinstallation: This script will not automatically reinstall AnyDesk as downloading the installer requires user interaction. However, it will guide you through the steps.

2. Making the script executable: In your Terminal, run the following command to make the script executable: chmod +x anydesk_cleanup.sh


AnyDesk Cleanup Script
This script helps automate the removal and reinstallation of AnyDesk on macOS, with the main goal of generating a new AnyDesk ID.


<span style="font-size: 1.5em; font-weight: bold;">Disclaimer:</span>

1. This script is provided "as is" without warranty of any kind, either express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose, or noninfringement.

2. Usage at your own risk: This script performs actions that modify your system, such as quitting an application, removing files, and deleting configuration data. Always ensure you have a backup of important data before running the script.

3. Reinstallation: This script does not automatically reinstall AnyDesk. Users must download and install AnyDesk manually after running the script. Ensure you download AnyDesk from the official website (https://anydesk.com/en/downloads) to avoid potential security risks.

4. File Deletion Warning: The script removes AnyDesk from the Applications folder and deletes configuration files located in the user’s home directory (~/.anydesk). Be sure to review and understand the changes being made to your system.

5. No Responsibility: The author of this script is not responsible for any data loss, system malfunctions, or issues caused by the use of this script. You should understand the implications of running this script before proceeding.

By using or running this script, you agree to do so at your own risk.
