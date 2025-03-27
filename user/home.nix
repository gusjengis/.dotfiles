{ config, pkgs, ... }:
{
  programs.home-manager.enable = true;

  imports = [
    ./desktop_env/mod.nix
    ./programs/mod.nix
    ./utilities/mod.nix
    ~/.dotfiles/user/secrets.nix
  ];

  home.username = "gusjengis";
  home.homeDirectory = "/home/gusjengis";

  home.stateVersion = "24.11";

  programs.git = {
    enable = true;
    userName = "gusjengis";
    userEmail = "anthony.j.green@outlook.com";
    extraConfig = {
      credential.helper = "store";
    };
  };



  home.sessionVariables = {
    LD_LIBRARY_PATH = /run/opengl-driver/lib;
    ANTHROPIC_API_KEY = config.secrets.anthropicApiKey;
  };

  nixpkgs.config.allowUnfree = true;
}
