set fish_config_dir ~/.config/fish
set fish_files $fish_config_dir/env.fish $fish_config_dir/aliases.fish $fish_config_dir/functions.fish

for fish_file in $fish_files
   if [ -e $fish_file ]
      echo "=> Loading $fish_file"
      source $fish_file
   end
end
