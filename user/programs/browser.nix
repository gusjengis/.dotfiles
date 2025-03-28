{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--ozone-platform=x11"
      "--enable-unsafe-webgpu"
      "--enable-features=Vulkan"
      "--enable-features=WebContentsForceDark"
    ];
    extensions = [
      "iobmefdldoplhmonnnkchglfdeepnfhd"
      "eimadpbcbfnmbkopoojfekhnkhdbieeh"
    ];
  };
}
