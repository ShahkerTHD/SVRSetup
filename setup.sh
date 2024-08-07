#!/bin/bash

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# ASCII Art Header
echo -e "${BLUE}======================================"
echo "  ____            _    _   _____  _  "
echo " / ___| ___ _ __| | _| |_| ____|| | "
echo " \___ \ / _ \ '__| |/ / __|  _| | | "
echo "  ___) |  __/ |  |   <| |_| |___| | "
echo " |____/ \___|_|  |_|\_\\__|_____|_| "
echo -e "======================================${NC}"

# Update and upgrade the system
echo -e "${YELLOW}Updating and upgrading the system...${NC}"
sudo apt update
sudo apt upgrade -y
echo -e "${GREEN}System update and upgrade complete.${NC}"

# Install Neofetch and run it
echo -e "${YELLOW}Installing Neofetch...${NC}"
sudo apt install -y neofetch
echo -e "${GREEN}Running Neofetch...${NC}"
neofetch

# Install htop
echo -e "${YELLOW}Installing htop...${NC}"
sudo apt install -y htop
echo -e "${GREEN}htop installation complete.${NC}"

# Install and configure UFW
echo -e "${YELLOW}Installing UFW (Uncomplicated Firewall)...${NC}"
sudo apt install -y ufw
echo -e "${GREEN}UFW installation complete.${NC}"

# Prompt the user for the IP address to allow
read -p "Enter the IP address to allow through UFW: " ip_address
echo -e "${YELLOW}Allowing IP address $ip_address through UFW...${NC}"
sudo ufw allow from "$ip_address"
echo -e "${GREEN}IP address $ip_address allowed.${NC}"

# Clone the Fan SHIM repository and install
echo -e "${YELLOW}Cloning the Fan SHIM repository...${NC}"
git clone https://github.com/pimoroni/fanshim-python
cd fanshim-python
echo -e "${YELLOW}Installing Fan SHIM...${NC}"
sudo ./install.sh
cd examples
echo -e "${YELLOW}Setting up Fan SHIM service...${NC}"
sudo ./install-service.sh --on-threshold 65 --off-threshold 55 --delay 2
cd ../..
echo -e "${GREEN}Fan SHIM setup complete.${NC}"

# Install CasaOS
echo -e "${YELLOW}Installing CasaOS...${NC}"
curl -fsSL https://get.casaos.io | sudo bash
echo -e "${GREEN}CasaOS installation complete.${NC}"

# Install Firefox
echo -e "${YELLOW}Installing Firefox...${NC}"
sudo apt install -y firefox
echo -e "${GREEN}Firefox installation complete.${NC}"

# Install Visual Studio Code
echo -e "${YELLOW}Installing Visual Studio Code...${NC}"
sudo apt install -y code
echo -e "${GREEN}Visual Studio Code installation complete.${NC}"

# Remove the local repository directory
echo -e "${YELLOW}Removing the SVRSETUP directory...${NC}"
rm -rf SVRSETUP
echo -e "${GREEN}SVRSETUP directory removed.${NC}"

echo -e "${BLUE}======================================"
echo "     Script execution complete!       "
echo -e "======================================${NC}"
