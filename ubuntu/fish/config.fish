if test -e $HOME/.config/fish
    set -Ux FISH_CONFIG_HOME $HOME/.config/fish
end


if set -q "FISH_CONFIG_HOME"
    set fish_files $FISH_CONFIG_HOME/env.fish $FISH_CONFIG_HOME/aliases.fish

    for fish_file in $fish_files
       if test -e $fish_file
          echo "=> Loading $fish_file"
          source $fish_file
       end
    end
end

