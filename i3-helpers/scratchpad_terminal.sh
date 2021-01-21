#!/bin/bash
# Script that checks if scratchpad terminal is running.
# If it is - show scratchpad
# If it is not - launch it and show
# Accepts terminal as the first parameter
# Accepts terminal title as the second parameter
set -euo pipefail

TERM=$1
TERM_TITLE=$2
command -v rg >/dev/null && alias grep="rg" # use ripgrep if present

is_terminal_running() {
    if i3-msg -t get_tree | grep "$TERM_TITLE" >/dev/null; then
        return 0
    else
        return 1
    fi
}

# If the terminal is not running - start it
if ! is_terminal_running; then
    i3-msg exec "$TERM -T \"$TERM_TITLE\"" >/dev/null
fi

# Start cycle, trying to open the scratchpad.
# Should cover cases when terminal takes a little to start up
# Maybe handle this through startup notifications?
for ((i = 0 ; i < 10 ; i++)); do
    # Try to show the terminal
    if is_terminal_running; then
        i3-msg scratchpad show >/dev/null
        exit
    fi
    sleep 0.1
done

# If the loop is not broken - alert the user
notify-send -a "scratchpad_terminal" "Could not show scratchpad"
