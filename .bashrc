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
export HISTFILESIZE=5000 # the bash history should save 3000 commands
export HISTCONTROL=ignoredups #don't put duplicate lines in the history.
export EDITOR="vim"
export PATH=$PATH:/usr/sbin/:/sbin/:~/bin/
export GS_OPTIONS="-sPAPERSIZE=a4"

# Color and custom PS1
[ -z "$PS1" ] && return
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#case "$TERM" in xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
#    ;;
#*)
#    ;;
#esac

if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

# User specific aliases and functions
alias ll="ls -lrth"
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"

alias sshga="ssh -X gamma@charm.nbi.dk"
alias sshunis="ssh unisstud@wh28.webhuset.no"
alias sshkli="ssh -X klima@charm.nbi.dk"
alias sshdyn="ssh -X nobel"
alias sshhar="ssh -p 6060 -X localhost"
alias backupmon="clear; lsof | grep  rsync | grep -v mem;echo '' ; df -h | grep /dev/sdc1"
alias bc="bc -l"
alias latexmkmod="grep -l "\\documentclass" *tex | xargs latexmk -pdf -pvc -silent"

# Function to convert file encoding
function conenc()
{
	convmv --notest -f iso-8859-15 -t utf8 $1
}	

# added by Anaconda3 4.4.0 installer
alias conda_load='export PATH="/home/tjansson/.anaconda3/bin:$PATH"'
#export PATH="/home/tjansson/.anaconda3/bin:$PATH"
