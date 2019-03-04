#!/bin/sh

# Initial Clone
if ! ([ -d "$HOME/.fzf" ]); then
	cd $HOME
	git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
fi

# Update and Install
cd $HOME/.fzf
git pull
./install --no-update-rc --no-bash --no-fish --completion --key-bindings --64
