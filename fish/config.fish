# Only do this if the session is interactive
if status --is-interactive
    if test -e $HOME/.config/fish
        set fish_files $HOME/.config/fish/env.fish $HOME/.config/fish/aliases.fish

        for fish_file in $fish_files
           if test -e $fish_file
              echo "=> Loading $fish_file"
              source $fish_file
           end
        end
    end
end
