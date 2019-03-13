#!/bin/zsh
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
	cd $HOME/.tmux/plugins/tpm
	git pull
else
	git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi
