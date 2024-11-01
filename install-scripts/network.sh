#!/bin/bash
# Network #

# These fonts are minimun required for pre-configured dots to work. You can add here as required
# WARNING! If you remove packages here, dotfiles may not work properly.
# and also, ensure that packages are present in AUR and official Arch Repo

network=(
    b43-fwcutter 
    broadcom-wl-dkms 
    dnsmasq 
    dnsutils 
    ethtool 
    iwd 
    modemmanager 
    networkmanager-openconnect 
    networkmanager-openvpn 
    nss-mdns 
    openssh 
    usb_modeswitch 
    wpa_supplicant 
    xl2tpd
)


## WARNING: DO NOT EDIT BEYOND THIS LINE IF YOU DON'T KNOW WHAT YOU ARE DOING! ##
# Determine the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change the working directory to the parent directory of the script
PARENT_DIR="$SCRIPT_DIR/.."
cd "$PARENT_DIR" || exit 1

source "$(dirname "$(readlink -f "$0")")/Global_functions.sh"

# Set the name of the log file to include the current date and time
LOG="Install-Logs/install-$(date +%d-%H%M%S)_network.log"


# Installation of main components
printf "\n%s - Installing network packages .... \n" "${NOTE}"

for PKG1 in "${network[@]}"; do
  install_package "$PKG1" 2>&1 | tee -a "$LOG"
  if [ $? -ne 0 ]; then
    echo -e "\e[1A\e[K${ERROR} - $PKG1 Package installation failed, Please check the installation logs"
    exit 1
  fi
done

clear

