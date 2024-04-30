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
if [ -z "$PS1" ]; then
    #echo This shell is not interactive
    :
else
    #echo This shell is interactive
    bind 'set show-all-if-ambiguous on' # Set tab-autocompletion to show options if not clear
    bind 'set completion-ignore-case on' # Ignores the case in the above
fi

set -C # The noclobber option prevents you from overwriting existing files with the > operator.
shopt -s dirspell # attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist.
shopt -s cdspell # automatically corrects small typos in directory names
shopt -s histappend # istory list is appended to the file named by the value of the HISTFILE variable when the shell exits, rather than overwriting the file.
shopt -s histreedit # If set, and Readline is being used, a user is given the opportunity to re-edit a failed history substitution.
shopt -s histverify # If set, and Readline is being used, the results of history substitution are not immediately passed to the shell parser. Instead, the resulting line is loaded into the Readline editing buffer, allowing further modification.
shopt -s globstar # If set, the pattern ** used in a pathname expansion context will match all files and zero or more directories and subdirectories
shopt -s nocaseglob # The nocaseglob option is similar to the dotglob option, except nocaseglob causes differences in upper- and lowercase letters in file names and directories to be ignored in name expansions.
shopt -s checkwinsize # Check the window size after each command, and update LINES and COLUMNS if the size has changed.

export HISTFILESIZE=5000 # the bash history should save 3000 commands
export HISTCONTROL=ignoredups #don't put duplicate lines in the history.
export HISTIGNORE="&:ls:cd:bg:fg:ll" # ignore these commands in history

# Make sure we are using the ibus for X11 input
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export QT4_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"

# Shell and prompt configuration
export GS_OPTIONS="-sPAPERSIZE=a4"
export FIGNORE=".svn:.git" # $FIGNORE is just a colon-separated list of suffixes to ignore when doing tab completion.
export PROMPT_DIRTRIM=2
ulimit -S -c 0 # Don't want coredumps.
unset MAILCHECK # Don't want my shell to warn me of incoming mail.
export PATH=$PATH:/usr/sbin/:/sbin/:~/bin/

# Set up simple markdown based notes. Inspired by https://github.com/hachibu/note.sh and inplemented using:
# * Syncthing on laptop: http://ubuntuhandbook.org/index.php/2020/11/install-syncthing-gtk-ubuntu-20-10/
# * Syncthing on server: https://docs.syncthing.net/users/autostart.html#linux  using system level systemd
# Monitor on server: sudo systemctl status syncthing@tjansson.service 
# Manage: firefox https://127.0.0.1:8384/ (use special user and pw)
# export NOTE_DIR=$HOME/Documents/syncthing/notes
# alias takenote="vim $NOTE_DIR/$(date +'%Y-%m-%d-'$HOSTNAME ).md"
# function takenotegrep() { grep -i -n --color='auto' "${1}" "$NOTE_DIR"/*.md; }

# Use vim for manpages:
export MANPAGER="vim -M +MANPAGER -"

# Try to load git __git_ps1 if possible
if [ -f /usr/lib/git-core/git-sh-prompt  ]; then
    source /usr/lib/git-core/git-sh-prompt
fi

