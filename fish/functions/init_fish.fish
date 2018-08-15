# ------------------------------
# Function to initialize fish so that code is not duplicated for the case where
# fish is not a default shell but we still want to set these things
function init_fish
   echo "=> Initializing FISH"

   set -U __fish_initialized 1
   set -U FISH_CONFIG_HOME $HOME/.config/fish

   # ------------------------------
   # Path environment variables
   set -gx PATH /usr/local/bin $PATH

   if test -d /home/drin/bin
      set -gx PATH /home/drin/bin $PATH
   end

   # ------------------------------
   # Editor environment variables
   set -Ux EDITOR vim
   set -Ux GIT_EDITOR vim
   set -gx PAGER less

   launch_ssh_agent
end
