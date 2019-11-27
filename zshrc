# ZSH_PROF=1 zsh -ic zprof
if [[ -n $ZSH_PROF ]]; then
  zmodload zsh/zprof
fi

export ZSH=$HOME/.oh-my-zsh
# export ZSH_THEME="dino"
# ZSH_THEME="mortalscumbag"
ZSH_THEME="dino"

plugins=(
    git
    zsh-autosuggestions
    zsh-completions
)
source $ZSH/oh-my-zsh.sh

bindkey '^o' autosuggest-accept
bindkey '^u' autosuggest-clear


#####################################
# custom
#####################################
#[slow] source "$HOME/.dotfiles/zsh/exports"
source "$HOME/.dotfiles/zsh/aliases"
source "$HOME/.dotfiles/zsh/functions"
# local machine
[ -f ~/.env.zsh ] && source ~/.env.zsh


#####################################
# settings
#####################################
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=102'

#####################################
# exports
#####################################
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LESSCHARSET=utf-8

export EDITOR=nvim
export VISUAL=nvim

export HOSTNAME="dino.macbook"
export hostname="dino.macbook"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.data"
export XDG_STATE_HOME="$HOME/.state"


#####################################
# source scripts/tools
#####################################
# fzf
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
# preview C-t
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# jump to directory quickly
. /usr/local/etc/profile.d/z.sh


# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    export PATH="$PATH:$PYENV_ROOT/bin"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# jenv
# if which jenv > /dev/null 2>&1; then eval "$(jenv init -)"; fi
