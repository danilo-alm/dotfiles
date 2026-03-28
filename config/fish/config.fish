
if status is-interactive
    # Initialize zoxide for fish
    zoxide init fish | source
end

set -x QT_QPA_PLATFORMTHEME qt5ct
set -x QT_QPA_PLATFORMTHEME qt6ct

set -x PATH $HOME/.local/bin $PATH
set -x PATH $PATH /usr/local/go/bin
set -x PATH $PATH $HOME/go/bin
set -x EDITOR vim
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gcr/ssh
set -x DOCKER_HOST unix://$XDG_RUNTIME_DIR/docker.sock
set -x MAKEFLAGS "--jobs=(nproc)"
set -x npm_config_prefix $HOME/.local
set -x FZF_CTRL_T_COMMAND ""
set -U fish_greeting

abbr -a tkill 'tmux kill-session -t'
abbr -a tka 'tmux kill-session -a'
mise activate fish | source
