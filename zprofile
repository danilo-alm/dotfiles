[ -f /etc/profile ] && . /etc/profile

export XCURSOR_THEME=Bibata-Modern-Ice
export XCURSOR_SIZE=24 
export GTK_THEME=Adwaita:dark
export QT_QPA_PLATFORMTHEME=qt5ct:qt6ct

if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
    exec sway
fi
