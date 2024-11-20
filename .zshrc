if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

################## ALIAS ##################
alias nv='nvim'
alias lv='lvim'
alias g='git'
alias tm='tmux'
# git commands
alias gaa='git add --all'
alias gcm='git commit -m'
alias gpl='git pull'
alias gps='git push'
alias gco='git checkout'
alias gbr='git branch'
alias gdf='git diff'
alias gst='git status'
alias skr='~/skr.sh'
alias cd="z"
################## ALIAS ##################
#
# ---- FZF -----
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.local/bin:$PATH"

export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
eval "$(rbenv init -)"

# pnpm
export PNPM_HOME="/Users/furkanulker/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
