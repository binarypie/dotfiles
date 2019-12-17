#!/bin/sh
ln -s $DOTFILES/gnome/themes $HOME/.themes
ln -s $DOTFILES/gnome/icons $HOME/.local/share/icons
gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
gsettings set org.gnome.desktop.wm.preferences theme "Nordic"
