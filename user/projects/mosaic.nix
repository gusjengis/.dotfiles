{ config, pkgs, lib, ... }:

{
  home.activation.cloneMosaic = lib.hm.dag.entryAfter [ "createDocumentDirs" ] ''
    ${config.home.homeDirectory}/.dotfiles/user/projects/mosaic.sh
  '';
}
