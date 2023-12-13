#!/usr/bin/env fish

alias vim         'vim -O'
alias external-ip 'dig @resolver1.opendns.com ANY myip.opendns.com +short'
alias vpn-ucsc    'sudo openconnect --verbose https://vpn.ucsc.edu/'

# because fish is installed by brew, and thus architecture dependent
alias amdfish     'arch -x86_64 /usr/local/bin/fish'
alias armfish     'arch -arm64  /opt/homebrew/bin/fish'


# ------------------------------
# Signal that this file has been invoked

# Only print if running interactively
if status -i
    echo "-- Fish aliases initialized"
end
