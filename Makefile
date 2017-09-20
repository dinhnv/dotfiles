ZSH_CUSTOM := "~/.oh-my-zsh/custom"
zshplugins:
	git clone git://github.com/zsh-users/zsh-autosuggestions $(ZSH_CUSTOM)/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-completions $(ZSH_CUSTOM)/plugins/zsh-completions
	mkdir -p ~/.fzf-plugins/fzf-marks/ && curl https://raw.githubusercontent.com/urbainvaes/fzf-marks/master/fzf-marks.plugin.zsh -o ~/.fzf-plugins/fzf-marks/fzf-marks.plugin.zsh
