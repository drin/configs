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
set -gx PYENV_ROOT $HOME/code/tools/python/pyenv

set -gx PATH $HOME/.poetry/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $PYENV_ROOT/bin $PATH

if not set -q TERMINAL
    set -gx TERMINAL hyper
end

# ------------------------------
# env mutating commands
if test -f $PYENV_ROOT/bin/pyenv
    pyenv init - | source
end
