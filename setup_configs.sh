#!/bin/bash

FULL_PATH=$(cd $(dirname "$BASH_SOURCE") && pwd)

# ------------------------------
# VIM setup
VIM_SETUP_SCRIPT=setup_vim.pl
VIM_DIR=vim

if [[ ! -f ${HOME}/.vimrc ]]; then
   ln -s ${FULL_PATH}/${VIM_DIR}/vimrc ${HOME}/.vimrc
else
   echo "vimrc symlink already created. Skipping..."
fi

if [[ ! -d ${HOME}/.vim ]]; then
   perl ${VIM_DIR}/${VIM_SETUP_SCRIPT} setup
else
   echo "vim config home already setup. Skipping..."
fi

# ------------------------------
# FISH setup
FISH_DIR=fish
FISH_CONFIG_HOME=.config/fish

if [[ ! -d ${HOME}/${FISH_CONFIG_HOME} ]]; then
   ln -s ${FULL_PATH}/${FISH_DIR} ${HOME}/${FISH_CONFIG_HOME}
else
   echo "fish config home already setup. Skipping..."
fi

# ------------------------------
# BASH setup
BASH_DIR=bash

for bash_config in `ls $BASH_DIR`; do
   if [[ ! -f "${HOME}/.${bash_config}" ]]; then
      ln "${BASH_DIR}/${bash_config}" "${HOME}/.${bash_config}"
   else
      echo "bash config file, ${bash_config}, setup. Skipping..."
   fi
done
