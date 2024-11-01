#!/bin/bash
# Gnome apps #

# These fonts are minimun required for pre-configured dots to work. You can add here as required
# WARNING! If you remove packages here, dotfiles may not work properly.
# and also, ensure that packages are present in AUR and official Arch Repo

gnome=(
    adwaita-icon-theme 
    eog 
    evince 
    file-roller 
    gnome-claculator 
    gnome-clocks 
    gnome-disk-utility 
    gnome-system-monitor 
    gnome-text-editor 
    gnome-themes-extra 
    gvfs 
    nautilus 
)


## WARNING: DO NOT EDIT BEYOND THIS LINE IF YOU DON'T KNOW WHAT YOU ARE DOING! ##
# Determine the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change the working directory to the parent directory of the script
PARENT_DIR="$SCRIPT_DIR/.."
cd "$PARENT_DIR" || exit 1

source "$(dirname "$(readlink -f "$0")")/Global_functions.sh"

# Set the name of the log file to include the current date and time
LOG="Install-Logs/install-$(date +%d-%H%M%S)_gnome_apps.log"


# Installation of main components
printf "\n%s - Installing gnome apps.... \n" "${NOTE}"

for PKG1 in "${gnome[@]}"; do
  install_package "$PKG1" 2>&1 | tee -a "$LOG"
  if [ $? -ne 0 ]; then
    echo -e "\e[1A\e[K${ERROR} - $PKG1 Package installation failed, Please check the installation logs"
    exit 1
  fi
done

clear

