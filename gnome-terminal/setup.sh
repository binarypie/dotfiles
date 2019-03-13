#!/bin/zsh
if [ -d "$HOME/.config/base16-gnome-terminal" ]; then
	cd $HOME/.config/base16-gnome-terminal
	git pull
else
	mkdir -p $HOME/.config/base16-gnome-terminal
	git clone https://github.com/aaron-williamson/base16-gnome-terminal.git $HOME/.config/base16-gnome-terminal
fi

sh $HOME/.config/base16-gnome-terminal/color-scripts/base16-seti-256.sh
