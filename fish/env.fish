# To make sure this only gets loaded once
if status --is-login
   # ------------------------------
   # Path environment variables
   set -gx PATH /home/drin/bin /usr/local/bin $PATH

   # ------------------------------
   # Editor environment variables
   set -Ux EDITOR vim
   set -Ux GIT_EDITOR vim

   set -gx PAGER less
end

# ------------------------------
# Prompt variables
# Just calculate these once, to save a few cycles when displaying the prompt
if not set -q __fish_prompt_hostname
   set -gx __fish_prompt_hostname (hostname)
end

if not set -q __fish_prompt_normal
   set -gx __fish_prompt_normal (set_color normal)
end

if not set -q __fish_color_blue
   set -gx __fish_color_blue (set_color -o blue)
end
