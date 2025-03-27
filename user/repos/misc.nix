{ config, pkgs, lib, ... }:

{
  home.activation.cloneMosaic = lib.hm.dag.entryAfter [ "createDocumentDirs" ] ''
    export PATH="${config.home.profileDirectory}/bin:$PATH"
    
    clone_repo() {
    	local repo_url="$1"
    	local repo_name

    	repo_name=$(basename -s .git "$repo_url")

    	if [ ! -d "$repo_name" ]; then
    	  git clone "$repo_url"
    	fi
    }

    cd ~/Documents/Code/

    clone_repo https://github.com/gusjengis/neovim-project.git
  '';
}
