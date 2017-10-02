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

# git
function gg() {
    git commit -m "$*"
}


function colors() {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\t"
    done
}

function ibusrestart() {
    ibus-daemon &
    ibus-daemon -x -d
}


function addsshkey() {
    # addsshkey myserver
    # addsshkey myname@myserver
    cat ~/.ssh/id_rsa.pub | ssh $* "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
}


function open_command() {
  emulate -L zsh
  setopt shwordsplit

  local open_cmd

  # define the open command
  case "$OSTYPE" in
    darwin*)  open_cmd='open' ;;
    cygwin*)  open_cmd='cygstart' ;;
    linux*)   open_cmd='xdg-open' ;;
    msys*)    open_cmd='start ""' ;;
    *)        echo "Platform $OSTYPE not supported"
              return 1
              ;;
  esac

  # don't use nohup on OSX
  if [[ "$OSTYPE" == darwin* ]]; then
    $open_cmd "$@" &>/dev/null
  else
    nohup $open_cmd "$@" &>/dev/null
  fi
}
