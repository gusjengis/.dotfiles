{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./status_bar.nix
    ./cursor.nix
    ./wallpaper.nix
    ./app_launcher.nix
    ./theme.nix
  ];
}
