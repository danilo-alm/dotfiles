#!/bin/bash
output="$1"

for ws in $(swaymsg -t get_workspaces | jq -r '.[].name'); do
  if [[ "$ws" != "10" ]]; then
    swaymsg workspace "$ws"
    swaymsg move workspace to output "$output"
  fi
done

