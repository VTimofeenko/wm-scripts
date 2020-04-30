#!/bin/sh

workspace_name=$(i3-msg -t get_workspaces | jq -r '.[] | select(."focused" == true) | .["name"]')
current_gaps_value=$(i3-msg -t get_tree | jq -r 'recurse(.nodes[]) | select(.type == "workspace" and .name == "'"$workspace_name"'") | .gaps.inner ')

if [ "$current_gaps_value" -eq 0 ]; then
    i3-msg gaps inner current set 0;
    i3-msg gaps outer current set 0;
else
    i3-msg gaps inner current set 10;
    i3-msg gaps outer current set 10;
fi