# Set up the prompt with GIT niceness if available
if [ "$TERM" != "dumb" ]; then
    export TERM=xterm-256color

    if hash __git_ps1 &> /dev/null; then
        # Show the git branch if possible
        GIT_PS1_SHOWDIRTYSTATE=1
        GIT_PS1_SHOWCOLORHINTS=1
        GIT_PS1_SHOWUPSTREAM="auto"
        GIT_PS1_SHOWSTASHSTATE=true

        # With timestamp
        PS1="\[\033[01;33m\][\A]\[\033[01;32m\]\u@\[\033[01;33m\]\h\\[\033[32m\]\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \[\033[01;35m\]\$(__git_ps1 '(%s)')\[\033[00m\]$ "

        # Without timestamp
        #PS1="\[\033[01;32m\]\u@\[\033[01;33m\]\h\\[\033[32m\] \[\033[01;34m\]\w\[\033[00m\] \[\033[01;35m\]\$(__git_ps1 '(%s)')\[\033[00m\]$ "
    else
        # With timestamp
        PS1="\[\033[01;33m\][\A]\[\033[01;32m\]\u@\[\033[01;33m\]\h\\[\033[32m\]\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] $ "

        # Without timestamp
        #PS1="\[\033[01;32m\]\u@\[\033[01;33m\]\h\\[\033[32m\] \[\033[01;34m\]\w\[\033[00m\] \[\033[00m\]$ "

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
alias pwgen="pwgen 12"
alias ccat="pygmentize -g" # Color highlighting cat function, requires pygmentize python program
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"
alias bc="bc -l"
alias ll="ls -lrth"
alias llz="ls -lrSh"
alias tgrep='grep -i -n --exclude-dir=".git" --exclude="*.pyc" --color=auto'
alias pylab="echo 'Remember bpython'; ipython --pylab"
alias did="vim +'normal Go' +'r!date' ~/did.txt" # https://theptrk.com/2018/07/11/did-txt-file/
alias df='df -hT -x squashfs -x tmpfs -x devtmpfs -x fuse' # Avoid all the fake devices
alias black='black -l 120'

# https://stackoverflow.com/questions/17983068/delete-local-git-branches-after-deleting-them-on-the-remote-repo
alias gitpurge_deleted_branched="    git fetch --all -p; git branch -vv | grep ': gone]' | awk '{ print \$2 }' | xargs -n 1 git branch -d"
alias gitpurge_deleted_branched_dry="git fetch --all -p; git branch -vv | grep ': gone]'"

# Johnny decimal function
cjdfunction() { 
    pushd ~/**/${1}* 
}
export cjdfunction
alias cjd='cjdfunction' # Or any other alias you prefer.

###########
# VIM setup
###########
export PYTHONBREAKPOINT="pudb.set_trace"
export EDITOR=vim
export SVN_EDITOR=vim
export GIT_EDITOR=vim
export VISUAL=vim
alias vim="vim -p -X" # Open multiple files in tabs and avoid X
# If vim have been build then use this instead
if [ -d "$HOME/.vimbuild/vim/runtime" ]; then
    export VIMRUNTIME="$HOME/.vimbuild/vim/runtime"
    alias vim="$HOME/.vimbuild/vim/src/vim -p"
fi

#####################
# Host specific setup
#####################
if [ $HOSTNAME == "pascal" ]; then
    alias sshdyn="ssh -X 192.168.0.160"
elif [ $HOSTNAME == "VirtualBox" ]; then
    alias sshdyn="ssh -X 192.168.0.160"
else
    # Removed X as it was needed and slowed something down (vim)
    # alias sshdyn="ssh -o ServerAliveInterval=60 tjansson@tjansson.dyndns.dk -XC -p 443" # port 443 avoids firewalls
    alias sshdyn="ssh -o ServerAliveInterval=60 tjansson@tjansson.dyndns.dk -C -p 22" # port 443 avoids firewalls
fi

################
# Connected Cars
################
# Load external aliases if it exists that should not be part of a public GH repo
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ $HOSTNAME == "x1" ]; then
#    # export REGION='EU1'
    source ~/code/docker-python/.connections
    source ~/code/data-quality/python_module_autocomplete.sh
fi
# If possible try to load conda aliases
if [ -f ~/code/connectedcars/docker-python/.conda_aliases ]; then
    source ~/code/connectedcars/docker-python/.conda_aliases
fi
if [ -f ~/code/docker-python/.conda_aliases ]; then
    source ~/code/docker-python/.conda_aliases
fi

##############
# CONDA python
##############

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("/home/$USER/miniconda3/bin/conda" 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/$USER/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/$USER/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/$USER/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Execute the dev enviroment if possible
if [ -f "/home/$USER/miniconda3/etc/profile.d/conda.sh" ]; then
    if [ $HOSTNAME != "kelvin" ]; then
        conda activate dev
    fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
