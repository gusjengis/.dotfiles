{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--ozone-platform=wayland"
      "--enable-features=Vulkan"
    ];
  };
}
