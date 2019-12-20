#!/bin/sh

# Email / Nameo
read -r -p "Enter Your Git Name: "  name
read -r -p "Enter Your Git Email: "  email
git config --global user.name "$name"
git config --global user.email "$email"

# Don't ask ssh password all the time
if [ "$(uname -s)" = "Darwin" ]; then
	git config --global credential.helper osxkeychain
else
	git config --global credential.helper cache
fi

# better diffs
if which diff-so-fancy >/dev/null 2>&1; then
	git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
fi

# use vim as mergetool
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false

# Templates
git config --global commit.template ~/.dotfiles/git/template.txt
