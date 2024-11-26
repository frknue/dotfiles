##############################
# ZSH Configuration File (.zshrc)
# A structured and organized setup for enhanced productivity
##############################

# ---- Instant Prompt Setup ----
# Speed up shell startup by loading Powerlevel10k instant prompt if available
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---- Oh-My-Zsh ----
# Path to Oh-My-Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme configuration: Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins to load
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  web-search
)

# Source Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

########################
# Custom Aliases
########################
# General shortcuts
alias nv='nvim'
alias lv='lvim'
alias tm='tmux'
alias skr='~/skr.sh'

# Git shortcuts
alias g='git'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gpl='git pull'
alias gps='git push'
alias gco='git checkout'
alias gbr='git branch'
alias gdf='git diff'
alias gst='git status'

# Navigation shortcuts
alias cd="z" # Use Zoxide for smart directory navigation

########################
# Enhanced Tools
########################
# ---- FZF ----
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# ---- Zoxide (Better 'cd') ----
eval "$(zoxide init zsh)"

# ---- Powerlevel10k Prompt ----
# Customize prompt by running `p10k configure` or editing ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

########################
# Environment Variables
########################
# Node Version Manager (NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                # Load NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # Load NVM bash completion

# Add custom binary paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# Ruby Version Manager (rbenv)
eval "$(rbenv init -)"

# pnpm configuration
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;; # Skip if already in PATH
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Create a custom zsh widget
run_my_script() {
  ~/skr.sh
}

# Bind Ctrl-[ to the custom widget
zle -N run_my_script
bindkey '^[' run_my_script

##############################
# End of .zshrc
##############################
