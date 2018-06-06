if not set -q __fish_initialized
   init_fish
end

set fish_files $FISH_CONFIG_HOME/env.fish $FISH_CONFIG_HOME/aliases.fish
for fish_file in $fish_files
   if test -e $fish_file
      echo "=> Loading $fish_file"
      source $fish_file
   end
end
