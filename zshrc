# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
if [ -d "${HOME}/.local/bin" ]; then
  export PATH=${HOME}/.local/bin:$PATH
fi
if [ -d "${HOME}/.bin" ]; then
  export PATH=${HOME}/.bin:$PATH
fi
if [ -d "${HOME}/.gem" ]; then
  export PATH=${HOME}/.gem/ruby/2.5.0/bin:$PATH
fi

# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
DEFAULT_USER="stephan"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(\
    status root_indicator background_jobs virtualenv history)
if [[ -z "${KONSOLE_PROFILE}" ]] && $KONSOLE_PROFILE = 'light'; then
  POWERLEVEL9K_COLOR_SCHEME='light'
fi
ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_TMUX_AUTOSTART='true'
ZSH_TMUX_AUTOQUIT='false'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker git pep8 pip tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_ecdsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias conkyrestart='killall conky; sleep 1; conky &'
alias docker_remove_untagged='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias pacup='sudo pacman -Syu'
alias port_process='netstat -tulpn | grep ":$1"'
alias removeorphans='sudo pacman -Rns $(pacman -Qtdq)'
alias vim='nvim'

# make man pages more colorful
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

# set the tmux window name to the remote hostname when connecting via ssh
ssh() {
  if env | grep -q "TMUX_PANE"; then
    tmux rename-window "$*"
    command ssh "$@"
    tmux set-window-option automatic-rename "on" 1>/dev/null
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
