#!/bin/sh
# Intercepts a shortcut, checks the underlying window and, depending on the
# match, resends it. Or does not.

W=$(xdotool getactivewindow)
S1=$(xprop -id "${W}" |awk -F '"' '/WM_CLASS/{print $4}')

if [ "$S1" = "pavucontrol" ]; then
    xvkbd -xsendevent -text "\C\Aq"
elif [ "$S1" != "Firefox" ] && [ "$S1" != "Firefox Developer Edition" ]; then
    xvkbd -xsendevent -text "\Cq"
fi
