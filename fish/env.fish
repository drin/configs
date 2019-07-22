if test $__fish_initialized -ne 1
    echo "=> Initializing Fish environment"

    set -gx __fish_initialized 1
    set -gx FISH_CONFIG_HOME $HOME/.config/fish

    # ------------------------------
    # Prompt variables
    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        if test -f /usr/bin/hostname
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
    # Env Variables
    set -Ux EDITOR     vim
    set -Ux GIT_EDITOR vim

    set -gx PAGER      less
    set -gx PYENV_ROOT $HOME/code/tools/python/pyenv

    set -gx PATH $HOME/.poetry/bin                   $PATH
    set -gx PATH $HOME/.cargo/bin                    $PATH
    set -gx PATH $PYENV_ROOT/bin                     $PATH
    set -gx PATH $HOME/toolbox                       $PATH
    set -gx PATH $HOME/toolbox/h5/bin                $PATH
    set -gx PATH $HOME/toolbox/pyflame/bin           $PATH
    set -gx PATH $HOME/toolbox/cellranger/bin        $PATH
    set -gx PATH $HOME/toolbox/cellranger/tenkit/bin $PATH

    if not set -q TERMINAL
        set -gx TERMINAL hyper
    end

    # ------------------------------
    # Load Google Cloud SDK
    set gcloud_home "$HOME/packages/source/google-cloud-sdk/google-cloud-sdk"
    if test -f $gcloud_home
        . $gcloud_home/path.fish.inc
    end

    # ------------------------------
    # Load PyEnv
    if test -f $PYENV_ROOT/bin/pyenv
        pyenv init - | source
    end
end

echo "-- Fish environment initialized"
