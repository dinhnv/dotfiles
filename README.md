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

- zsh theme: [powerlevel9k](https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#step-1-install-powerlevel9k)
    + install for oh-my-zsh: `git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k`
	+ fonts:
		+ read about:
			+ https://github.com/bhilburn/powerlevel9k/issues/429
			+ https://github.com/bhilburn/powerlevel9k/blob/master/functions/icons.zsh#L144
		+ [install a powerline fonts](https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions)
			+ install [powerline fonts](https://github.com/powerline/fonts) firstly
			+ install [awesome terminal](https://github.com/gabrielelana/awesome-terminal-fonts#how-to-install-osx)
		+ Cmd + I -> Text: choose a powerline font for "Non-ASCII Font" (with iterm2), i.e: Meslo LG L for Powerline

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
