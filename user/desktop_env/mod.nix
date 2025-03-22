{ config, pkgs, ... }:

{
  imports = [
    ./hypr.nix
    ./cursor.nix
    ./wallpaper.nix
  ];
}
