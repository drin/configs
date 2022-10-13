#!/usr/bin/fish

alias vim         'vim -O'
alias external-ip 'dig @resolver1.opendns.com ANY myip.opendns.com +short'
alias vpn-ucsc    'sudo openconnect --verbose vpn.ucsc.edu'
alias vdown       'pactl set-sink-volume (pactl list short sinks | grep bluez_sink* | cut -f1) -5%'
alias vup         'pactl set-sink-volume (pactl list short sinks | grep bluez_sink* | cut -f1) +5%'
alias vcheck      'pactl get-sink-volume (pactl list short sinks | grep bluez_sink* | cut -f1)'


# ------------------------------
# Signal that this file has been invoked

# Only print if running interactively
if status -i
    echo "-- Fish aliases initialized"
end
