##############################################################################
## author: Stephan Engelmann alias Secuvim
##   file: ~/.bashrc
##############################################################################

PS1='\[\033[01;32m\]\u@\h \[\033[01;36m\]\W \$ \[\033[01;00m\]'
export EDITOR=vim
export TEXMFHOME=~/.texmf

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=/home/stephan/.sbin:$PATH

# customized commands
alias commands='less ~/.commands'
alias commands_edit='vim ~/.commands'
alias conkyrestart='killall conky; sleep 1; conky &'
alias ls='ls --color=auto'
alias pacup='yaourt -Syu --aur'
alias reboot='systemctl reboot'
alias removeorphans='yaourt -Rns $(yaourt -Qtdq)'
alias suspend='systemctl suspend'
alias tmux='tmux -2'

if [ -f /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh ]; then
  source /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
fi

# local directory backups with 2 remaining versions
function local_backup() {
  SOURCE=${1%/}
  if [ -d $SOURCE ]; then
    BACKUP1_DIR="${SOURCE}_backup.1"
    BACKUP2_DIR="${SOURCE}_backup.2"
    rm -rf $BACKUP2_DIR
    mv $BACKUP1_DIR $BACKUP2_DIR
    cp -R $SOURCE $BACKUP1_DIR
  fi
}

workon_intranet() {
  source ~/.pyvenvs/intranet/bin/activate
  cd /home/stephan/git/Intranet/intranet
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

# commands to execute when opening a terminal window
[ ! "$UID" = "0" ] && shellPrompt
