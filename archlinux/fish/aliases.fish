#!/usr/bin/fish

alias vim           'vim -O'
alias external-ip   'dig @resolver1.opendns.com ANY myip.opendns.com +short'
alias vpn-ucsc      'sudo openconnect --verbose vpn.ucsc.edu'
alias vdown         'pactl set-sink-volume (pactl list short sinks | grep "bluez_sink.30_50_75_" | cut -f1) -5%'
alias vup           'pactl set-sink-volume (pactl list short sinks | grep "bluez_sink.30_50_75_" | cut -f1) +5%'
alias vcheck        'pactl get-sink-volume (pactl list short sinks | grep "bluez_sink.30_50_75_" | cut -f1)'

alias set-mon-dual  'xrandr --output HDMI-A-0      --auto --primary --output DisplayPort-1 --left-of HDMI-A-0 --auto'
alias set-mon-right 'xrandr --output HDMI-A-0      --auto --primary --output DisplayPort-1 --off'
alias set-mon-left  'xrandr --output DisplayPort-1 --auto --primary --output HDMI-A-0      --off'

alias set-wallpapers 'feh --bg-max "$primary_wp" "$secondary_wp"'


# ------------------------------
# Signal that this file has been invoked

# Only print if running interactively
if status -i
    echo "-- Fish aliases initialized"
end
