#!/usr/bin/fish


# ------------------------------
# Global variables
set fish_configdir "$HOME/.config/fish"
set fish_configs   "env.fish" "aliases.fish"


# ------------------------------
# Load config files
if test -d "$fish_configdir"

    for fish_file in $fish_configs
        if test -e "$fish_configdir/$fish_file"
            source "$fish_configdir/$fish_file"
        end
    end

end
