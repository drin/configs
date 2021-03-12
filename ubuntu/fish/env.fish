#!/usr/bin/fish


# ------------------------------
# User fish environment configuration


# ..............................
# Non-idempotent configuration (execute once per environment)

if test -z $__custom_fish_config_initialized
    # so we only run this block once
    set -gx __custom_fish_config_initialized 1

    # so we can set the path idempotently
    set -gx default_path $fish_user_paths

    # >> Prompt variables (calculate once for efficiency)
    # set hostname (assume container if `hostname` is not available)
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
end


# ..............................
# Idempotent configuration (may be executed many times)

# >> common env variables
set -gx GIT_EDITOR vim
set -gx EDITOR     vim
set -gx PAGER      less


# >> path-related env variables

# tool-based paths (how they orient themselves)
set -gx POETRY_HOME       "$HOME/toolbox/poetry"
set -gx PYENV_ROOT        "$HOME/toolbox/pyenv"
set -gx npm_config_prefix "$HOME/.npm_modules"

# tool-based convenience variables
set toolbox_path  "$HOME/toolbox/bin"
set cargo_path    "$HOME/.cargo/bin"
set postgres_path "/usr/lib/postgresql/13/bin"

set -gx fish_user_paths $toolbox_path $cargo_path $postgres_path $default_path


# If pyenv is installed, initialize it last
command -v pyenv >/dev/null
if test $status -eq 0
    echo "Initializing pyenv..."
    pyenv init - | source
end


# ------------------------------
# Signal that this file has been invoked
echo "-- Fish environment initialized"
