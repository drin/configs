#!/bin/bash

VIM_DIR=vim
VIM_SETUP_SCRIPT=setup_vim.pl

FULL_PATH=$(cd $(dirname "$BASH_SOURCE") && pwd)

if [[ ! -f ${HOME}/.vimrc ]]; then
   ln -s ${FULL_PATH}/${VIM_DIR}/vimrc ${HOME}/.vimrc
fi

if [[ ! -d ${HOME}/.vim ]]; then
   perl ${VIM_DIR}/${VIM_SETUP_SCRIPT}
fi
