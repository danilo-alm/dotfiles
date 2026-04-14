#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: No output specified."
  exit 1
fi

output="$1"

for ws in $(swaymsg -t get_workspaces | jq -r '.[].name'); do
  if [[ "$ws" != "10" ]]; then
    swaymsg workspace "$ws" || exit 1
    swaymsg move workspace to output "$output" || exit 1
  fi
done
