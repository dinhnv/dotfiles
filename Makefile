ZSH_CUSTOM := "~/.oh-my-zsh/custom"
zshplugins:
	git clone https://github.com/bhilburn/powerlevel9k.git $(ZSH_CUSTOM)/themes/powerlevel9k
	git clone git://github.com/zsh-users/zsh-autosuggestions $(ZSH_CUSTOM)/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-completions $(ZSH_CUSTOM)/plugins/zsh-completions
	mkdir -p ~/.fzf-plugins/fzf-marks/ && curl https://raw.githubusercontent.com/urbainvaes/fzf-marks/master/fzf-marks.plugin.zsh -o ~/.fzf-plugins/fzf-marks/fzf-marks.plugin.zsh

python-dev: pyenv
	brew install ctags
pyenv: pyenv-install pyenv-py2 pyenv-py3
	pyenv global system devtools2 devtools3

pyenv-install:
	brew install pyenv
	brew install pyenv-virtualenv
	# brew install pyenv-virtualenvwrapper

pyenv-py2:
	pyenv install 2.7.13
	pyenv virtualenv 2.7.13 devtools2
	pyenv activate devtools2
	pip install yamlog
	pip install pylint pandas ipython neovim


pyenv-py3:
	pyenv install 3.6.2
	pyenv virtualenv 3.6.2 devtools3
	pyenv activate devtools3
	pip3 install pylint pandas jupyter neovim
