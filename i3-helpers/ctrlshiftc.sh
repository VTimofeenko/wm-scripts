#!/bin/sh
# Catches ctrl+shift+c in Firefox and resends ctrl+c

W=$(xdotool getactivewindow)
S1=$(xprop -id "${W}" |awk -F '"' '/WM_CLASS/{print $4}')
if [ "$S1" != "Firefox" ] && [ "$S1" != "Firefox Developer Edition" ]; then
        xvkbd -xsendevent -text "\C\Sc"
else
        xvkbd -xsendevent -text "\Cc"
fi

