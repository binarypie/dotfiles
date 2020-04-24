# install Language Servers
  $ npm install -g vscode-html-languageserver-bin
  $ npm install -g vscode-css-languageserver-bin
  $ GO111MODULE=on go get golang.org/x/tools/gopls@lates
  $ npm install -g typescript typescript-language-server


# install libjansson first
  $ sudo apt install \
    gcc make \
    pkg-config autoconf automake \
    python3-docutils \
    libseccomp-dev \
    libjansson-dev \
    libyaml-dev \
    libxml2-dev \
    libjansson-dev

  # then compile and install universal-ctags.
  #
  # NOTE: Don't use `sudo apt install ctags`, which will install exuberant-ctags and it's not guaranteed to work with vista.vim.
  #
  $ git clone https://github.com/universal-ctags/ctags.git --depth=1
  $ cd ctags
  $ ./autogen.sh
  $ ./configure
  $ make
  $ sudo make install
