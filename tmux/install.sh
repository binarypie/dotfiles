#!/bin/zsh

VERSION=3.0a
echo "TMUX"
if [ -d $DOTFILES/tmux/tmux-$VERSION ]; then
	echo "Already up to date."
else
	echo "Requires: wget tar libevent-dev libncurses-dev"
	wget https://github.com/tmux/tmux/releases/download/$VERSION/tmux-$VERSION.tar.gz
	tar xf tmux-$VERSION.tar.gz
	rm -f tmux-$VERSION.tar.gz
	cd tmux-$VERSION
	./configure
	make
	sudo make install
fi

echo "TMUX TPM"
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
	cd $HOME/.tmux/plugins/tpm
	git pull
else
	git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi
