# NixOS Config

I'm following [this](https://www.youtube.com/watch?v=6WLaNIlDW0M&list=PL_WcXIXdDWWpuypAEKzZF2b5PijTluxRG) playlist by LibrePhoenix to configure my NixOS setup.

## Installation
1. Install NixOS with a flash drive. [Guide](https://nixos.wiki/wiki/NixOS_Installation_Guide)
2. curl -LO https://github.com/gusjengis/.dotfiles/blob/master/install.sh
3. chmod +x install.sh
4. ./install.sh
5. curl -LO https://github.com/gusjengis/.dotfiles/blob/master/home-manager.sh
6. chmod +x home-manager.sh
7. ./home-manager.sh

Each .sh file should trigger a reboot, once they've both run everything should be installed.
After that use gh auth login to setup git credentials, and add secret keys back to ~/.dotfiles/user/secrets.nix

