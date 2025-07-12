
alias suspend="systemctl suspend"

alias swconf="nvim ~/.config/sway/config"
alias v="nvim"
alias cd="z"

# Human
alias free="free -h"
alias df="df -h"
alias du="du -h"

alias mkdir="mkdir -p"

alias open="xdg-open"
alias tl="tldr --list | fzf --preview 'tldr {} --color always' | xargs tldr"
alias hypr="vim ~/.config/hypr/hyprland.conf.d/"
alias mon="vim ~/.config/hypr/hyprland.conf.d/11-monitors.conf"
alias monitors="vim ~/.config/hypr/hyprland.conf.d/11-monitors.conf"
alias mond='hyprctl keyword monitor "eDP-1, disable"'
alias mone='hyprctl keyword monitor "eDP-1, preferred, 0x0, 1"'
alias wifi-login="io.elementary.capnet-assist"
alias za="zathura"
alias neo="neo-matrix"

alias drop-caches='sudo paccache -rk3; paru -Sc --aur --noconfirm'
alias update-all='export TMPFILE="$(mktemp)"; \
    sudo true; \
    rate-mirrors --save=$TMPFILE arch --max-delay=21600 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && drop-caches \
      && paru -Syyu'

alias poweroff="systemctl poweroff"
alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=wayland"
alias lo="libreoffice"
