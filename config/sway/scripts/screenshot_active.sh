#!/bin/bash
monitor=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')
file=~/Pictures/screenshots/$(date +%Y-%m-%d-%H%M%S).png
grim -o "$monitor" "$file" && wl-copy < "$file" && notify-send "Screenshot Taken (Monitor $monitor)"
