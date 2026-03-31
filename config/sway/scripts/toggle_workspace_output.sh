#!/bin/bash

focused_ws=$(swaymsg -t get_workspaces | jq -c '.[] | select(.focused)')

current_output=$(echo "$focused_ws" | jq -r '.output')
workspace_name=$(echo "$focused_ws" | jq -r '.name')

output1="DP-2"
output2="HDMI-A-4"

if [ "$current_output" == "$output1" ]; then
    target_output="$output2"
elif [ "$current_output" == "$output2" ]; then
    target_output="$output1"
else
    echo "Focused workspace is on an unrecognized output: $current_output"
    exit 1
fi

swaymsg move workspace to output "$target_output"

