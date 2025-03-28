# Add home-manager channel
echo -e "\n${GREEN}Adding home-manager channel...${NC}"
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
nix-channel --update

# Fix flake.lock permissions
echo -e "\n${GREEN}Fixing flake.lock permissions...${NC}"
sudo chown $(whoami) flake.lock
sudo chgrp users flake.lock

# Install home-manager 
echo -e "\n${GREEN}Installing home-manager...${NC}"
nix-shell '<home-manager>' -A install

# Apply home-manager configuration
echo -e "\n${GREEN}Applying home-manager configuration...${NC}"
cd ~/.dotfiles
home-manager switch --impure --flake . && reboot
