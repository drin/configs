#!/usr/bin/fish


# ------------------------------
# User fish environment configuration


# ..............................
# Non-idempotent configuration (execute once per environment)

if test -z $__custom_fish_config_initialized
    echo "-- Initializing fish environment"

    # so we only run this block once
    set -gx __custom_fish_config_initialized 1

    # so we can set the path idempotently
    set -gx default_path $fish_user_paths


    # >> so we can set the path idempotently
    # >> Add paths in reverse order (`fish_add_path` prepends by default)
    fish_add_path "/var/lib/snapd/snap/bin"
    fish_add_path "$HOME/.cargo/bin"
    fish_add_path "$HOME/toolbox/bin"

    # >> If pyenv is installed, initialize it last; based on `pyenv init --path`
    which -- pyenv >/dev/null 2>&1
    if test "$status" -eq 0
        echo "Initializing pyenv..."
        fish_add_path "$HOME/.pyenv/shims"
        command pyenv rehash 2>/dev/null
    end


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
set -gx GIT_EDITOR  vim
set -gx EDITOR      vim
set -gx PAGER       less

# for gpg-agent
set -gx GPG_TTY     (tty)


# >> path-related env variables

# tool-based paths (how they orient themselves)
set -gx npm_config_prefix "$HOME/.npm_modules"


# ------------------------------
# Signal that this file has been invoked

# Only print if running interactively
if status -i
    echo "-- Fish environment initialized"
end
