# ------------------------------
# Path environment variables
set --export PATH /usr/local/bin $PATH 

# ------------------------------
# Editor environment variables
set --export EDITOR vim
set --export GIT_EDITOR vim

# ------------------------------
# Prompt variables

# Just calculate these once, to save a few cycles when displaying the prompt
if not set -q __fish_prompt_hostname
   set -g __fish_prompt_hostname (hostname)
end

if not set -q __fish_prompt_normal
   set -g __fish_prompt_normal (set_color normal)
end

if not set -q __fish_color_blue
   set -g __fish_color_blue (set_color -o blue)
end
