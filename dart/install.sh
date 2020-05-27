#!/bin/zsh
set -e

# Dart
#sudo apt-get update
#sudo apt-get install apt-transport-https
#sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
#sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
#sudo apt-get update
#sudo apt-get install dart

# Flutter
curl -O https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_1.17.1-stable.tar.xz
tar -C $PROJECTS -xf flutter_linux_1.17.1-stable.tar.xz
rm flutter_linux_1.17.1-stable.tar.xz

# Source Path
source path.zsh
