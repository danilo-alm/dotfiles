swayidle -w timeout 120 'swaylock -f -c 000000' \
            timeout 200 'hyprctl dispatch dpms off' \
            resume 'hyprctl dispatch dpms on' \
            timeout 900 'systemctl suspend' \
            before-sleep 'swaylock -f -c 000000' &
