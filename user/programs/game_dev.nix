{ config, pkgs, ... }:

# let
#   unityhub-fhs = pkgs.buildFHSUserEnv {
#     name = "unityhub-fhs";
#     targetPkgs = pkgs: with pkgs; [
#       glibc
#       mesa
#       xorg.libX11
#       xorg.libXcursor
#       xorg.libXrandr
#       xorg.libXrender
#       xorg.libXtst
#       xorg.libXi
#       nss
#       alsa-lib
#       pulseaudio
#       xdg-utils
#       gtk3
#       openjdk
#       libsecret
#     ];
#     runScript = "${pkgs.bash}/bin/bash -c 'export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8; export XDG_SESSION_TYPE=x11; export XDG_CURRENT_DESKTOP=GNOME; export DBUS_SESSION_BUS_ADDRESS=${builtins.getEnv "DBUS_SESSION_BUS_ADDRESS"}; exec ${pkgs.unityhub}/bin/unityhub'";
#   };
# in
{
  # home.packages = [
  #   unityhub-fhs
  # ];

  # home.shellAliases = {
  #   unityhub = "unityhub-fhs";
  # };
}
