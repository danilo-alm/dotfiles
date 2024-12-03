
alias suspend="systemctl suspend"

alias swconf="nvim ~/.config/sway/config"
alias v="nvim"
alias cd="z"

# Human
alias free="free -h"
alias df="df -h"
alias du="du -h"

alias mkdir="mkdir -p"
alias trash="send2trash"

alias open="xdg-open"
alias tl="tldr --list | fzf --preview 'tldr {} --color always' | xargs tldr"
alias hypr="vim .config/hypr/hyprland.conf.d/"
alias mon="vim ~/.config/hypr/hyprland.conf.d/11-monitors.conf"
alias monitors="vim ~/.config/hypr/hyprland.conf.d/11-monitors.conf"
alias mond='hyprctl keyword monitor "eDP-1, disable"'
alias mone='hyprctl keyword monitor "eDP-1, preferred, 0x0, 1"'
