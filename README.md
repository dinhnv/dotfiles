# dotfiles
My personal dotfiles

## Setup

- application directory should be located in home: `~/applications/`

- this repo should be located at home `~/dotfiles` to use stow as convenient, to
  install:
  ```
  stow zsh
  stow git
  ```

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

- zsh theme: [powerlevel9k](https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#step-1-install-powerlevel9k)
    + install for oh-my-zsh: `git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k`
	+ [install powerline fonts](https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions)

- zsh plugins: must be installed maually on guide:
    + [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
		use Ctrl+E or Ctrl+P to accept suggestion
	+ [zsh-completions](https://github.com/zsh-users/zsh-completions) to add
	  more definitions, i.e: ack, grep, etc.


" vim: ts=4 sw=0 tw=80 foldlevel=0 foldmethod=indent
