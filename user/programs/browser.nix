{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--ozone-platform=x11"
    ];
  };
}
