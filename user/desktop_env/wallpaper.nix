{ config, pkgs, ... }:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/.dotfiles/user/desktop_env/wallpapers/wp_00.jpg
    wallpaper = ,~/.dotfiles/user/desktop_env/wallpapers/wp_00.jpg
  '';
}
