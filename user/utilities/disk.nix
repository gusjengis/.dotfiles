{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ 
    diskonaut 
    dust
  ];
}
