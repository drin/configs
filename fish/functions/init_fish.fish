# ------------------------------
# Function to initialize fish so that code is not duplicated for the case where
# fish is not a default shell but we still want to set these things
function init_fish
   set -U __fish_initialized 1

   set -U FISH_CONFIG_HOME $HOME/.config/fish

   if test -n $SSH_AGENT_PID
      if not set -q SSH_AGENT_PID
         set -eU SSH_AGENT_PID
      end

      if not set -q SSH_AUTH_SOCK
         set -eU SSH_AUTH_SOCK
      end
   end

   # ------------------------------
   # Path environment variables
   set -gx PATH /usr/local/bin $PATH

   if test -d /home/drin/bin
      set -gx PATH /home/drin/bin $PATH
   end

   # ------------------------------
   # Editor environment variables
   if not set -q EDITOR
      set -Ux EDITOR vim
   end

   set -Ux GIT_EDITOR vim

   set -gx PAGER less

   launch_ssh_agent
end
