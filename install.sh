#!/usr/bin/env bash
set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}NixOS Configuration Setup Script${NC}"
echo -e "${BLUE}=================================${NC}"

# Step 1: Check if running on NixOS
if [ ! -f /etc/nixos/configuration.nix ]; then
    echo "Error: This script must be run on NixOS with /etc/nixos/configuration.nix present."
    exit 1
fi

# Step 2: Add git and enable flakes in configuration.nix
echo -e "\n${GREEN}Updating configuration.nix to add git and enable flakes...${NC}"
sudo cp /etc/nixos/configuration.nix /etc/nixos/configuration.nix.backup
sudo sed -i '/environment.systemPackages = with pkgs; \[/a \    git' /etc/nixos/configuration.nix
sudo sed -i '/^}/i \  nix.settings.experimental-features = [ "nix-command" "flakes" ];' /etc/nixos/configuration.nix

# Step 3: Apply the changes
echo -e "\n${GREEN}Applying changes with nixos-rebuild switch...${NC}"
sudo nixos-rebuild switch

# Step 4: Clone the dotfiles repository
echo -e "\n${GREEN}Cloning dotfiles repository...${NC}"
cd ~
if [ -d ".dotfiles" ]; then
    echo ".dotfiles directory already exists. Skipping clone."
else
    git clone https://github.com/gusjengis/.dotfiles.git
    cd .dotfiles
fi

# Step 5: Add home-manager channel
echo -e "\n${GREEN}Adding home-manager channel...${NC}"
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
nix-channel --update

# Step 6: Apply the flake configuration
echo -e "\n${GREEN}Applying flake configuration...${NC}"
cd ~/.dotfiles
sudo nixos-rebuild switch --flake .

# Step 7: Fix flake.lock permissions
echo -e "\n${GREEN}Fixing flake.lock permissions...${NC}"
sudo chown $(whoami) flake.lock
sudo chgrp users flake.lock

# Step 8: Apply home-manager configuration
echo -e "\n${GREEN}Applying home-manager configuration...${NC}"
home-manager switch --flake .

# Step 9: Clone Neovim configuration
echo -e "\n${GREEN}Cloning Neovim configuration...${NC}"
cd ~/.config
if [ -d "nvim" ]; then
    echo "nvim directory already exists. Skipping clone."
else
    git clone https://github.com/gusjengis/nvim.git
fi

echo -e "\n${GREEN}Installation complete!${NC}"
echo -e "${GREEN}Please reboot your system to apply all changes.${NC}"
echo -e "${BLUE}Run: sudo reboot${NC}"
