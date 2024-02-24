if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:$HOME/.local/bin
export EDITOR='vim'

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
  command-not-found
  dnf
)

source ~/.aliases.zsh
source $ZSH/oh-my-zsh.sh
source /usr/share//zsh-autosuggestions/zsh-autosuggestions.zsh
zstyle ':omz:update' mode disabled  # disable automatic updates

eval "$(zoxide init zsh)"

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
