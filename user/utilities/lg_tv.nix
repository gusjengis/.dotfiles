{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    inputs.alga.packages."x86_64-linux".default
  ];
}
