#!/opt/homebrew/bin/fish


# ------------------------------
# User fish environment configuration


# ..............................
# Non-idempotent configuration (execute once per environment)

if test -z $__custom_fish_config_initialized
    # so we only run this block once
    set -gx __custom_fish_config_initialized 1

    # so we can set the path idempotently
    set -gx default_path $fish_user_paths

    # Prompt content (calculate once for efficiency)
    if not set -q __fish_prompt_hostname
        command -v hostname >/dev/null
        if test $status -eq 0
            set -gx __fish_prompt_hostname (hostname -s)

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
end


# ..............................
# Idempotent configuration (may be executed many times)

# >> common env variables
set -gx GIT_EDITOR  vim
set -gx EDITOR      vim
set -gx PAGER       less
set -gx LANG        "en_US.UTF-8"


# tool-based convenience variables
set homebrew_path      "/opt/homebrew/bin"
set homebrew_tool_path "/opt/homebrew/opt"

set toolbox_path       "$HOME/toolbox"
set cargo_path         "$HOME/.cargo/bin"

set jdk_path           "$homebrew_tool_path/openjdk/bin"


set -gx fish_user_paths $toolbox_path  \
                        $homebrew_path \
                        $cargo_path    \
                        $jdk_path      \
                        $default_path


# If pyenv is installed, initialize it last
command -v pyenv >/dev/null
if test $status -eq 0
    echo "Initializing pyenv..."
    pyenv init --path | source
end


# Signal that this file has been invoked
echo "-- Fish environment initialized"
