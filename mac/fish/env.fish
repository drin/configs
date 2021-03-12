#!/opt/homebrew/bin/fish


# ------------------------------
# Global variables


# ------------------------------
# User environment
if test -z $__custom_fish_config_initialized
    echo "=> Initializing Fish environment"
    set -gx __custom_fish_config_initialized 1

    # Prompt content (calculate once for efficiency)
    if not set -q __fish_prompt_hostname
        command -v hostname >/dev/null
        if test $status -eq 0
            set -gx __fish_prompt_hostname (hostname)
        else
            set -gx __fish_prompt_hostname "octalene-container"
        end
    end

    # Prompt colors
    if not set -q __fish_prompt_normal
        set -gx __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_color_blue
        set -gx __fish_color_blue (set_color -o blue)
    end

    # ------------------------------
    # Common env variables
    set -Ux GIT_EDITOR  vim
    set -Ux EDITOR      vim
    set -Ux PAGER       less

    # ------------------------------
    # Tool-based variables
    set homebrew_path       "/opt/homebrew/bin/"
    set toolbox_path        "$HOME/toolbox"
    set cargo_path          "$HOME/.cargo/bin"

    set -gx fish_user_paths $toolbox_path $homebrew_path $cargo_path $fish_user_paths

    if not set -q TERMINAL
        set -Ux TERMINAL alacritty
    end
end

# If pyenv is installed, make sure it's been initialized
command -v pyenv >/dev/null
if test $status -eq 0
    echo "Initializing pyenv..."
    pyenv init - | source
end


# Signal that this file has been invoked
echo "-- Fish environment initialized"
