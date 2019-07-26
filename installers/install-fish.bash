#!/bin/bash

if [[ -z $CONFIG_ROOT ]]; then
    echo "Please set 'CONFIG_ROOT' to the configs.git checkout"
    exit 1
fi

if [[ ! -d ${HOME}/.config/fish ]]; then
   ln -s ${CONFIG_ROOT}/fish ${HOME}/.config/fish
else
   echo "fish config home already setup. Skipping..."
fi
