# System / Power
alias suspend="systemctl suspend"
alias poweroff="systemctl poweroff"

# Navigation / File Management
#alias cd="z"
alias mkdir="mkdir -p"
alias open="xdg-open"

# System Info (Human-readable)
alias free="free -h"
alias df="df -h"
alias du="du -h"

# Editors / Configs
alias v="nvim"
alias swconf="nvim ~/.config/sway/config"

# Network
alias ipv4="ip -4 addr show | grep inet | grep -v 127.0.0.1 | awk '{print \$2}' | cut -d/ -f1"
alias ipv6="ip -6 addr show | grep inet6 | awk '{print \$2}' | sed -n '2p' | cut -d/ -f1"
alias wifi-login="io.elementary.capnet-assist"

# Package Management (Arch)
alias drop-caches='sudo paccache -rk3; paru -Sc --aur --noconfirm'

# File Listing (eza)
alias ls='eza --icons --color=auto --group-directories-first'
alias ll='eza -l --icons --color=auto --group-directories-first'
alias la='eza -la --icons --color=auto --group-directories-first'

# Utilities / Apps
alias tl="tldr --list | fzf --preview 'tldr {} --color always' | xargs tldr"
alias za="zathura"
alias neo="neo-matrix"
alias lo="libreoffice"
alias yy="yazi"

# Dev Tools
alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=wayland"
alias zed="zeditor"

# Git (Oh-My-Zsh style)
alias gss="git status -s"
alias glo="git log --oneline --graph --decorate"

