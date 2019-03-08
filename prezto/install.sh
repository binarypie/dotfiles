#!/bin/zsh
if [ -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
	echo "Prezto already installed."
else
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi
