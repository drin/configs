# ---------------------
# Function to launch ssh agent and properly export SSH AGENT environment
# variables via a python script
function launch_ssh_agent
   if test -z $SSH_AGENT_PID
      echo "Launching new ssh agent..."

      eval (ssh-agent -c | sed 's/^setenv/set -Ux/')

   else
      echo "ssh agent already running."

      if set -q SSH_AGENT_PID
          echo "clearing SSH_AGENT_PID: $SSH_AGENT_PID"
          set -ge SSH_AGENT_PID
      end

      if set -q SSH_AUTH_SOCK
          echo "clearing SSH_AUTH_SOCK: $SSH_AUTH_SOCK"
          set -ge SSH_AUTH_SOCK
      end

     set -gx SSH_AGENT_PID (pgrep ssh-agent)
     set -gx SSH_AUTH_SOCK (find /tmp -name 'agent.[[:digit:]]*' -type s 2> /dev/null)
   end
end
