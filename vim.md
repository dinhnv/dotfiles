# Vim/NeoVim Note

### General configuration

* To confirm, verify original neovim, just open without any settings or plugins:
```
nvim --u NONE
```

* To check which setting/plugins set some value:
    eg: `:verbose set conceallevel `

* ag for text search, ctags for vim tagbar

```
brew install ag
brew install ctags
```

* python provider and some dependencies for plugins
    create separated two python environments
    ```
    pyenv virtualenv 2.7.16 neovim2
    pyenv activate neovim2
    pip install pynvim
    pip install neovim  # only if needed by third-party software

    pyenv virtualenv 3.7.3 neovim3
    pyenv activate neovim3
    pip3 install neovim pynvim
    pip3 install jedi   # for python source navigation
    pip3 install isort
    pip3 install black  # for neoformat [python]
    pip3 install flake8 # for ale syntax lint [python]
    ```

* Javascript linter and formatter
    ```
    npm install -g eslint
    npm install -g prettier
    ```
* ALE plugin for code linting (flake8, eslint)

Inside neovim
```
nvim xxx.txt
:Plug install
:UpdateRemotePlugins  # for deoplete
```

For Python coding:
+ formatter: black
+ lint: flake8

### vim understand

`nnoremap` : new Normal NOn-REcursive MAPping.
`<silent>` : defines that when you execute this mapping, the command will not be echoed on the command line.
`<buffer>` : restricts the command to work only on the current buffer
`<special>` : notation defines mapping for special keys (eg: F12)
