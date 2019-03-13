# .dotfiles
The following a collection of my personal .dotfiles. Feel free to fork and modify to your delight.

### Install
(optional) Fork [binarypie/dotfiles](/binarypie/dotfiles) to your own repoistory.
```shell
# Make sure to edit the repository path if you've forked.
git clone git@github.com:binarypie/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
./scripts/install
./scripts/symlink
```

(optional) If you forked and want to track my changes
```shell
git remote add upstream git@github.com:binarypie/dotfiles.git
```

### Update
```shell
cd $HOME/.dotfiles
git pull
./scripts/install
./scripts/symlink
```
(optional) If you forked and want my changes.
```shell
cd $HOME/.dotfiles
git pull upstream
./scripts/install
./scripts/symlink
```

### Uusage
Modify and pull upstream when you want my changes.
