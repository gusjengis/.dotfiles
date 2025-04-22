{ config, pkgs, ... }:

{
  imports = [
    ./circuits.nix
    ./mosaic.nix
    ./plinth.nix
    ./misc.nix
  ];
}
