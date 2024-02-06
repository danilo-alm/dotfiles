muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [ "$muted" == "no" ]; then
    pamixer --get-volume
else
    echo 0
fi
