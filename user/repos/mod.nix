{ config, pkgs, ... }:

{
  imports = [
    ./mosaic.nix
    ./plinth.nix
    ./misc.nix
  ];
}
