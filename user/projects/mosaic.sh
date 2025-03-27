#!/usr/bin/env bash

clone_repo() {
	local repo_url="$1"
	local repo_name

	repo_name=$(basename -s .git "$repo_url")

	if [ ! -d "$repo_name" ]; then
	  git clone "$repo_url"
	fi
}

cd ~/Documents/Code/

clone_repo https://github.com/gusjengis/Mosaic-Backend.git
clone_repo https://github.com/gusjengis/Mosaic-Model.git
clone_repo https://github.com/gusjengis/Mosaic-Hub.git
clone_repo https://github.com/gusjengis/Mosaic-Android.git
