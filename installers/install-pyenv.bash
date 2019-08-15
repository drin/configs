#!/usr/bin/bash
set -x

# ------------------------------
# Since this is a bash script, config files are assumed to be for bash.
# Additionally, since fedora/ubuntu are likely for other environments,
# we write to ~/.bashrc rather than ~/.bash_profile

# ------------------------------
# Set global variables for script

# set pyenv_path to given path, or default to ~/.pyenv
pyenv_path=$1
if [[ -z $pyenv_path ]]; then
    pyenv_path="$HOME/toolbox/pyenv"
fi

# define "pyenv init" command for bash
pyenv_init_cmd=<<'CMD_BODY'
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
CMD_BODY

# ------------------------------
# script main body
git clone https://github.com/pyenv/pyenv $pyenv_path

# export these variables now for convenience
export PYENV_ROOT="$pyenv_path"
export PATH="$PYENV_ROOT/bin:$PATH"

# run pyenv init so that this script can be sourced
eval $pyenv_init_cmd

# TODO: make this maintainable and idempotent
# but also write to config files for future shell sessions
# echo "export PYENV_ROOT=$PYENV_ROOT"     >> $HOME/.bashrc
# echo 'export PATH=$PYENV_ROOT/bin:$PATH' >> $HOME/.bashrc
# echo $pyenv_init_cmd                     >> $HOME/.bashrc

