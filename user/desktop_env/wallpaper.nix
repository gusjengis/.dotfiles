{ config, pkgs, ... }:

{
  programs.hyprpaper = {
    enable = true;
    extraConfig = ''
      $path = ~/Pictures/Wallpapers/wp_01.jpg

      preload = $path
      wallpaper = , $path
    '';
  };
}
