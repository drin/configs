#!/usr/bin/bash

# ------------------------------
# Variables

poetry_web_uri="https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py"
init_env_poetry="${HOME}/.poetry/env"

# set path_to_source_pyenv to given path, or default to ~/toolbox/pyenv
path_to_source_pyenv=$1
if [[ -z $path_to_source_pyenv ]]; then
    path_to_source_pyenv="$HOME/toolbox/pyenv"
fi

# define "pyenv init" command for bash
pyenv_init_cmd=<<'CMD_BODY'
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
CMD_BODY

# ------------------------------
# Install Python3 optional dependencies
if [[ ! -f /etc/os-release ]]; then
    echo '[WARN] Linux OS file, `/etc/os-release`, not found...'
else
    # Ubuntu
    if [[ -n $(grep "Ubuntu" /etc/os-release) ]]; then
        sudo apt-get -y install libffi-dev libbz2-dev libreadline-dev
    fi

    # Arch Linux
    if [[ -n $(grep "Arch Linux" /etc/os-release) ]]; then
        sudo pacman -Sy --noconfirm libffi bzip2 readline
    fi
fi

# ------------------------------
# Install (via download) Poetry (via get-poetry.py)
if [[ -z $(type poetry 2> /dev/null) ]]; then
    curl -sSL $poetry_web_uri | python
else
    echo '`poetry` command already exists'
fi

if [[ -f "${init_env_poetry}" ]]; then
    source "${init_env_poetry}"
    poetry self update
else 
    echo "[Error] Poetry environment initialization script not found."
fi

# ------------------------------
# Install Pyenv
if [[ -z $(type pyenv 2> /dev/null) ]]; then
    git clone https://github.com/pyenv/pyenv $path_to_source_pyenv
    
    # export these variables now for convenience
    export PYENV_ROOT="$path_to_source_pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    
    # run pyenv init so that this script can be sourced
    eval $pyenv_init_cmd
    
    # TODO: make this maintainable and idempotent
    # but also write to config files for future shell sessions
    # echo "export PYENV_ROOT=$PYENV_ROOT"     >> $HOME/.bashrc
    # echo 'export PATH=$PYENV_ROOT/bin:$PATH' >> $HOME/.bashrc
    # echo $pyenv_init_cmd                     >> $HOME/.bashrc
else
    echo '`pyenv` command already exists'
fi
