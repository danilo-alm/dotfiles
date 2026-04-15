#!/bin/bash
file=~/Pictures/screenshots/$(date +%Y-%m-%d-%H%M%S).png
window=$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .focused?) | .name')
grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp)" "$file" && wl-copy < "$file" && notify-send "Window Screenshot Taken: $window"
