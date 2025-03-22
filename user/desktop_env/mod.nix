{ config, pkgs, ... }:

{
  import = [
    ./hyprland.nix
    ./cursor.nix
    ./wallpaper.nix
    ./screenshots.nix
  ];
}
