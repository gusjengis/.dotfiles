{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
  ];

  home.file.".config/hypr/hyprpaper.conf".source = ../config_files/hypr/hyprpaper.conf;
}
