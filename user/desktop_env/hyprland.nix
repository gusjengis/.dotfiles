{ config, pkgs, ... }:

{
  home.file.".config/hypr/hyprland.conf".source = ../config_files/hypr/hyprland.conf;
}
