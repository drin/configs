#!/usr/bin/env fish

alias vim         'vim -O'
alias external-ip 'dig @resolver1.opendns.com ANY myip.opendns.com +short'
alias vpn-ucsc    'sudo openconnect --verbose 128.114.102.44:443'

# because fish is installed by brew, and thus architecture dependent
alias amdfish     'arch -x86_64 /usr/local/bin/fish'
alias armfish     'arch -arm64  /opt/homebrew/bin/fish'
