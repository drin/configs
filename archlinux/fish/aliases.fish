#!/usr/bin/fish

alias vim         'vim -O'
alias external-ip 'dig @resolver1.opendns.com ANY myip.opendns.com +short'
alias vpn-ucsc    'sudo openconnect --verbose vpn.ucsc.edu'


# ------------------------------
# Signal that this file has been invoked

# Only print if running interactively
if status -i
    echo "-- Fish aliases initialized"
end
