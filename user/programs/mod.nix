{ config, pkgs, ... }:

{
  imports = [
    ./browser.nix
    ./email_client.nix
    ./image_editing.nix
    ./messaging.nix
    ./music.nix
    ./terminal.nix
  ];
}
