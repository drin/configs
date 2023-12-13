#!/usr/bin/env fish


# ------------------------------
# User fish environment configuration


# ..............................
# Non-idempotent configuration (execute once per environment)

if test -z $__custom_fish_config_initialized
    if status -i
        echo "-- Initializing fish environment"
    end

    # so we only run this block once
    set -gx __custom_fish_config_initialized 1


    # >> so we can set the path idempotently
    # >> Add paths in reverse order (`fish_add_path` prepends by default)
    fish_add_path "/Library/Frameworks/Mono.framework/Versions/Current/Commands"
    fish_add_path "/Library/Apple/usr/bin"
    fish_add_path "/Library/TeX/texbin"
    fish_add_path "/Applications/Keybase.app/Contents/SharedSupport/bin"
    fish_add_path "/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin"
    fish_add_path "$HOME/.local/bin"
    fish_add_path "$HOME/.cargo/bin"
    fish_add_path "$HOME/toolbox/bin"


    # >> If pyenv is installed, initialize it last
    command -v pyenv >/dev/null
    if test $status -eq 0
        if status -i
          echo "Initializing pyenv..."
        end

        # pyenv init --path modifies PATH, but we just want the path
        fish_add_path (pyenv init --path | sed 's/.*\'\(.*\)\'.*/\1/')
    end

    # >> Prompt content (calculate once for efficiency)
    if not set -q __fish_prompt_hostname
        command -v hostname >/dev/null
        if test $status -eq 0
            set -gx __fish_prompt_hostname (hostname -s)

        else
            set -gx __fish_prompt_hostname "octalene-container"

        end
    end

    # Forces true color mode; mostly useful for remote sessions?
    set -g fish_term24bit 1

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
set -gx LANG       "en_US.UTF-8"

# for gpg-agent
set -gx GPG_TTY    (tty)


# >> add different homebrew path based on architecture
if test (uname -m) = "x86_64"
    fish_add_path "/usr/local/Homebrew/bin"

else
    fish_add_path "/opt/homebrew/bin"

end


# ------------------------------
# Signal that this file has been invoked

# Only print if running interactively
if status -i
  echo "-- Fish environment initialized"
end
