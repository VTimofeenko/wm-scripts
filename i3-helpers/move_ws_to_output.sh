#!/bin/env bash
# Moves workspace to the next output, similar to toggle_output_focus.sh

OUTPUTS=("$@")
CURRENT_OUTPUT=$(i3-msg -t get_workspaces | jq -r ".[] | select(.focused == true) | .output")

for i in "${!OUTPUTS[@]}"; do
    if [[ "${OUTPUTS[$i]}" = "${CURRENT_OUTPUT}" ]]; then
        NEXT_OUTPUT=$(( (i + 1) % ${#OUTPUTS[@]} ))
        i3-msg -- move workspace to output "${OUTPUTS[$NEXT_OUTPUT]}" &>/dev/null
        i3-msg -- focus output "${OUTPUTS[$NEXT_OUTPUT]}" &>/dev/null
    fi
done


