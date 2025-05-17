{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "Meslo Nerd Font";
      size = 8;
    };
    themeFile = "GitHub_Dark";
    extraConfig = ''
      enable_audio_bell no
      background_opacity 1.0
      scrollback_lines 10000
      cursor_shape block
    '';
  };

  programs.bash = {
    enable = true;
    initExtra = "";
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --impure --flake ~/.dotfiles";
      rehome = "home-manager switch --impure --flake ~/.dotfiles";
    };
  };
}
