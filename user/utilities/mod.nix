{ config, pkgs, ... }:

{
  imports = [ ./bluetooth.nix ./git.nix ./screenshots.nix ./audio.nix ];
}
