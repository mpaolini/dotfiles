# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

export N_PREFIX=$HOME
export EDITOR="emacs -nw -q"
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

eval $(thefuck --alias)

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

refresh_virtualenvs() {
    if [ ! -d "$1" ]; then
	echo "refresh_virtualenvs <base-dir>" >&2
    else
	find "$1" -maxdepth 2 -mindepth 2 -type f -name setup.py -execdir bash -c "( [ -d virtual ] || python -m venv virtual ) ; virtual/bin/pip install -U pip setuptools jedi epc" \;
    fi
}
