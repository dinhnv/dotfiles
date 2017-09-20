# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

if [[ "$COLORTERM" == "gnome-terminal" ]]; then
    export TERM=xterm-256color
fi

# 10ms for key sequences
KEYTIMEOUT=1

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(pyenv rbenv status root_indicator background_jobs time)
POWERLEVEL9K_MODE='patched-fontconfig'
ZSH_THEME="powerlevel9k/powerlevel9k"

###############################################################################
plugins=(git zsh-autosuggestions zsh-completions)

source $ZSH/oh-my-zsh.sh

###############################################################################
# fzf
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
# preview C-t
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
FZF_MARKS_PLUGIN=~/.fzf-plugins/fzf-marks/fzf-marks.plugin.zsh
[ -f $FZF_MARKS_PLUGIN ] && source $FZF_MARKS_PLUGIN 2> /dev/null

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [[ -d $PYENV_ROOT ]];then
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/work
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"
    # pyenv virtualenvwrapper_lazy
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.data"
export XDG_STATE_HOME="$HOME/.state"
if [[ "$(uname -s)" == "Darwin" ]]; then
    export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"
else
    export JAVA_HOME=/usr/lib/jvm/java-8-oracle
fi
export GRADLE_HOME="$HOME/applications/gradle"
export PATH=$GRADLE_HOME/bin:$PATH
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools/:$PATH
export PATH=$PATH:/usr/local/go/bin
# export GOPATH=$HOME/gocode

NPM_PACKAGES="${HOME}/.npm-packages"
export PATH=$NPM_PACKAGES/bin:$PATH

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# remove duplicate entries
typeset -U PATH

# alias
alias fig='docker-compose'
alias dinodeploy='fab -f ~/dev/bots/dino_bot.py deploy:b=master'
alias tmuxd='tmux new -s dev'
alias redisd='redis-server /usr/local/etc/redis.conf'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# zsh-completions
autoload -U compinit && compinit

for config (~/.zsh/*.zsh) source $config

bindkey '^o' autosuggest-accept
