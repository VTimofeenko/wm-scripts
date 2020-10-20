#!/bin/env bash
# Moves workspace to the next output, similar to toggle_output_focus.sh

ARGV=("$@")
CURRENT_OUTPUT=$(i3-msg -t get_workspaces | jq -r ".[] | select(.focused == true) | .output")

first_arg=${ARGV[0]}

if [ "${first_arg}" == "container" ] || [ "${first_arg}" == "workspace" ]; then
    OUTPUTS=("${ARGV[@]:1}")
    for i in "${!OUTPUTS[@]}"; do
        if [[ "${OUTPUTS[$i]}" = "${CURRENT_OUTPUT}" ]]; then
            NEXT_OUTPUT=$(( (i + 1) % ${#OUTPUTS[@]} ))
            i3-msg -- move "${first_arg}" to output "${OUTPUTS[$NEXT_OUTPUT]}" &>/dev/null
            i3-msg -- focus output "${OUTPUTS[$NEXT_OUTPUT]}" &>/dev/null
        fi
    done
fi

