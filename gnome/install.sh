#!/bin/sh
ln -s $HOME/.themes/Nordic $DOTFILES/gnome/themes/Nordic
ln -s $HOME/.local/share/icons/Zafiro-icons $DOTFILES/gnome/icons/Zafiro-icons
gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
gsettings set org.gnome.desktop.wm.preferences theme "Nordic"
