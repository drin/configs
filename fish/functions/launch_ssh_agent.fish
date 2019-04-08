# ---------------------
# Function to launch ssh agent and properly export SSH AGENT environment
# variables via a python script
function launch_ssh_agent
    set running_agent_pid (pgrep ssh-agent)

    if test -z $running_agent_pid
        echo "Launching new ssh agent..."

        eval (ssh-agent -c | sed 's/^setenv/set -gx/')

    else
        echo "ssh agent already running."

        if test -n SSH_AGENT_PID
            echo "clearing SSH_AGENT_PID: $SSH_AGENT_PID"
            set -ge SSH_AGENT_PID
        end

        if test -n SSH_AUTH_SOCK
            echo "clearing SSH_AUTH_SOCK: $SSH_AUTH_SOCK"
            set -ge SSH_AUTH_SOCK
        end

        set -gx SSH_AGENT_PID $running_agent_pid
        set -gx SSH_AUTH_SOCK (find /tmp -name 'agent.[[:digit:]]*' -type s)
    end
end
