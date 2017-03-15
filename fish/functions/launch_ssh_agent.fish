# ---------------------
# Function to launch ssh agent and properly export SSH AGENT environment
# variables via a python script
function launch_ssh_agent
   if test -z $SSH_AGENT_PID
      echo "Launching new ssh agent..."

      eval (ssh-agent -c | sed 's/^setenv/set -Ux/')

   else
      echo "ssh agent already running."

      if not set -q SSH_AGENT_PID
         set -Ux SSH_AGENT_PID (pgrep ssh-agent)
      end

      if not set -q SSH_AUTH_SOCK
         set -Ux SSH_AUTH_SOCK (find /tmp -name 'agent.[[:digit:]]*' -type s)
      end
   end
end
