if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
fpath+=~/.zsh/completions
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

autoload -U compinit && compinit

export ZSH=~/.oh-my-zsh/
export PATH="$HOME/.local/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export EDITOR='vim'
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
export MAKEFLAGS="--jobs=$(nproc)"
export npm_config_prefix="$HOME/.local"

ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

plugins=(
  gitignore
  git
  git-commit
  history
)

source ~/.aliases.zsh
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/share/command-not-found/command-not-found
zstyle ':omz:update' mode disabled  # disable automatic updates

eval "$(zoxide init zsh)"

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		\cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

source ~/.atuin.zsh
