{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./screenshots.nix
  ];
}
