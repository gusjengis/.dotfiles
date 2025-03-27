#!/usr/bin/env bash
set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}NixOS Configuration Setup Script${NC}"
echo -e "${BLUE}=================================${NC}"

# Check if running on NixOS
if [ ! -f /etc/nixos/configuration.nix ]; then
    echo "Error: This script must be run on NixOS with /etc/nixos/configuration.nix present."
    exit 1
fi

# Add git and enable flakes in configuration.nix
echo -e "\n${GREEN}Updating configuration.nix to add git and enable flakes...${NC}"
sudo cp /etc/nixos/configuration.nix /etc/nixos/configuration.nix.backup
sudo sed -i '/environment.systemPackages = with pkgs; \[/a \    git' /etc/nixos/configuration.nix
sudo sed -i '/^}/i \  nix.settings.experimental-features = [ "nix-command" "flakes" ];' /etc/nixos/configuration.nix

# Apply the changes
echo -e "\n${GREEN}Applying changes with nixos-rebuild switch...${NC}"
sudo nixos-rebuild switch

# Clone the dotfiles repository
echo -e "\n${GREEN}Cloning dotfiles repository...${NC}"
cd ~
if [ -d ".dotfiles" ]; then
    echo ".dotfiles directory already exists. Skipping clone."
else
    git clone https://github.com/gusjengis/.dotfiles.git
    cd .dotfiles
fi

# Apply the flake configuration
echo -e "\n${GREEN}Applying flake configuration...${NC}"
cd ~/.dotfiles
sudo nixos-rebuild switch --impure --flake . && reboot
