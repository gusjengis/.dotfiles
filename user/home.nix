{ config, pkgs, ... }:
{

  imports = [
    ./desktop_env/mod.nix
    ./programs/browser.nix
    ~/.dotfiles/user/secrets.nix
  ];

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
    ANTHROPIC_API_KEY = config.secrets.anthropicApiKey;
  };

  nixpkgs.config.allowUnfree = true;
}
