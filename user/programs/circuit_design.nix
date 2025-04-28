{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
#    kicad
#    ngspice # might work, just don't need it singce kicad doesn't
  ];
}
