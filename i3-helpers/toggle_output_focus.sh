#!/bin/env bash
# cycles output focus in the provided array
# e.g. toggle_output_focus.sh DP-0 DP-1 HDMI-1 will toggle focus from DP0 to DP-1, from DP-1 to HDMI-1
OUTPUTS=("$@")
CURRENT_OUTPUT=$(i3-msg -t get_workspaces | jq -r ".[] | select(.focused == true) | .output")

for i in "${!OUTPUTS[@]}"; do
    if [[ "${OUTPUTS[$i]}" = "${CURRENT_OUTPUT}" ]]; then
        NEXT_OUTPUT=$(( (i + 1) % ${#OUTPUTS[@]} ))
        i3-msg -- focus output "${OUTPUTS[$NEXT_OUTPUT]}" &>/dev/null
    fi
done

