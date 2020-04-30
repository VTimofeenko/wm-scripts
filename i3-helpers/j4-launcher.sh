#!/bin/bash

j4_usage_log="${HOME}/.cache/j4"
# This file may be used to exclude certain entries from the .desktop list
desktop_filter="${HOME}/.config/j4-dmenu-desktop/desktop_filter"

if [ ! -f "${desktop_filter}" ]; then
    touch "${desktop_filter}"
fi

j4-dmenu-desktop --usage-log="$j4_usage_log"\
    --dmenu="cat | grep -v -Fx -f ${desktop_filter} | dmenu -i -l 10 -p \"Run:\""\
    | xargs "i3-msg exec --no-startup-id"

