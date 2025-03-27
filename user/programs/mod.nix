{ config, pkgs, ... }:

{
  imports = [
    ./browser.nix
    ./email_client.nix
    ./terminal.nix
  ];
}
