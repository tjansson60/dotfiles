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
export HISTFILESIZE=5000 # the bash history should save 3000 commands
export HISTCONTROL=ignoredups #don't put duplicate lines in the history.

#export VIMRUNTIME=/share/distro/vim/8.0.435/share/vim/vim80 # Only needed for custom compiled on some systems
export EDITOR=vim
export SVN_EDITOR=vim
export GIT_EDITOR=vim
export VISUAL=vim
alias vim="vim -p"

export PATH=$PATH:/usr/sbin/:/sbin/:~/bin/
export GS_OPTIONS="-sPAPERSIZE=a4"
ulimit -S -c 0 # Don't want coredumps.
unset MAILCHECK # Don't want my shell to warn me of incoming mail.

# Color and custom PS1
[ -z "$PS1" ] && return
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

# User specific aliases and functions
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"
alias bc="bc -l"
alias ll="ls -lrth"
alias llz="ls -lrSh"
alias grep='grep --exclude-dir=".svn" --exclude="*.pyc" --color=auto'
alias screen="screen -T linux -s /bin/bash"
alias mosh="export LANG=en_US.UTF-8; mosh"
#alias sshdyn="ssh tjansson.dyndns.dk -XC -p 2222"
alias sshdyn="ssh -X nobel"
alias sshhar="ssh -p 6060 -X localhost"

# Function to convert file encoding
function conenc(){
    convmv --notest -f iso-8859-15 -t utf8 $1
}	

# added by Anaconda3 4.4.0 installer
alias conda_load='export PATH="/home/tjansson/.anaconda3/bin:$PATH"'
#export PATH="/home/tjansson/.anaconda3/bin:$PATH"
