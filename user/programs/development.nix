{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    postman
    docker
    blender
    jetbrains.rider
  ];
}
