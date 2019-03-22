# -*- sh -*- vim:set ft=sh ai et sw=4 sts=4:
# It might be bash like, but I can't have my co-workers knowing I use zsh
function pyenv_prompt_info() {
    local pyenv_version_name=""
    if [[ -n "$PYENV_VERSION" ]]; then
        pyenv_version_name="$PYENV_VERSION"
    else
        # pyenv_version_name="$(pyenv version-name)"
        # local pyenv_global="system"
        # local pyenv_root="$(pyenv root)"
        # if [[ -f "${pyenv_root}/version" ]]; then
        #     # pyenv_global="$(pyenv version-file-read ${pyenv_root}/version)"
        #     pyenv_global="$(pyenv global)"
        #     # echo "global=$pyenv_global"
        # fi
        # # echo "pyenv version=${pyenv_version_name}, global=$pyenv_global"

        # if [[ "${pyenv_version_name}" == "${pyenv_global}" ]]; then
        #     pyenv_version_name=""
        # fi
    fi

    if [[ "" != $pyenv_version_name ]]; then
        local pyversion=$(python -V 2>&1 | cut -f 2 -d ' ')
        local pyenv_prompt="${pyenv_version_name}"
        if [[ $pyversion != $pyenv_version_name ]]; then
            pyenv_prompt="$pyenv_prompt:$pyversion"
        fi
        echo "%{$fg[red]%}(py:$pyenv_prompt%{$fg[red]%})%{$reset_color%}"
    fi
}

_DIR="%{$fg_bold[blue]%}%2~"
_PREFIX="%{$fg[green]%}»"
PROMPT='$_PREFIX $_DIR%{$reset_color%}$(git_prompt_info)$(pyenv_prompt_info)%{$reset_color%}%(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX=":%{$fg[red]%}(git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
