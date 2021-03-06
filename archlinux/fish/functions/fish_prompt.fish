# ------------------------------
# Customize fish prompt via fish_prompt function
# See: https://fishshell.com/docs/current/tutorial.html#tut_prompt
function fish_prompt --description 'Write out the prompt'
   #Save the return status of the previous command
   set stat $status

   #Set the color for the status depending on the value
   set __fish_color_status (set_color -o green)
   if test $stat -gt 0
      set __fish_color_status (set_color -o red)
   end

   switch $USER
       # Set prompt differently if root
       case root
           if not set -q __fish_prompt_cwd
               if set -q fish_color_cwd_root
                   set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)

               else
                   set -g __fish_prompt_cwd (set_color $fish_color_cwd)

               end
           end

           printf '%s %s@%s %s%s ' \
                  (date "+%H:%M") $USER $__fish_prompt_hostname \
                  "$__fish_prompt_cwd" (prompt_pwd)
       case '*'
           if not set -q __fish_prompt_cwd
               set -g __fish_prompt_cwd (set_color $fish_color_cwd)
           end

           printf '%s %s%s@%s %s%s ' \
                  (date "+%H:%M") \
                  "$__fish_color_blue" $USER $__fish_prompt_hostname \
                  "$__fish_prompt_cwd" (prompt_pwd)
   end

   set_color normal
   printf '%s ' (__fish_git_prompt)

end
