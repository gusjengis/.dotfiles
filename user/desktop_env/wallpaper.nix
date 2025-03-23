{ config, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/Pictures/Wallpapers/wp_00.jpg
    wallpaper = ,~/Pictures/Wallpapers/wp_00.jpg
  '';

}
