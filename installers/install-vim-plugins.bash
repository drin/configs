#!/bin/bash


# ------------------------------
# Global and command-line Variables

config_root="${1:?"Please provide path to the configurations directory"}"
install_cmd="${2:?"Please provide a command: 'setup' or 'cleanup'"}"


# sub-directories that go under the $HOME directory
HOME_VIM_DIR="$HOME/.vim"

VIM_AUTOLOAD_DIR="$HOME_VIM_DIR/autoload"
VIM_BUNDLE_DIR="$HOME_VIM_DIR/bundle"
VIM_COLOR_DIR="$HOME_VIM_DIR/colors"

VIM_VIEW_DIR="$HOME_VIM_DIR/view"
VIM_SWAP_DIR="$HOME_VIM_DIR/swap"

# sub-directories that are rooted under the config.git repository root
PLUGIN_REPO_LIST="${config_root}/common/vim/plugin_list"
COLOR_REPO_LIST="${config_root}/common/vim/color_list"

PATHOGEN_LOAD_DIR="${config_root}/common/vim/plugins/vim-pathogen/autoload"
PLUGIN_DIR="${config_root}/common/vim/plugins"
COLOR_DIR="${config_root}/common/vim/colors"


# ------------------------------
# Validation

if [[ ! -d "${config_root}" ]]; then
    echo "Directory does not exist: '${config_root}'"
    exit 1
fi


# ------------------------------
# Functions

function pull_plugins {
    repo_list_file=$1
    plugin_dir=$2

    while read vim_plugin_entry; do
        echo "plugin entry: '${vim_plugin_entry}'"
        normalized_entry=$(echo "${vim_plugin_entry}" | sed 's/\s\+/ /g')

        plugin_path=$(echo "${normalized_entry}" | cut -f1 -d' ')
        plugin_repo=$(echo "${normalized_entry}" | cut -f2 -d' ')
        plugin_name=$(basename "${plugin_repo}" ".git")

        if [[ -z "${plugin_name}" ]]; then
            echo "unable to extract plugin name from uri: '${plugin_repo}'"
            continue
        fi

        if [[ ! -d "${plugin_dir}/${plugin_name}" ]]; then
            git -C "${plugin_dir}" clone "${plugin_repo}" "${plugin_path}"
        fi
    done < "${repo_list_file}"
}

function setup_vim {
    # ------------------------------
    # create various directories if necessary

    # base vim directories (typically in $HOME)
    mkdir -p "${HOME_VIM_DIR}" "${VIM_VIEW_DIR}" "${VIM_SWAP_DIR}"

    # target directories to clone vim plugins and vim colors into
    mkdir -p "${PLUGIN_DIR}" "${COLOR_DIR}"

    # ------------------------------
    # clone repos for vim plugins and vim colors
    pull_plugins $PLUGIN_REPO_LIST $PLUGIN_DIR
    pull_plugins $COLOR_REPO_LIST  $COLOR_DIR

    # ------------------------------
    # color files need to be in the root color directory. Here we create hardlinks
    for color_file in $(find "${COLOR_DIR}" -name '*.vim' -type f); do
        color_file_name=$(basename "${color_file}")
        ln -s "${color_file}" "${COLOR_DIR}/${color_file_name}"
    done

    # ------------------------------
    # setup symlinks (typically from $HOME) and for pathogen plugin
    ln -s "${PLUGIN_DIR}"        "${VIM_BUNDLE_DIR}"
    ln -s "${COLOR_DIR}"         "${VIM_COLOR_DIR}"
    ln -s "${PATHOGEN_LOAD_DIR}" "${VIM_AUTOLOAD_DIR}"
}

function cleanup_vim {
    # cleanup symlinks from $HOME to vim plugins and vim colors
    rm $VIM_BUNDLE_DIR
    rm $VIM_COLOR_DIR

    # cleanup cloned repos for vim plugins and vim colors
    rm -rf "$PLUGIN_DIR"
    rm -rf "$COLOR_DIR"
}


# ------------------------------
# Main

case "${install_cmd}" in
    cleanup)
        cleanup_vim
        ;;

    setup)
        setup_vim
        ;;

    *)
        echo "unknown command: '${install_cmd}'"
        ;;
esac
