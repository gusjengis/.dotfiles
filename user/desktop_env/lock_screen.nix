{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ hyprlock ];
}
