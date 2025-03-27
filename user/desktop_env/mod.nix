{ config, pkgs, ... }:

{
  imports = [
    ./hypr.nix
    ./cursor.nix
    ./wallpaper.nix
    ./app_launcher.nix
  ];
}
