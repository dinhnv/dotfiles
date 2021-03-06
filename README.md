# dotfiles

## Setup

- this repo should be located or symlinked at `$HOME/.dotfiles`.

### symlinks

link some configuration files

```
cd dotfiles
ln -sf $(pwd) ~/.dotfiles
ln -sf $(pwd)/zshrc ~/.zshrc
ln -sf $(pwd)/gitconfig ~/.gitconfig
ln -sf $(pwd)/vimrc~/.vimrc
ln -sf $(pwd)/tmux.conf~/.tmux.conf
ln -sf $(pwd)/nvim/init.vim ~/.config/nvim/init.vim
ln -sf $(pwd)/flake8 ~/.config/flake8
```

Or

`stow` cmd:
  ```
  stow zsh
  stow git
  stow fonts
  stow tmux
  ```

Personally, I mapped `Caplock` => `Ctrl`

### Fonts

Fire Code is my choice

```
brew tap homebrew/cask-fonts
brew cask install font-fira-code
```

### zsh

```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### tmux

+ linux: should built for the latest version, from https://github.com/tmux/tmux to install or update version (from git repo)

  ```
  sh autogen.sh
  ./configure && make
  sudo made install
  ```

+ macos: `brew install tmux`
+ https://github.com/samoshkin/tmux-config
+ hotkeys
    ```
    <leader> w: show windows
    <leader> n: next window
    <leader> <space> : switch layout
    ```

### python environment:

+ pre-requirements
  ```
  brew install pyenv
  brew install pyenv-virtualenv
  # brew install pyenv-virtualenvwrapper
  ```
+ create some virtualenvs:
  ```
  pyenv install 3.7.2
  pyenv virtualenv 3.7.3 devtools3
  pyenv virtualenv 2.7.16 devtools2
  pyenv global system devtools2 devtools3
  ```

### Vim/NeoVim

Refer in details [Vim/Neovim](vim.md)


### zsh

- [powerlevel9k install instructions](https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#step-1-install-powerlevel9k)
  + install for oh-my-zsh: `git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k`
  + fonts:
    + use `POWERLEVEL9K_MODE='awesome-patched'`
  + `brew install fontforge --with-python`
    + Get `https://github.com/gabrielelana/awesome-terminal-fonts/tree/patching-strategy/patched`
      And save to `~/Library/Fonts`
    + Run `sudo fc-cache -rv`
    + Edit terminal profile and choose Non-ASCII Font (iterm2) that a font from above repository

- **zsh plugins**: must be installed maually on guide:
  + [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  	use Ctrl+E or Ctrl+P to accept suggestion
  + [zsh-completions](https://github.com/zsh-users/zsh-completions) to add
    more definitions, i.e: ack, grep, etc.

### Ultilities:

```
brew install thefuck  # correct your previous command
brew install z        # jump to frequency directories
```
## Tips

- Macos Sierra Tmux issue:

  https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard

  `brew install reattach-to-user-namespace`

  [Config iterm](https://apple.stackexchange.com/questions/208387/copy-to-clipboard-from-tmux-in-el-capitan)


### SSL
https://stackoverflow.com/questions/7580508/getting-chrome-to-accept-self-signed-localhost-certificate/43666288#43666288
https://github.com/loganstellway/self-signed-ssl

Create Self site certificate:

```
wget https://raw.githubusercontent.com/loganstellway/self-signed-ssl/master/self-signed-tls
chmod +x self-signed-tls
./self-signed-tls
```

add to nginx to use

```
    ssl_certificate     /Users/dino/.certs/local.skygate.co.jp.crt;
    ssl_certificate_key /Users/dino/.certs/local.skygate.co.jp.key;
```

### git

```
git log --oneline

# refer to HEAD, HEAD@{2}
git reflog

# full information
git log -g
```

### Shell

* Some commands are already in terminal after the setup

  ```shell
  Ctrl + R: find commands in history
  Ctrl + T: find files in current directory
  ```

- `sudo !!`: run the latest command by sudo
- `^origin^replace`: run previous command but replacing. Useful for long command
- `sudo !!`: run the latest command by sudo
    i.e:
    ```
    curl https://mywebsitw.com
    ^sitw^site
    ```
- `<ESC> + .` or `ALT + .`: put the most recent argument to the shell. Multiple times for go the previous.
    i.e:
    ```
    ls -la ~/dotfiles/tmux
    cd <ESC> + .
    ```
- `[command] !*<tab>`: reuse all previous cmd arguments
- `curl ifconfig.me`: get external public ip
- `[command] <Ctrl+u> [command] <Ctrl+y>`: typing command, check something, continue to type command
    i.e:
    ```
    cat /var/log/app/application.log | grep
    Ctrl+u
    grep "uid" application.yml
    Ctrl+y
    # type uid
    ```
- `rm !(*.foo|*.bar|*.baz)` remove files not in the pattern
- `nc -v -l 80 < file.ext` share file through 80 port (?!)
- `ssh-copy-id user@host` equals to `cat ~/.ssh/id_rsa.pub | ssh user@machine "mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys"`
- `mkdir /path/xxx && cd $_`: made dir and cd to

### References:

* simple: https://raw.githubusercontent.com/sebbekarlsson/i3/master/.vimrc
* zsh optimal: https://htr3n.github.io/2018/07/faster-zsh/
