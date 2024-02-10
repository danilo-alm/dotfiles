# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH=/usr/share/oh-my-zsh/

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode disabled  # disable automatic updates

plugins=(
  gitignore
  git
  git-commit
  history
  command-not-found
)

source $ZSH/oh-my-zsh.sh
source ~/.aliases.zsh

export PATH=$PATH:$HOME/.local/bin
export EDITOR='nvim'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(zoxide init zsh)"

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh