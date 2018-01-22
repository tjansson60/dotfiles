#!/bin/sh

sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev liblua5.1 lua5.1-dev libperl-dev git

cd ~
mkdir .vimbuild
cd .vimbuild
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            #--with-python-config-dir=/usr/lib/python2.7/config \
            #--enable-python3interp=yes \
            #--with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            #--enable-gui=gtk2 \
            #--enable-cscope \
            --prefix=/usr/local
make

# Add something like this to the .bashrc
#export VIMRUNTIME="~/.vimbuild/vim/runtime"                                                              
#alias vim='~/.vimbuild/vim/src/vim
