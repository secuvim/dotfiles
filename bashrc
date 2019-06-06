##############################################################################
## author: Stephan Engelmann alias Secuvim
##   file: ~/.bashrc
##############################################################################

PS1='\[\033[01;32m\]\u@\h \[\033[01;36m\]\W \$ \[\033[01;00m\]'
export EDITOR=nvim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# manual $PATH additions
if [ -d '$HOME/.local/bin' ]; then
  PATH=$HOME/.local/bin:$PATH
fi

if [ -d '$HOME/.bin' ]; then
  PATH=$HOME/.bin:$PATH
fi

# enable advanced bash completion
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

alias ls='ls --color=auto'

# colored man pages
man() {
  env \
    LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

port_process() {
  netstat -tulpn | grep ":$1"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# commands to execute when opening a terminal window
[ ! "$UID" = "0" ] && neofetch
