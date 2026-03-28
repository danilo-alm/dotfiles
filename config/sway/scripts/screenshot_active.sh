#!/bin/bash
monitor=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')
grim -o "$monitor" ~/Pictures/screenshots/$(date +%Y-%m-%d-%H%M%S).png && notify-send "Screenshot Taken (Monitor $monitor)" 
