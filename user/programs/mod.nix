{ config, pkgs, ... }:

{
  imports = [
    ./browser.nix
    ./development.nix
    ./email_client.nix
    ./file_explorer.nix
    ./game_dev.nix
    ./image_editing.nix
    ./messaging.nix
    ./music.nix
    ./notes.nix
    ./terminal.nix
  ];
}
