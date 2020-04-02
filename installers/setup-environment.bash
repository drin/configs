#!/bin/bash

# ------------------------------
# Prerequisites

if [[ -z $CONFIG_ROOT ]]; then
    echo "Please set 'CONFIG_ROOT' to the configs.git checkout"
    exit 1
fi

if [[ -f /etc/os-release && -n $(grep "Ubuntu" /etc/os-release) ]]; then
    sudo apt-get -y update
fi

# ------------------------------
# Variables

path_to_home_config="${HOME}/.config"

path_to_configs_bash="${CONFIG_ROOT}/bash"
path_to_configs_fish="${CONFIG_ROOT}/fish"
path_to_configs_alacritty="${CONFIG_ROOT}/alacritty"
path_to_configs_terminfo="${CONFIG_ROOT}/terminfo"

path_to_home_fish="${path_to_home_config}/fish"
path_to_home_alacritty="${path_to_home_config}/alacritty"
path_to_home_terminfo="${HOME}/.terminfo"


# ------------------------------
# Make directory: $HOME/.config
if [[ ! -d ${path_to_home_config} ]]; then
    mkdir -p ${path_to_home_config}
fi


# ------------------------------
# Bash setup
for bash_config_file in `ls ${path_to_configs_bash}`; do
   if [[ ! -f "${HOME}/.${bash_config_file}" ]]; then
      ln "${CONFIG_ROOT}/bash/${bash_config_file}" "${HOME}/.${bash_config_file}"
   else
      echo "bash config file, ${bash_config_file}, setup. Skipping..."
   fi
done


# ------------------------------
# Fish setup
if [[ ! -d ${path_to_home_fish} ]]; then
   ln -s ${path_to_configs_fish} ${path_to_home_fish}
else
   echo "fish config home already setup. Skipping..."
fi

if [[ -f /etc/os-release && -n $(grep "Ubuntu" /etc/os-release) ]]; then
    sudo apt-get -y install fish
fi


# ------------------------------
# Alacritty setup

# Install alacritty package
if [[ -f /etc/os-release && -n $(grep "Ubuntu" /etc/os-release) ]]; then
    # Assume yes, so that this doesn't wait for me to press enter
    sudo add-apt-repository -y ppa:mmstick76/alacritty
    sudo apt-get -y install alacritty
fi

# Link alacritty's configuration
if [[ -d ${path_to_home_config} && ! -e ${path_to_home_alacritty} ]]; then
    ln -s ${path_to_configs_alacritty} ${path_to_home_alacritty}
else
    echo "Config home does not exist; or alacritty link already exists. Skipping..."
fi

# Link terminfo files
# (necessary for ssh to ubuntu for alacritty for some reason)
ln -s ${path_to_configs_terminfo} ${path_to_home_terminfo}
