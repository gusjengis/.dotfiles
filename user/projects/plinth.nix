{ config, pkgs, lib, ... }:

{
  home.activation.clonePlinth = lib.hm.dag.entryAfter [ "createDocumentsDirs" ] ''
    ${config.home.homeDirectory}/.dotfiles/user/projects/plinth.sh
  '';
}
