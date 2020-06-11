#!/bin/sh

cd ~/.vimbuild/vim
git pull
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --enable-python3interp=yes \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            #--with-python-config-dir=/usr/lib/python2.7/config \
            #--with-python3-config-dir=/usr/lib/python3.5/config \
            #--enable-gui=gtk2 \
            #--enable-cscope \
            --prefix=/usr/local
make

# Add something like this to the .bashrc
#export VIMRUNTIME="~/.vimbuild/vim/runtime"                                                              
#alias vim='~/.vimbuild/vim/src/vim
