# ------------------------------
# Function to initialize fish so that code is not duplicated for the case where
# fish is not a default shell but we still want to set these things
function init_fish
   set -U __fish_initialized 1

   set -U FISH_CONFIG_HOME $HOME/.config/fish

   if test -n $SSH_AGENT_PID
      set -eU SSH_AGENT_PID
      set -eU SSH_AUTH_SOCK
   end

   # ------------------------------
   # Path environment variables
   set -gx PATH /home/drin/bin /usr/local/bin $PATH

   # ------------------------------
   # Editor environment variables
   set -Ux EDITOR vim
   set -Ux GIT_EDITOR vim

   set -gx PAGER less

   launch_ssh_agent
end
