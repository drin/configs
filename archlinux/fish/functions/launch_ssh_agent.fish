#!/usr/bin/fish


# ---------------------
# Function to launch ssh agent and properly export SSH AGENT environment
# variables via a python script
function launch_ssh_agent

    which -- gpg-connect-agent >/dev/null 2>&1

    # >> Launch gpg-agent instead of ssh-agent
    if test "$status" -eq 0
        set -gx SSH_AUTH_SOCK "$(gpgconf --list-dirs agent-ssh-socket)"
        gpg-connect-agent updatestartuptty /bye

    # >> Launch ssh-agent per usual
    else

        # >> Launch new ssh-agent (so env variables should be set appropriately)
        if test -z (pgrep ssh-agent)
            echo "Launching new ssh agent..."

            eval (ssh-agent -c | sed 's/^setenv/set -gx/')

        # >> Weird state; clear env variables and try to set them correctly
        else
            echo "ssh agent already running."

            if test -n "$SSH_AGENT_PID"
                echo "clearing SSH_AGENT_PID: $SSH_AGENT_PID"
                set -ge SSH_AGENT_PID
            end

            if test -n "$SSH_AUTH_SOCK"
                echo "clearing SSH_AUTH_SOCK: $SSH_AUTH_SOCK"
                set -ge SSH_AUTH_SOCK
            end

            set -gx SSH_AGENT_PID (pgrep ssh-agent)
            set -gx SSH_AUTH_SOCK (find /tmp -name 'agent.[[:digit:]]*' -type s 2> /dev/null)
        end
    end
end
