#!/bin/sh

focused_window_border_mode="$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true).border')"

case "$focused_window_border_mode" in
    none) new_border_mode="pixel" ;;
    *)    new_border_mode="none"  ;;
esac

swaymsg "[workspace=__focused__] border $new_border_mode"
