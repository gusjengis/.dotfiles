{ config, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/Pictures/Wallpapers/wp_01.jpg
    wallpaper = ,~/Pictures/Wallpapers/wp_01.jpg
  '';

}
