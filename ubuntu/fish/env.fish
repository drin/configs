if test -z $__custom_fish_config_initialized
    echo "=> Initializing Fish environment"

    set -gx __custom_fish_config_initialized 1
    set -gx FISH_CONFIG_HOME $HOME/.config/fish

    # ------------------------------
    # Prompt variables
    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        if test -n (type hostname)
            set -gx __fish_prompt_hostname (hostname)
        else
            set -gx __fish_prompt_hostname "octalene-container"
        end
    end

    if not set -q __fish_prompt_normal
        set -gx __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_color_blue
        set -gx __fish_color_blue (set_color -o blue)
    end

    # ------------------------------
    # Common env variables
    set -Ux EDITOR                                   vim
    set -Ux GIT_EDITOR                               vim
    set -Ux PAGER                                    less

    # ------------------------------
    # Tool-based variables
    set -gx PYENV_ROOT            $HOME/toolbox/pyenv
    set -gx npm_config_prefix     $HOME/.npm_modules

    set pyenv_path                $PYENV_ROOT/bin
    set poetry_path               $HOME/.poetry/bin

    set -gx fish_user_paths       $HOME/toolbox $pyenv_path $poetry_path $fish_user_paths

    # ------------------------------
    # Variables to merge later
    # set -gx PATH /usr/lib/postgresql/13/bin          $PATH

    if not set -q TERMINAL
        set -Ux TERMINAL alacritty
    end

    # ------------------------------
    # Load PyEnv
    if test -f $PYENV_ROOT/bin/pyenv
        echo "Initializing pyenv..."
        pyenv init - | source
    end
end

echo "-- Fish environment initialized"
