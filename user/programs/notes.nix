{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [ obsidian ];

  # # Get main vault
  # home.activation.cloneVaults = lib.hm.dag.entryAfter [ "createDocumentsDirs" ] ''
  #   export PATH="${config.home.profileDirectory}/bin:$PATH"
  #
  #   clone_repo() {
  #   	local repo_url="$1"
  #   	local repo_name
  #
  #   	repo_name=$(basename -s .git "$repo_url")
  #
  # 	if [ ! -d "$repo_name" ]; then
  # 	  git clone "$repo_url"
  # 	fi
  # }
  #
  #   cd ~/Documents/Obsidian/
  #
  #   clone_repo https://github.com/gusjengis/The-Vault.git
  # '';

}
