# NixOS Config

I'm following [this](https://www.youtube.com/watch?v=6WLaNIlDW0M&list=PL_WcXIXdDWWpuypAEKzZF2b5PijTluxRG) playlist by LibrePhoenix to configure my NixOS setup.

## Installation
1. Install NixOS with a flash drive. [Guide](https://nixos.wiki/wiki/NixOS_Installation_Guide)
2. Open /etc/nixos/configuration.nix using nano 
3. Add git to environment.systemPackages
4. Add the line nix.settings.experimental-features = [ "nix-command" "flakes" ];
5. Run sudo nixos-rebuild switch
6. cd ~
7. git clone https://github.com/gusjengis/.dotfiles.git
8. cd .dotfiles
9. nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
10. nix-channel --update
11. sudo nixos-rebuild switch --flake .

Just reboot and everything should be installed.

Can I turn this into a script? Hmm...
