# dotfiles
My personal dotfiles

## Setup

- application directory should be located in home: `~/applications/`

- this repo should be located at home `~/dotfiles` to use stow as convention

- zsh `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

- tmux
    + linux: should built for the latest version, from https://github.com/tmux/tmux
    To instal or update version (from git repo)

    ```
    sh autogen.sh
    ./configure && make
    sudo made install
    ```
    + macos: `brew install tmux`

- python environment:
    + pre-requirements
    ```
    brew install ctags

    brew install pyenv
    brew install pyenv-virtualenv
    brew install pyenv-virtualenvwrapper
    ```
    + create some virtualenvs:
    ```
    pyenv install 3.6.2
    pyenv virtualenv 3.6.2 devtools3
    pyenv virtualenv 2.7.13 devtools2
    pyenv global system devtools2 devtools3
    pyenv activate devtools2
    pip install neovim
    pyenv activate devtools3
    pip install neovim
    ```

- zsh theme: [powerlevel9k](https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#step-1-install-powerlevel9k)
    + install for oh-my-zsh: `git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k`
	+ fonts:
        + use `POWERLEVEL9K_MODE='awesome-patched'`
        + Get `https://github.com/gabrielelana/awesome-terminal-fonts/tree/patching-strategy/patched`
          And save to `~/Library/Fonts`
        + Run `sudo fc-cache -rv`
        + Edit terminal profile and choose Non-ASCII Font (iterm2) that a font from above repository
- zsh plugins: must be installed maually on guide:
    + [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
		use Ctrl+E or Ctrl+P to accept suggestion
	+ [zsh-completions](https://github.com/zsh-users/zsh-completions) to add
	  more definitions, i.e: ack, grep, etc.
	
- `stow` cmd:
  ```
  stow zsh
  stow git
  stow fonts
  stow tmux
  ```

- Macos Sierra Tmux issue:

https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard

`brew install reattach-to-user-namespace`

[Config iterm](https://apple.stackexchange.com/questions/208387/copy-to-clipboard-from-tmux-in-el-capitan)
