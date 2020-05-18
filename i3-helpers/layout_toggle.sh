#!/bin/sh
# A firejail-aware utility to toggle keyboard layouts
# To work properly, the host xorg-server and the one running inside firejail
# must have same keyboard layouts in same orders
# Triggers a call to update i3blocks via signal
# Utilizes dunstify to replace the existing layout

kb_layout_toggle="xkblayout-state set +1"

#$notify_cmd "$(xkblayout-state print %n)"

# Checks if a firejail with the name provided to function exists.
# If so - toggle layout there
toggle_layout_in_firejail() {
    if firejail --list | tr ':' "\t" | awk '{ print $3 }' | grep -q "$1";  then
        # Need to disable shellcheck here, firejail relies on command splitting
        # shellcheck disable=SC2086
        firejail --quiet --join="$1" $kb_layout_toggle
    fi
}

send_notification() {
dunstify -u low -r 1000 -t 800 -a 'Input layout' "$1"
}

$kb_layout_toggle && pkill -SIGRTMIN+11 i3blocks
send_notification "$(xkblayout-state print %n)"
toggle_layout_in_firejail "firefox"
