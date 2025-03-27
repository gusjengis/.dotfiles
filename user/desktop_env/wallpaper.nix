{ config, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".source = ../config_files/hypr/hyprpaper.conf;
}
