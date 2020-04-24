curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
mkdir -p ~/.local/bin
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
sed -i "s/Icon\=kitty/Icon\=\/home\/$USER\/.local\/kitty.app\/share\/icons\/hicolor\/256x256\/apps\/kitty.png/g" ~/.local/share/applications/kitty.desktop
