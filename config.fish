# Make a symbolic link to this file from ~/.config/fish/config.fish

# VIM  Set enviromental variable 
set -g -x VIMRUNTIME "$HOME/.vimbuild/vim/runtime"
# VIM  Set alias
alias vim "$HOME/.vimbuild/vim/src/vim -p"

# Anaconda python installation
source $HOME/anaconda3/etc/fish/conf.d/conda.fish

# User specific aliases and functions
alias ccat   "pygmentize -g" # Color highlighting cat function,  requires pygmentize python program
alias mv     "mv -i"
alias cp     "cp -i"
alias rm     "rm -i"
alias bc     "bc -l"
alias ll     "ls -lrth"
alias llz    "ls -lrSh"
alias grep   'grep --exclude-dir=".git" --exclude="*.pyc" --color=auto'
alias sshdyn "ssh tjansson@tjansson.dyndns.dk -XC -p 443" # port 443 avoids firewalls
alias pylab  "echo 'Remember bpython'; ipython --pylab"
