##############################################################################
## author: Stephan Engelmann alias Secuvim
##   file: ~/.bashrc
##############################################################################

PS1='\[\033[01;32m\]\u@\h \[\033[01;36m\]\W \$ \[\033[01;00m\]'
export EDITOR=vim
export TEXMFHOME=~/.texmf

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# manual $PATH additions
if [ -d '$HOME/.local/bin' ]; then
  PATH=$HOME/.local/bin:$PATH
fi

if [ -d '$HOME/.sbin' ]; then
  PATH=$HOME/.sbin:$PATH
fi

if [ -f '/usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh' ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
fi

# enable advanced bash completion
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# customized commands
alias commands='less ~/.commands'
alias commands_edit='vim ~/.commands'
alias conkyrestart='killall conky; sleep 1; conky &'
alias ls='ls --color=auto'
alias pacup='pacaur -Syu'
alias reboot='systemctl reboot'
alias removeorphans='pacaur -Rns $(pacaur -Qtdq)'
alias suspend='systemctl suspend'
alias tmux='tmux -2'

if [ -f /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh ]; then
  source /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
fi

workon_intranet() {
  source $HOME/git/Intranet/venv/bin/activate
  cd $HOME/git/Intranet/intranet
  alias cov='coverage run ./manage.py test users inhabitants groups accounting pdf service && coverage html'
}

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

# commands to execute when opening a terminal window
[ ! "$UID" = "0" ] && shellPrompt
