if status --is-login
   set -U FISH_CONFIG_HOME $HOME/.config/fish

   # ------------------------------
   # functions to execute at the end of fish configuration
   launch_ssh_agent
end

set fish_files $FISH_CONFIG_HOME/env.fish $FISH_CONFIG_HOME/aliases.fish
for fish_file in $fish_files
   if test -e $fish_file
      echo "=> Loading $fish_file"
      source $fish_file
   end
end
