#!/bin/bash
grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)" ~/Pictures/screenshots/$(date +%Y-%m-%d-%H%M%S).png && notify-send "Screenshot Taken"
