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

# ------------------------------
# Environment variables
if not set -q TERMINAL
    set -gx TERMINAL hyper
end
