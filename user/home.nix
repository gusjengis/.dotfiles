{ config, pkgs, lib, ... }: 
{
  programs.home-manager.enable = true;

  imports = [
    ./desktop_env/mod.nix
    ./programs/mod.nix
    ./utilities/mod.nix
    ./directories/mod.nix
    ./repos/mod.nix
    ./nvim/mod.nix
    ~/.dotfiles/user/secrets.nix
  ];

  home.username = "gusjengis";
  home.homeDirectory = "/home/gusjengis";

  services.flatpak = {
    enable = true;

    # ── 1. remotes  ────────────────────────────────────────────────
    remotes = [
      {
        name     = "flathub";
        location = "https://flathub.org/repo/flathub.flatpakrepo";
      }
    ];

    # ── 2. packages you want installed for THIS user ───────────────
    # You can prefix each ID with the remote, or omit it because
    # there’s just one remote in the list.
    packages = [
      "com.unity.UnityHub"
      # "com.useful.OtherApp"  ← also fine
    ];

  };

  # One-shot filesystem grant so Hub can see your project tree
  home.activation.unityHubFsAccess = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.flatpak}/bin/flatpak override --user \
      --filesystem=$HOME/Projects \
      com.unity.UnityHub
  '';

  nixpkgs.overlays = [ (import ./overlays/plastic.nix) ];

  home.packages = [
    pkgs.plasticscm-gui
    (pkgs.writeShellScriptBin "unityhub" ''
      #!/usr/bin/env bash
      exec flatpak run com.unity.UnityHub "$@"
    '')
  ];

  home.stateVersion = "24.11";

  programs.git = {
    enable = true;
    userName = "gusjengis";
    userEmail = "anthony.j.green@outlook.com";
    extraConfig = { credential.helper = "store"; };
  };

  home.sessionVariables = {
    LD_LIBRARY_PATH = /run/opengl-driver/lib;
    ANTHROPIC_API_KEY = config.secrets.anthropicApiKey;
  };

  nixpkgs.config.allowUnfree = true;
}
