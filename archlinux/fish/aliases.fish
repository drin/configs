#!/usr/bin/fish

alias vim         'vim -O'
alias external-ip 'dig @resolver1.opendns.com ANY myip.opendns.com +short'
alias vpn-ucsc    'sudo openconnect --verbose 128.114.102.44:443'


# ------------------------------
# Signal that this file has been invoked
echo "-- Fish aliases initialized"
