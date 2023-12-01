# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
ZSH_THEME="robbyrussell"


# Standard plugins can be found in $ZSH/plugins/
# zsh-completions
# git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
plugins=(git z zsh-autosuggestions zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"


# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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

# for autosuggestions
bindkey '^o' autosuggest-accept
bindkey '^u' autosuggest-clear

# 10ms for key sequences
KEYTIMEOUT=1

# HIST_STAMPS="yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"
HIST_IGNORE_SPACE="true"
HISTSIZE=5000
SAVEHIST=4000
HYPHEN_INSENSITIVE="false"


# aliases
alias fig="docker-compose"


# tools
# =============================
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# direnv
eval "$(direnv hook zsh)"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


#--------------- FUNCTIONS -----------------
# from http://hiltmon.com/blog/2013/07/30/quick-process-search/
function psax() {
    ps auxwwwh | grep "$@" | grep -v grep
}

function psg() {
    ps -ef | grep -i "$@" | grep -v grep
}

# https://github.com/zanshin/dotfiles/blob/master/bash/bash_functions
# Call from a local repo to open the repository on github/bitbucket in browser
function repo() {
    local giturl=$(git config --get remote.origin.url | sed 's/git@/\/\//g' | sed 's/.git$//' | sed 's/https://g' | sed 's/:/\//g')
    if [[ $giturl == "" ]]; then
        echo "Not a git repository or no remote.origin.url is set."
    else
        local gitbranch=$(git rev-parse --abbrev-ref HEAD)
        local giturl="http:${giturl}"

        if [[ $gitbranch != "master" ]]; then
            local giturl="${giturl}/tree/${gitbranch}"
        fi

        echo $giturl
        open_command $giturl
    fi
}

