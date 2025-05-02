{ config, pkgs, ... }:

{
  imports = [
    ./browser.nix
    ./circuit_design.nix
    ./development.nix
    ./email_client.nix
    ./file_explorer.nix
    ./game_dev.nix
    ./image_editing.nix
    ./messaging.nix
    ./music.nix
    ./notes.nix
    ./recording.nix
    ./terminal.nix
  ];
}
