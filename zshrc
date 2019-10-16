# Readmore samples: https://github.com/zsh-users/antigen/wiki/In-the-wild
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Tuning zsh
# https://jb-blog.readthedocs.io/en/latest/posts/0032-debugging-zsh-startup-time.html
# https://carlosbecker.com/posts/speeding-up-zsh/
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
    python
#    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# initialize autocomplete
#autoload -U compinit && compinit
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

bindkey '^o' autosuggest-accept
bindkey '^u' autosuggest-clear

# 10ms for key sequences
KEYTIMEOUT=1
HIST_STAMPS="yyyy-mm-dd"
HIST_IGNORE_SPACE="true"
HISTSIZE=5000
SAVEHIST=4000
HYPHEN_INSENSITIVE="false"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=246'

if [[ -f "$HOME/.zsh_local" ]]; then
  source "$HOME/.zsh_local"
fi

# utils
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# correct commands
if which thefuck >/dev/null 2>&1; then
    eval $(thefuck --alias)
fi

# jump
. /usr/local/etc/profile.d/z.sh


source "$HOME/.dotfiles/zsh/exports"
source "$HOME/.dotfiles/zsh/aliases"
source "$HOME/.dotfiles/zsh/functions"


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
