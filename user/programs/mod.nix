{ config, pkgs, ... }:

{
  imports = [
    ./browser.nix
    ./development.nix
    ./email_client.nix
    ./game_dev.nix
    ./image_editing.nix
    ./messaging.nix
    ./music.nix
    ./notes.nix
    ./terminal.nix
  ];
}
