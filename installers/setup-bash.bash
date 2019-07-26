#!/bin/bash

if [[ -z $CONFIG_ROOT ]]; then
    echo "Please set 'CONFIG_ROOT' to the configs.git checkout"
    exit 1
fi

for bash_config_file in `ls ${CONFIG_ROOT}/bash`; do
   if [[ ! -f "${HOME}/.${bash_config_file}" ]]; then
      ln "${CONFIG_ROOT}/bash/${bash_config_file}" "${HOME}/.${bash_config_file}"
   else
      echo "bash config file, ${bash_config_file}, setup. Skipping..."
   fi
done
