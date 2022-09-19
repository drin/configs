#!/opt/homebrew/bin/fish


# ------------------------------
# Function to configure gpg agent
function launch_gpg_agent

    # First, we check that gpg agent is a thing
    command -v gpg-connect-agent >/dev/null
    if test $status -eq 0

        # Then, we want to set the SSH auth socket to the gpg agent
        set -gx SSH_AUTH_SOCK "$(gpgconf --list-dirs agent-ssh-socket)"

        # Finally, we restart the gpg agent. Not sure if this needs to be done for each tty
        echo "updating gpg agent tty..."
        gpg-connect-agent updatestartuptty /bye
    end

end
