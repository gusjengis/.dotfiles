{ config, pkgs, ... }:

{
  home.username = "gusjengis";
  home.homeDirectory = "/home/gusjengis";

  home.stateVersion = "24.11";

  home.packages = [
  ];

  home.file = { };

  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  programs.git = {
    enable = true;
    userName = "gusjengis";
    userEmail = "anthony.j.green@outlook.com";
    extraConfig = {
      credential.helper = "store";
    };
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "Meslo Nerd Font";
      size = 12;
    };
    themeFile = "GitHub_Dark";
    extraConfig = ''
      enable_audio_bell no
      background_opacity 0.6
      scrollback_lines 10000
      cursor_shape block
    '';
  };


  programs.bash = {
    enable = true;
    initExtra = ''
    '';
    shellAliases = {
      nvim = "sudo -E -s nvim";
      rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      rehome = "home-manager switch --flake ~/.dotfiles";
    };
  };

  programs.home-manager.enable = true;


  home.sessionVariables = {
    LD_LIBRARY_PATH = /run/opengl-driver/lib;
  };
}
