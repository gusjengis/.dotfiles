{ config, pkgs, ... }:

{
  imports = [
    ./browser.nix
    ./terminal.nix
  ];
}
