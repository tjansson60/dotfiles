# Thomas Jansson
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Export some options
shopt -s histappend histreedit histverify
shopt -s globstar #If set, the pattern ** used in a pathname expansion context will match all files and zero or more directories and subdirectories
shopt -s checkwinsize # Check the window size after each command, and update LINES and COLUMNS if the size has changed.
export HISTFILESIZE=5000 # the bash history should save 3000 commands
export HISTCONTROL=ignoredups #don't put duplicate lines in the history.
export HISTIGNORE="&:ls:cd:bg:fg:ll" # ignore these commands in history


# Shell and prompt configuration
export GS_OPTIONS="-sPAPERSIZE=a4"
export FIGNORE=".svn:.git" # $FIGNORE is just a colon-separated list of suffixes to ignore when doing tab completion.
export PROMPT_DIRTRIM=2
ulimit -S -c 0 # Don't want coredumps.
unset MAILCHECK # Don't want my shell to warn me of incoming mail.
export PATH=$PATH:/usr/sbin/:/sbin/:~/bin/

# Try to load git __git_ps1 if possible
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh  ]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
fi

# Set up the prompt with GIT niceness if available
if [ "$TERM" != "dumb" ]; then
    if hash __git_ps1 &> /dev/null; then
        # Show the git branch if possible
        GIT_PS1_SHOWDIRTYSTATE=1
        GIT_PS1_SHOWCOLORHINTS=1
        GIT_PS1_SHOWUPSTREAM="auto"

        # With timestamp
        #PS1="\[\033[01;32m\]\u@\[\033[01;33m\]\h\\[\033[32m\] \A\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[01;35m\]\$(__git_ps1 '(%s)')\[\033[00m\]$ "

        # Without timestamp
        PS1="\[\033[01;32m\]\u@\[\033[01;33m\]\h\\[\033[32m\] \[\033[01;34m\]\w\[\033[00m\] \[\033[01;35m\]\$(__git_ps1 '(%s)')\[\033[00m\]$ "
    else
        PS1="\[\033[01;32m\]\u@\[\033[01;33m\]\h\\[\033[32m\] \[\033[01;34m\]\w\[\033[00m\] \[\033[00m\]$ "
    fi

    # Hack to support Mac not having dircolors
        if dircolors 1> /dev/null 2>&1; then
        eval "`dircolors -b`"
        alias ls='ls --color=auto --hide=*~' # Hide the annoying tmp files from emacs users.
    else
        export CLICOLOR=1
        export LSCOLORS=GxFxCxDxBxegedabagaced
    fi
fi

# User specific aliases and functions
alias ccat="pygmentize -g" # Color highlighting cat function, requires pygmentize python program
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"
alias bc="bc -l"
alias ll="ls -lrth"
alias llz="ls -lrSh"
alias grep='grep --exclude-dir=".git" --exclude="*.pyc" --color=auto'
alias sshdyn="ssh tjansson@tjansson.dyndns.dk -XC -p 443" # port 443 avoids firewalls
alias pylab="echo 'Remember bpython'; ipython --pylab"

# VIM setup
export EDITOR=vim
export SVN_EDITOR=vim
export GIT_EDITOR=vim
export VISUAL=vim
alias vim="vim -p" # Open multiple files in tabs
# If vim have been build then use this instead
if [ -d "$HOME/.vimbuild/vim/runtime" ]; then
    export VIMRUNTIME="$HOME/.vimbuild/vim/runtime"
    alias vim="$HOME/.vimbuild/vim/src/vim -p"
fi

# Anaconda python installation
if [ -d "$HOME/anaconda2/" ]; then
    source ~/anaconda2/etc/profile.d/conda.sh # New method in conda 4.4.8
    conda activate
elif [ -d "$HOME/anaconda3/" ]; then
    source ~/anaconda3/etc/profile.d/conda.sh # New method in conda 4.4.8
    conda activate
fi

# Host specific setup
if [ $HOSTNAME == "virt092" ]; then
    export PIP_CERT=/usr/share/ca-certificates/extra/cloud_services_root_ca_blue_coat.cer.crt
    export PATH=$PATH:~/tools/flyway-5.0.7
elif [ $HOSTNAME == "mtddev001" ]; then
    export PATH=$PATH:~/tools/flyway-5.0.7
elif [ $HOSTNAME == "bohr" ]; then
    alias sshdyn="ssh -X kelvin"
elif [ $HOSTNAME == "scrbmaldkbal001" ]; then
    export PATH=/opt/anaconda/bin/:/usr/local/texlive/2017/bin/x86_64-linux:$PATH
    export MANPATH=/usr/local/texlive/2017/texmf-dist/doc/man:$MANPATH
    export INFOPATH=/usr/local/texlive/2017/texmf-dist/doc/info:$INFOPATH
elif [ $HOSTNAME == "balder" ]; then
    source /anaconda/bin/activate py35
elif [ $HOSTNAME == "Thomass-MacBook-Pro.local" ]; then
    export PATH="/anaconda3/bin:$PATH"
fi
