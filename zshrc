# path extensions for packages installed in home directory
if [ -d "${HOME}/.local/bin" ]; then
  export PATH=${HOME}/.local/bin:$PATH
fi
if [ -d "${HOME}/.bin" ]; then
  export PATH=${HOME}/.bin:$PATH
fi
if [ -d "${HOME}/.gem" ]; then
  export PATH=${HOME}/.gem/ruby/2.5.0/bin:$PATH
fi

# POWERLEVEL9K Theming, It is later loaded by prezto
DEFAULT_USER="stephan"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_HOME_ICON='ﴤ'
POWERLEVEL9K_HOME_SUB_ICON='ﱮ'
POWERLEVEL9K_FOLDER_ICON='ﱥ'
POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=true
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(\
    status root_indicator background_jobs virtualenv disk_usage)
if [[ -z "${KONSOLE_PROFILE}" ]] && $KONSOLE_PROFILE == 'light'; then
  POWERLEVEL9K_COLOR_SCHEME='light'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Editor flag for ranger
export EDITOR="nvim"

# Info for ssh key agent
export SSH_KEY_PATH="~/.ssh/id_ecdsa"

alias docker_remove_untagged='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias pacup='sudo pacman -Syu; aur sync -u'
alias port_process='netstat -tulpn | grep ":$1"'
alias removeorphans='sudo pacman -Rns $(pacman -Qtdq)'

# set the tmux window name to the remote hostname when connecting via ssh
ssh() {
  if env | grep -q "TMUX_PANE"; then
    tmux rename-window "$*"
    command ssh "$@"
    tmux set-window-option automatic-rename "on" 1 > /dev/null
  else
    command ssh "$@"
  fi
}

# enable project virtual environment
workon_intranet() {
  source $HOME/git/Intranet/venv/bin/activate
  cd $HOME/git/Intranet/intranet
  alias cov='coverage run ./manage.py test users inhabitants groups accounting pdf service && coverage html'
}

# display welcome prompt
shellPrompt
